<script setup lang="tsx">
const { data, columns, loading } = useTable({
  apiFn: doGetMenuList,
  columns: () => [
    {
      key: 'menuName',
      dataIndex: 'menuName',
      title: '菜单名称',
      align: 'center',
      width: 200
    },
    {
      key: 'path',
      dataIndex: 'path',
      title: '路由地址',
      align: 'center'
    },
    {
      key: 'icon',
      dataIndex: 'icon',
      title: '图标',
      align: 'center',
      customRender: ({ record }) => {
        return <div class={`icon-${record.icon}`} />;
      }
    }
  ],
  rowKey: 'menuId'
});

function transformListToTree(list: Api.SystemManage.Menu[]) {
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

const treeData = computed(() => {
  return transformListToTree(data.value);
});
</script>

<template>
  <div>
    <!-- Table -->
    <ATable :data-source="treeData" row-key="menuId" :columns="columns" :pagination="false" :loading="loading" />
  </div>
</template>

<style scoped></style>
