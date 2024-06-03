import { request } from '../request';

export type PostSubmitModel = Partial<
  Pick<Api.SystemManage.Post, 'postCode' | 'postName' | 'postSort' | 'status' | 'remark'>
>;

export function doGetPostList(params: Api.SystemManage.PostSearchParams) {
  return request<Api.SystemManage.PostList>({
    url: '/system/post/list',
    method: 'get',
    params
  });
}

export function doGetPostDetail(postId: number) {
  return request({
    url: `/system/post/${postId}`,
    method: 'get'
  });
}

export function doAddPost(data: PostSubmitModel) {
  return request({
    url: '/system/post',
    method: 'post',
    data
  });
}

export function doEditPost(data: PostSubmitModel) {
  return request({
    url: '/system/post',
    method: 'put',
    data
  });
}

export function doDeletePost(postId: string | number) {
  return request({
    url: `/system/post/${postId}`,
    method: 'delete'
  });
}
