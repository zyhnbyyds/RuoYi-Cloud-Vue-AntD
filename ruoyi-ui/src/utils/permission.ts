import { useAuthStore } from '@/store/modules/auth';

export function isShowBtn(permission: string) {
  const { permissions, userInfo } = storeToRefs(useAuthStore());

  return userInfo.value.roles.includes('admin') || permissions.value.includes(permission);
}
