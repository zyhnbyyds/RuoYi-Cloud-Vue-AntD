import { computed, reactive, ref } from 'vue';
import { defineStore } from 'pinia';
import { useLoading } from '@sa/hooks';
import { SetupStoreId } from '@/enum';
import { useRouterPush } from '@/hooks/common/router';
import { doGetUserInfo, doPostLogin, fetchLogout } from '@/service/api';
import { localStg } from '@/utils/storage';
import { $t } from '@/locales';
import { useRouteStore } from '../route';
import { clearAuthStorage, getToken, getUserInfo } from './shared';

export const useAuthStore = defineStore(SetupStoreId.Auth, () => {
  const routeStore = useRouteStore();
  const { route, toLogin, redirectFromLogin } = useRouterPush(false);
  const { loading: loginLoading, startLoading, endLoading } = useLoading();

  const token = ref(getToken());

  const userInfo: Api.Auth.UserInfo = reactive(getUserInfo());

  /** Is login */
  const isLogin = computed(() => Boolean(token.value));

  /** Reset auth store */
  async function resetStore() {
    const authStore = useAuthStore();

    clearAuthStorage();

    authStore.$reset();

    fetchLogout();

    if (!route.value.meta.constant) {
      await toLogin();
    }

    routeStore.resetStore();
  }

  /**
   * Login
   *
   * @param userName User name
   * @param password Password
   */
  async function login(loginForm: Api.Auth.LoginBody) {
    startLoading();

    try {
      const { data } = await doPostLogin(loginForm);

      await loginByToken(data);

      await routeStore.initAuthRoute();

      await redirectFromLogin();

      if (routeStore.isInitAuthRoute) {
        $notification?.success({
          message: $t('page.login.common.loginSuccess'),
          description: $t('page.login.common.welcomeBack', { userName: userInfo.username })
        });
      }
    } catch {
      resetStore();
    } finally {
      endLoading();
    }
  }

  async function loginByToken(loginToken: Api.Auth.LoginToken) {
    // 1. stored in the localStorage, the later requests need it in headers
    localStg.set('token', loginToken.access_token);
    localStg.set('refreshToken', loginToken.refreshToken);

    const { data: info } = await doGetUserInfo();

    // 2. store user info
    localStg.set('userInfo', info);

    // 3. update auth route
    token.value = loginToken.access_token;
    Object.assign(userInfo, info);
  }

  return {
    token,
    userInfo,
    isLogin,
    loginLoading,
    resetStore,
    login
  };
});
