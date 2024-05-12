import { request } from '../request';

/** Get user routes */
export function doGetUserRoutes() {
  return request<App.Service.Response<Api.Route.UserRoute>>('/system/menu/getRouters');
}

/**
 * Whether the route is exist
 *
 * @param routeName Route name
 * @param example Whether to use example data, default: 0
 */
export function fetchIsRouteExist(routeName: string, example: '0' | '1' = '0') {
  return request<App.Service.Response<boolean>>('/route/isRouteExist', { params: { routeName, example } });
}
