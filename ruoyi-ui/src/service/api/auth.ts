import { axios, request } from '../request';

/**
 * Login
 *
 * @param userName User name
 * @param password Password
 */
export function doPostLogin(body: Api.Auth.LoginBody) {
  return request<App.Service.Response<Api.Auth.LoginToken>>('/auth/login', {
    method: 'post',
    body
  });
}

/** logout */
export function fetchLogout() {
  return request<App.Service.Response<null>>('/auth/logout', {
    method: 'delete'
  });
}

/** Get user info */
export function doGetUserInfo() {
  return request<App.Service.Response<Api.Auth.UserInfo>>('/system/user/getInfo');
}

/**
 * Refresh token
 *
 * @param refreshToken Refresh token
 */
export function fetchRefreshToken(refreshToken: string) {
  return request<App.Service.Response<Api.Auth.LoginToken>>('/auth/refreshToken', {
    method: 'post',
    body: {
      refreshToken
    }
  });
}

export function fetchDebug() {
  return request<App.Service.Response<string>>('/debug-post', {
    method: 'post',
    headers: { 'content-type': 'application/x-www-form-urlencoded' },
    body: 'a=1'
  });
}

export function fetchDebugAxios() {
  return axios<App.Service.Response<string>>('/debug-post', {
    method: 'post'
  });
}

/** Get check code */
export function doGetCheckCode() {
  return axios<App.Service.Response<null, { img: string; uuid: string }>>('/code');
}
