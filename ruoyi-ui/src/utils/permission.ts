import { useAuthStore } from '@/store/modules/auth';

export function isShowBtn(permission: string) {
  const { permissions } = storeToRefs(useAuthStore());

  return permissions.value.includes(permission);
}
