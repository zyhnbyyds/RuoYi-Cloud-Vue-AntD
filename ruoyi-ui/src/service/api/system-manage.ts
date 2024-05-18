import { request } from '../request';

/** get role list */
export function fetchGetRoleList(params?: Api.SystemManage.RoleSearchParams) {
  return request<Api.SystemManage.RoleList>({
    url: '/system/role/list',
    method: 'get',
    params
  });
}

/**
 * get all roles
 *
 * these roles are all enabled
 */
export function fetchGetAllRoles() {
  return request<Api.SystemManage.AllRole[]>({
    url: '/system/menu/list',
    method: 'get',
    params: {
      menuType: 'C'
    }
  });
}

/** get user list */
export function fetchGetUserList(params?: Api.SystemManage.UserSearchParams) {
  return request<Api.SystemManage.UserList>({
    url: '/systemManage/getUserList',
    method: 'get',
    params
  });
}

/**
 * get menu list
 *
 * @deprecated this will removed in next version 1.1.0
 */
export function fetchGetMenuListV1() {
  return request<Api.SystemManage.Menu[]>({
    url: '/systemManage/getMenuList',
    method: 'get'
  });
}

/** get menu list */
export function fetchGetMenuList() {
  return request<Api.SystemManage.MenuList>({
    url: '/systemManage/getMenuList/v2',
    method: 'get'
  });
}

/** get all pages */
export function fetchGetAllPages() {
  return request<Pick<Api.SystemManage.Menu, 'menuId' | 'menuName' | 'path'>[]>({
    url: '/system/menu/list',
    method: 'get',
    params: {
      menuType: 'C'
    }
  });
}

/** get menu tree */
export function fetchGetMenuTree() {
  return request<Api.SystemManage.MenuTree[]>({
    url: '/system/menu/treeselect',
    method: 'get'
  });
}

/** get role menu list */
export function doGetRoleMenuList(roleId: number) {
  return request<{
    checkedKeys: number[];
    menus: Api.SystemManage.MenuTree[];
  }>({
    url: `/system/menu/roleMenuTreeselect/${roleId}`,
    method: 'get'
  });
}
