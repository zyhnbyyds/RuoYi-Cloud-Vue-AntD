/* eslint-disable no-underscore-dangle */
import { createRequest } from '@sa/fetch';
import { createRequest as createAxios } from '@sa/axios';
import { localStg } from '@/utils/storage';
import { createProxyPattern, createServiceConfig } from '~/env.config';
import { $t } from '@/locales';

const { baseURL, otherBaseURL } = createServiceConfig(import.meta.env);

const isHttpProxy = import.meta.env.VITE_HTTP_PROXY === 'Y';

export const request = createRequest({
  baseURL: isHttpProxy ? createProxyPattern() : baseURL,
  onRequest(context) {
    const { headers } = context.options;
    const token = localStg.get('token');
    const Authorization = token ? `Bearer ${token}` : '';
    context.options.headers = assign(headers ?? {}, { Authorization });
  },
  onRequestError(context) {
    console.error('onRequestError', context);
  },
  onResponse(context) {
    if (context.response._data && context.response._data.code >= 400) {
      const { code, msg } = context.response._data;
      // @ts-expect-error ts-migrate(2339) FIXME: Property 'httpCode' does not exist on type 'unknown'.
      $message.error(msg || context.response._data[$t(`httpCode.${code}`)]);
    }
  },
  onResponseError(context) {
    console.log('onResponseError', context);
  }
});

export const demoRequest = createRequest({ baseURL: isHttpProxy ? createProxyPattern('demo') : otherBaseURL.demo });

export const axios = createAxios({
  baseURL: isHttpProxy ? createProxyPattern() : baseURL
});
