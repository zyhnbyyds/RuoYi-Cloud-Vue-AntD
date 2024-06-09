<script setup lang="tsx">
import { Button, Popconfirm, Tag } from 'ant-design-vue';
import { $t } from '@/locales';
import { enableStatusRecord } from '@/constants/business';
import DeptOperateModal from './modules/dept-operate-modal.vue';
import DeptSearch from './modules/dept-search.vue';

const wrapperEl = shallowRef<HTMLElement | null>(null);
const { height: wrapperElHeight } = useElementSize(wrapperEl);

const scrollConfig = computed(() => {
  return {
    y: wrapperElHeight.value - 72,
    x: 702
  };
});

const { columns, columnChecks, data, loading, getData, searchParams, resetSearchParams } = useTable({
  apiFn: doGetDeptList,
  apiParams: {
    status: '0'
  },
  rowKey: 'deptId',
  columns: () => [
    {
      key: 'deptName',
      dataIndex: 'deptName',
      title: '部门名称',
      align: 'center'
    },
    {
      key: 'leader',
      dataIndex: 'leader',
      title: '负责人',
      align: 'center'
    },
    {
      key: 'status',
      dataIndex: 'status',
      title: '状态',
      align: 'center',
      customRender: ({ record }) => {
        if (record.status === null) {
          return null;
        }

        const tagMap: Record<Api.Common.EnableStatus, string> = {
          '0': 'success',
          '1': 'warning'
        };

        const label = $t(enableStatusRecord[record.status]);

        return <Tag color={tagMap[record.status]}>{label}</Tag>;
      }
    },
    {
      key: 'remark',
      dataIndex: 'remark',
      align: 'center',
      title: '备注'
    },
    {
      key: 'createTime',
      dataIndex: 'createTime',
      align: 'center',
      title: '创建时间'
    },
    {
      key: 'operate',
      title: $t('common.operate'),
      align: 'center',
      width: 200,
      customRender: ({ record }) => (
        <div class="flex justify-around gap-8px">
          {isShowBtn('system:dept:edit') && (
            <Button size="small" onClick={() => edit(record.deptId)}>
              {$t('common.edit')}
            </Button>
          )}
          {isShowBtn('system:dept:remove') && (
            <Popconfirm onConfirm={() => handleDelete(record.deptId)} title={$t('common.confirmDelete')}>
              <Button danger size="small">
                {$t('common.delete')}
              </Button>
            </Popconfirm>
          )}
        </div>
      )
    }
  ]
});

const { drawerVisible, operateType, editingData, handleAdd, handleEdit, checkedRowKeys, onBatchDeleted, onDeleted } =
  useTableOperate(data, { getData, idKey: 'deptId' });

const treeData = computed(() => {
  const rootDept = data.value.find(item => item.deptId === 100);
  return rootDept ? transformListToTree(data.value, 'deptId') : removeEmptyChildren(data.value);
});

async function handleBatchDelete() {
  const { error } = await doDeleteDept(checkedRowKeys.value.join(','));
  if (!error) {
    onBatchDeleted();
  }
}

async function handleDelete(id: number) {
  const { error } = await doDeleteDept(id);
  if (!error) {
    onDeleted();
  }
}

function edit(id: number) {
  handleEdit(id);
}
</script>

<template>
  <div class="min-h-500px flex-col-stretch gap-16px overflow-hidden lt-sm:overflow-auto">
    <DeptSearch v-model:model="searchParams" @reset="resetSearchParams" @search="getData" />
    <ACard
      title="部门列表"
      :bordered="false"
      :body-style="{ flex: 1, overflow: 'hidden' }"
      class="flex-col-stretch sm:flex-1-hidden card-wrapper"
    >
      <template #extra>
        <TableHeaderOperation
          v-model:columns="columnChecks"
          table-type="dept"
          :disabled-delete="checkedRowKeys.length === 0"
          :loading="loading"
          @add="handleAdd"
          @delete="handleBatchDelete"
          @refresh="getData"
        />
      </template>
      <ATable
        ref="wrapperEl"
        :columns="columns"
        :data-source="treeData"
        :loading="loading"
        row-key="deptId"
        size="small"
        :scroll="scrollConfig"
        class="h-full"
      />
      <DeptOperateModal
        v-model:visible="drawerVisible"
        :operate-type="operateType"
        :tree-data="treeData"
        :editing-data="editingData"
        @submitted="getData"
      />
    </ACard>
  </div>
</template>

<style scoped></style>
