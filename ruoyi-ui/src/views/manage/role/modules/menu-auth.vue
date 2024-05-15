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

const tree = shallowRef<DataNode[]>([]);

watchEffect(() => {
  if (props.drawerVisible && props.type === 'edit') {
    getChecks();
  }
});

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

const checks = shallowRef<number[]>([]);

async function getChecks() {
  const { data, error } = await doGetRoleMenuList(props.roleId);
  if (!error) {
    checks.value = data.checkedKeys;
  }
}

async function init() {
  await getTree();
  if (props.type === 'edit') {
    await getChecks();
  }
}

function clearChecks() {
  checks.value = [];
}

defineExpose({
  clearChecks
});

init();
</script>

<template>
  <div class="border-0.5 border-gray-300 rounded-md p-2 transition-all" hover="border-gray-500">
    <SimpleScrollbar>
      <ATree
        v-model:checked-keys="checks"
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
