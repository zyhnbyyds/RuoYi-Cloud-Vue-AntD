<script setup lang="tsx">
import { Icon } from '@iconify/vue';
import { Button, Tag } from 'ant-design-vue';
import { SimpleScrollbar } from '~/packages/materials/src';
import MenuOperateModal from './modules/menu-operate-modal.vue';

const { data, columns, loading, getData } = useTable({
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
      key: 'component',
      dataIndex: 'component',
      title: '组件路径',
      align: 'center'
    },
    {
      key: 'status',
      dataIndex: 'status',
      title: '状态',
      align: 'center',
      customRender: ({ record }) => {
        const colorTagMap: Record<string, string> = {
          0: 'success',
          1: 'warning'
        };

        const labelMap: Record<string, string> = {
          0: '正常',
          1: '停用'
        };
        return <Tag color={colorTagMap[record.status]}>{labelMap[record.status]}</Tag>;
      }
    },
    {
      key: 'menuType',
      dataIndex: 'menuType',
      title: '类型',
      align: 'center',
      customRender: ({ record }) => {
        const colorTagMap: Record<string, string> = {
          M: 'processing',
          C: 'success',
          F: 'default'
        };

        const labelMap: Record<string, string> = {
          M: '目录',
          C: '菜单',
          F: '按钮'
        };
        return <Tag color={colorTagMap[record.menuType]}>{labelMap[record.menuType]}</Tag>;
      }
    },
    {
      key: 'orderNum',
      dataIndex: 'orderNum',
      title: '排序',
      align: 'center'
    },
    {
      key: 'icon',
      dataIndex: 'icon',
      title: '图标',
      align: 'center',
      customRender: ({ record }) => {
        return (
          <div class="flex-center text-5">
            <Icon icon={`${record.icon}`} />
          </div>
        );
      }
    },
    {
      key: 'operate',
      title: '操作',
      align: 'center',
      width: 200,
      customRender: ({ record }) => (
        <div class="flex justify-around gap-8px">
          <Button size="small" onClick={() => edit(record.menuId)}>
            编辑
          </Button>
          <Button size="small" danger onClick={() => handleDelete(record.menuId)}>
            删除
          </Button>
        </div>
      )
    }
  ],
  rowKey: 'menuId'
});
const { handleEdit, handleAdd, checkedRowKeys, operateType, drawerVisible, onDeleted } = useTableOperate(data, {
  getData,
  idKey: 'menuId'
});

function edit(id: number) {
  handleEdit(id);
}

function handleDelete(id: number) {
  $modal.confirm({
    title: '提示',
    content: '确定删除该菜单吗？',
    onOk: async () => {
      console.log('删除', id);
      // getData();
      onDeleted();
    }
  });
}

const treeData = computed(() => {
  return transformListToTree(data.value);
});
</script>

<template>
  <SimpleScrollbar>
    <div class="min-h-500px flex-col-stretch gap-16px overflow-hidden lt-sm:overflow-auto">
      <ACard title="菜单列表">
        <AButton mb-4 type="primary" @click="handleAdd">新增</AButton>

        <ATable
          :checked-row-keys="checkedRowKeys"
          :data-source="treeData"
          row-key="menuId"
          :columns="columns"
          :pagination="false"
          :loading="loading"
        />
        <MenuOperateModal v-model:visible="drawerVisible" :operate-type="operateType" />
      </ACard>
    </div>
  </SimpleScrollbar>
</template>

<style scoped></style>
