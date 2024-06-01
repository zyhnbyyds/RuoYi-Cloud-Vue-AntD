import { request } from '../request';

/**
 * edit role info
 *
 * @param role role info
 * @returns
 */
export function doPutRole(role: Api.SystemManage.Role) {
  return request({ url: '/system/role', method: 'put', data: role });
}

/**
 * add role
 *
 * @param role role info
 * @returns
 */
export function doPostRole(role: Api.SystemManage.Role) {
  return request({ url: '/system/role', method: 'post', data: role });
}

/**
 * delete role
 *
 * @param roleId role id
 * @returns
 */
export function doDeleteRole(roleId: number | string) {
  return request({ url: `/system/role/${roleId}`, method: 'delete' });
}

export function doGetRoleList(params?: Api.SystemManage.RoleSearchParams) {
  return request<Api.SystemManage.RoleList>({
    url: '/system/role/list',
    method: 'get',
    params
  });
}
