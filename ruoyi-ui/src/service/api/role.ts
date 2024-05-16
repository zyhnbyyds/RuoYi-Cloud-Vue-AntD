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
