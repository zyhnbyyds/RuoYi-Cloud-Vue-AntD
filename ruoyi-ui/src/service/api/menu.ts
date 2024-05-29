import type { MenuModelType } from '@/views/manage/menu/modules/form';
import { request } from '../request';

export type MenuListQuery = Partial<
  Pick<Api.SystemManage.Menu, 'status' | 'hideInMenu' | 'keepAlive' | 'menuType' | 'menuName'>
> &
  Api.SystemManage.CommonSearchParams;

export function doGetMenuList(params: MenuListQuery) {
  return request<Api.SystemManage.MenuList>({ url: '/system/menu/list', method: 'get', params });
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

/** add menu */
export function doAddMenu(data: MenuModelType) {
  return request({ url: '/system/menu', method: 'post', data });
}

/** delete menu */
export function doDeleteMenu(menuId: number) {
  return request({ url: `/system/menu/${menuId}`, method: 'delete' });
}

/** get menu detail */
export function doGetMenuDetail(menuId: number) {
  return request<MenuModelType>({ url: `/system/menu/${menuId}`, method: 'get' });
}

/** edit menu */
export function doEditMenu(data: MenuModelType) {
  return request({ url: '/system/menu', method: 'put', data });
}
