import type { DeptFormType } from '@/service/api/dept';

const { defaultRequiredRule } = useFormRules();

export function resetForm(): DeptFormType {
  return {
    deptName: '',
    parentId: 100,
    orderNum: 0,
    leader: '',
    phone: '',
    email: '',
    status: '0',
    remark: ''
  };
}

export const statusOptions = [
  { label: '启用', value: '0' },
  { label: '禁用', value: '1' }
];

export const formRules = {
  deptName: defaultRequiredRule,
  parentId: defaultRequiredRule,
  orderNum: [
    defaultRequiredRule,
    {
      validator: (rule, value) => {
        if (value < 0) {
          return Promise.reject(rule.message || '排序必须大于等于0');
        }
        return Promise.resolve();
      }
    }
  ]
} as Record<string, App.Global.FormRule | App.Global.FormRule[]>;
