import { request } from '../request';

export type DictSubmitModel = Partial<
  Pick<Api.SystemManage.Dict, 'dictName' | 'dictType' | 'status' | 'remark' | 'dictId'>
>;

export const doGetDictList = (params: Api.SystemManage.DictSearchParams) => {
  return request<Api.SystemManage.DictList>({
    url: '/system/dict/type/list',
    method: 'get',
    params
  });
};

export const doAddDict = (data: DictSubmitModel) => {
  return request({
    url: '/system/dict/type',
    method: 'post',
    data
  });
};

export const doEditDict = (data: DictSubmitModel) => {
  return request({
    url: '/system/dict/type',
    method: 'put',
    data
  });
};

export const doDeleteDict = (dictId: string | number) => {
  return request({
    url: `/system/dict/type/${dictId}`,
    method: 'post'
  });
};
