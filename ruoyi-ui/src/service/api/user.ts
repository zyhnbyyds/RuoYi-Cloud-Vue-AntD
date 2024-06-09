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

/**
 * 获取用户信息
 *
 * @returns 用户信息[posts & roles]
 */
export function doGetUserPostsAndRoles(userId: number | string | undefined) {
  if (!userId) {
    return request<Api.SystemManage.UserPostsAndRoles>({
      url: '/system/user/',
      method: 'get'
    });
  }
  return request<Api.SystemManage.UserPostsAndRoles>({
    url: `/system/user/${userId}`,
    method: 'get'
  });
}

export function doGetAdminUserPostsAndRoles() {
  return request<Api.SystemManage.UserPostsAndRoles>({
    url: `/system/user`,
    method: 'get'
  });
}

export function doGetUserDeptTree() {
  return request<Api.Common.CommonTree>({
    url: '/system/user/deptTree',
    method: 'get'
  });
}
