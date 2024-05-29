const { defaultRequiredRule } = useFormRules();

export type MenuModelType = Pick<
  Api.SystemManage.Menu,
  | 'menuName'
  | 'menuType'
  | 'icon'
  | 'path'
  | 'component'
  | 'orderNum'
  | 'status'
  | 'parentId'
  | 'hideInMenu'
  | 'fixedIndexInTab'
  | 'iconType'
  | 'isFrame'
  | 'perms'
  | 'isCache'
  | 'name'
>;

export function resetAddForm(): MenuModelType {
  return {
    menuName: '',
    menuType: 'M',
    icon: '',
    path: '',
    component: '',
    orderNum: 0,
    status: '0',
    parentId: 0,
    iconType: '1',
    hideInMenu: '0',
    isFrame: '1',
    perms: '',
    name: '',
    isCache: '0'
  };
}

export const formRules = {
  menuName: defaultRequiredRule,
  menuType: defaultRequiredRule,
  icon: defaultRequiredRule,
  path: defaultRequiredRule,
  component: defaultRequiredRule,
  status: defaultRequiredRule,
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

export const menuTypeOptions = [
  { label: '目录', value: 'M' },
  { label: '菜单', value: 'C' },
  { label: '按钮', value: 'F' }
];

export const menuStatusOptions = [
  { label: '正常', value: '0' },
  { label: '停用', value: '1' }
];
