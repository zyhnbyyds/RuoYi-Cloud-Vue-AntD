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
