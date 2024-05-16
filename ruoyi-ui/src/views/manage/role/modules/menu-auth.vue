<script setup lang="ts">
import type { DataNode } from 'ant-design-vue/es/tree';
import { SimpleScrollbar } from '@sa/materials';
import { doGetRoleMenuList, fetchGetMenuTree } from '@/service/api';

defineOptions({
  name: 'MenuAuthModal'
});

interface Props {
  /** the roleId */
  roleId: number;
  type: 'add' | 'edit';
  drawerVisible: boolean;
}

const props = defineProps<Props>();
const menuIds = defineModel<number[]>('menuIds', { default: [] });

const tree = shallowRef<DataNode[]>([]);

watch(
  () => props.drawerVisible,
  val => {
    if (val) {
      init();
    }
  },
  {
    immediate: true
  }
);

async function getTree() {
  const { error, data } = await fetchGetMenuTree();

  if (!error) {
    tree.value = recursiveTransform(data);
  }
}

function recursiveTransform(data: Api.SystemManage.MenuTree[]): DataNode[] {
  return data.map(item => {
    const { id: key, label } = item;

    if (item.children) {
      return {
        key,
        title: label,
        children: recursiveTransform(item.children)
      };
    }

    return {
      key,
      title: label
    };
  });
}

async function getChecks() {
  const { data, error } = await doGetRoleMenuList(props.roleId);
  if (!error) {
    menuIds.value = data.checkedKeys;
  }
}

async function init() {
  await getTree();
  if (props.type === 'edit') {
    await getChecks();
  }
}

function clearChecks() {
  menuIds.value = [];
}

defineExpose({
  clearChecks
});
</script>

<template>
  <div class="border-0.5 border-gray-300 rounded-md p-2 transition-all dark:border-dark-300" hover="border-gray-500">
    <SimpleScrollbar>
      <ATree
        v-model:checked-keys="menuIds"
        :selectable="false"
        :virtual="false"
        :tree-data="tree"
        checkable
        block-node
      />
    </SimpleScrollbar>
  </div>
</template>

<style scoped>
:deep(.ant-tree .ant-tree-switcher) {
  line-height: normal;
  display: flex;
  justify-content: center;
  align-items: center;
}

:deep(.ant-tree .ant-tree-checkbox) {
  margin-block-start: unset;
}

:deep(.ant-tree .ant-tree-title) {
  font-size: 14px;
  padding: 2px;
  font-weight: 500;
}
</style>
