import { computed, reactive, ref } from 'vue';
import { defineStore } from 'pinia';
import { useLoading } from '@sa/hooks';
import { SetupStoreId } from '@/enum';
import { useRouterPush } from '@/hooks/common/router';
import { localStg } from '@/utils/storage';
import { $t } from '@/locales';
import { useRouteStore } from '../route';
import { clearAuthStorage, emptyInfo, getToken } from './shared';

export const useAuthStore = defineStore(SetupStoreId.Auth, () => {
  const routeStore = useRouteStore();
  const { route, toLogin, redirectFromLogin } = useRouterPush(false);
  const { loading: loginLoading, startLoading, endLoading } = useLoading();

  const token = ref(getToken());

  const userInfo: Api.Auth.UserInfo = reactive(emptyInfo);
  const permissions = computed(() => userInfo.permissions);

  watch(
    () => token.value,
    async value => {
      if (value && !userInfo.user && !route.value.path.includes('login')) {
        refreshUserInfo();
      }
    },
    {
      immediate: true
    }
  );

  /** is super role in static route */
  const isStaticSuper = computed(() => {
    const { VITE_AUTH_ROUTE_MODE, VITE_STATIC_SUPER_ROLE } = import.meta.env;

    return VITE_AUTH_ROUTE_MODE === 'static' && userInfo.roles?.includes(VITE_STATIC_SUPER_ROLE);
  });

  /** Is login */
  const isLogin = computed(() => Boolean(token.value));

  /**
   * Reset auth store
   *
   * @param isMe [isMe=false] Whether to reset the store by yourself. Default is `false`
   */
  async function resetStore(isMe = false) {
    if (isMe) {
      doDeleteLogout();
    }

    const authStore = useAuthStore();
    authStore.$reset();
    clearAuthStorage();

    if (!route.value.meta.constant) {
      await toLogin();
    }

    routeStore.resetStore();
  }

  /**
   * Login
   *
   * @param username User name
   * @param password Password
   * @param [redirect=true] Whether to redirect after login. Default is `true`
   */
  async function login(
    params: { loginForm: Api.Auth.LoginBody; onError?: () => void; onSuccess?: () => void },
    redirect = true
  ) {
    const { loginForm, onError, onSuccess } = params;
    startLoading();

    const { data: loginToken, error } = await fetchLogin(loginForm);

    if (!error) {
      const pass = await loginByToken(loginToken);
      onSuccess && onSuccess();
      if (pass) {
        await routeStore.initAuthRoute();

        if (redirect) {
          await redirectFromLogin();
        }

        if (routeStore.isInitAuthRoute) {
          $notification?.success({
            message: $t('page.login.common.loginSuccess'),
            description: $t('page.login.common.welcomeBack', { username: userInfo?.user?.nickName })
          });
        }
      }
    } else {
      onError && onError();
      resetStore();
    }

    endLoading();
  }

  async function loginByToken(loginToken: Api.Auth.LoginToken) {
    // 1. stored in the localStorage, the later requests need it in headers
    localStg.set('token', loginToken.access_token);
    localStg.set('refreshToken', loginToken.refreshToken);
    token.value = loginToken.access_token;

    const isSuccess = await refreshUserInfo();

    return isSuccess;
  }

  async function refreshUserInfo() {
    const { data: info, error } = await doGetUserInfo();
    if (!error) {
      Object.assign(userInfo, info);
      return true;
    }
    return false;
  }

  return {
    token,
    userInfo,
    isStaticSuper,
    isLogin,
    loginLoading,
    resetStore,
    permissions,
    login,
    refreshUserInfo
  };
});
