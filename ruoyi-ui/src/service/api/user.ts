import { request } from '../request';

// user api
export function doPutUser(user: Api.Auth.User) {
  return request({ url: '/system/user', method: 'put', data: user });
}

export function doPostUser(user: Api.Auth.User) {
  return request({ url: '/system/user', method: 'post', data: user });
}

export function doDeleteUser(userId: number | string) {
  return request({ url: `/system/user/${userId}`, method: 'delete' });
}

export function doGetUserList(params?: Api.SystemManage.UserSearchParams) {
  return request<Api.SystemManage.UserList>({
    url: '/system/user/list',
    method: 'get',
    params
  });
}
