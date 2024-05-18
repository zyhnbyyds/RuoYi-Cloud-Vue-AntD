import { localStg } from '@/utils/storage';

/** Get token */
export function getToken() {
  return localStg.get('token') || '';
}

export const emptyInfo: Api.Auth.UserInfo = {
  roles: [],
  buttons: [],
  permissions: [],
  user: null
};

/** Clear auth storage */
export function clearAuthStorage() {
  localStg.remove('token');
  localStg.remove('refreshToken');
}
