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

export function transformListToTree<T extends { parentId: number; children?: any[] }>(
  list: T[],
  rowKey: Exclude<keyof T, 'children'>
) {
  const tree = cloneDeep(list);
  const map = new Map<number | string, T>();
  tree.forEach(item => {
    map.set(item[rowKey] as string, item);
  });

  const treeData: T[] = [];
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
  return removeEmptyChildren(treeData);
}

/**
 * Remove empty children
 *
 * @param treeDataGet tree data
 */
export function removeEmptyChildren<T extends { parentId: number; children?: any[] }>(treeDataGet: T[]) {
  const clonedTreeDataGet = cloneDeep(treeDataGet);
  clonedTreeDataGet.forEach(item => {
    if (item.children && item.children.length) {
      item.children = item.children.sort((a, b) => a.orderNum - b.orderNum);
      removeEmptyChildren(item.children);
    } else {
      delete item.children;
    }
  });
  return clonedTreeDataGet;
}
