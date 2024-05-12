import { request } from '../request';

/**
 * Login
 *
 * @param username User name
 * @param password Password
 */
export function fetchLogin(body: Api.Auth.LoginBody) {
  return request<Api.Auth.LoginToken>({
    url: '/auth/login',
    method: 'post',
    data: body
  });
}

/** logout */
export function fetchLogout() {
  return request<App.Service.Response<null>>({
    url: '/auth/logout',
    method: 'delete'
  });
}

/** Get user info */
export function doGetUserInfo() {
  return request<Api.Auth.UserInfo>({ url: '/system/user/getInfo' });
}

/**
 * Refresh token
 *
 * @param refreshToken Refresh token
 */
export function fetchRefreshToken(refreshToken: string) {
  return request<Api.Auth.LoginToken>({
    url: '/auth/refreshToken',
    method: 'post',
    data: {
      refreshToken
    }
  });
}

/**
 * return custom backend error
 *
 * @param code error code
 * @param msg error message
 */
export function fetchCustomBackendError(code: string, msg: string) {
  return request({ url: '/auth/error', params: { code, msg } });
}

/** Get check code */
export function doGetCheckCode() {
  return request<{ uuid: string; img: string }>({
    url: '/code'
  });
}
