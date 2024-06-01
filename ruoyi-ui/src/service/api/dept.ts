import { request } from '../request';

export type DeptFormType = Pick<
  Api.SystemManage.Dept,
  'deptName' | 'parentId' | 'orderNum' | 'leader' | 'phone' | 'email' | 'status' | 'remark'
>;

/** 获取部门列表 */
export function doGetDeptList(params: Api.SystemManage.DeptSearchParams) {
  return request<Api.SystemManage.DeptList>({
    url: '/system/dept/list',
    params
  });
}

/**
 * 获取部门详情
 *
 * @param deptId 部门id
 */
export function doGetDeptInfo(deptId: number) {
  return request<Api.SystemManage.Dept>({
    url: `/system/dept/${deptId}`
  });
}

/**
 * 添加部门
 *
 * @param body 部门信息
 */
export function doAddDept(body: DeptFormType) {
  return request({
    url: '/system/dept',
    method: 'post',
    data: body
  });
}

/**
 * 修改部门
 *
 * @param body 部门信息
 */
export function doEditDept(body: DeptFormType & { deptId: number }) {
  return request({
    url: '/system/dept',
    method: 'put',
    data: body
  });
}

/**
 * 删除部门
 *
 * @param deptId 部门id
 */
export function doDeleteDept(deptId: string | number) {
  return request({
    url: `/system/dept/${deptId}`,
    method: 'delete'
  });
}
