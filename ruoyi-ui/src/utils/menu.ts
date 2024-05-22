import type { DataNode } from 'ant-design-vue/es/tree';

/**
 * Antd tree component don't add root array key to checkedKeys(only in select all), so we need to add root node id to
 * checkedKeys
 *
 * @param menuList menu list
 * @param checkedKeys checked keys
 * @returns
 */
export function transformMenuChildWithRootIds(menuList: DataNode[], checkedKeys: number[]): number[] {
  const checkedKeysSet = new Set(checkedKeys);

  function changeCheckedKeys(menus: DataNode[]) {
    menus.forEach(menu => {
      if (menu.children) {
        changeCheckedKeys(menu.children);
        checkedKeysSet.add(menu.key as number);
      }
    });
  }

  changeCheckedKeys(menuList);

  return Array.from(checkedKeysSet);
}

export function transformListToTree(list: Api.SystemManage.Menu[]) {
  const tree = cloneDeep(list);
  const map = new Map<number, Api.SystemManage.Menu>();
  tree.forEach(item => {
    map.set(item.menuId, item);
  });

  const treeData: Api.SystemManage.Menu[] = [];
  tree.forEach(item => {
    if (item.parentId === 0) {
      treeData.push(item);
    } else {
      const parent = map.get(item.parentId);
      if (parent) {
        if (!parent.children) {
          parent.children = [];
        }
        parent.children.push(item);
      }
    }
  });

  return treeData;
}
