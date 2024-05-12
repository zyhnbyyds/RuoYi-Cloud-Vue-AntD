import { localStg } from '@/utils/storage';

/** Get token */
export function getToken() {
  return localStg.get('token') || '';
}

/** Get user info */
const emptyInfo: Partial<Api.Auth.UserInfo> = {};
export function getUserInfo() {
  const userInfo = localStg.get('userInfo') || emptyInfo;

  // fix new property: buttons, this will be removed in the next version `1.1.0`
  if (!userInfo.buttons) {
    userInfo.buttons = [];
  }

  return userInfo;
}

/** Clear auth storage */
export function clearAuthStorage() {
  localStg.remove('token');
  localStg.remove('refreshToken');
  localStg.remove('userInfo');
}
