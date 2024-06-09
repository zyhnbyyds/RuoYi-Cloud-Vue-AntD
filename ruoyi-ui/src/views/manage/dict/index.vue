<script setup lang="tsx">
import type { Key } from 'ant-design-vue/es/_util/type';
import { Button, Popconfirm, Tag } from 'ant-design-vue';
import { useTable, useTableOperate } from '@/hooks/common/table';
import { $t } from '@/locales';
import { enableStatusRecord } from '@/constants/business';
import DictOperateDrawer from './modules/dict-operate-drawer.vue';
import DictSearch from './modules/dict-search.vue';

const wrapperEl = shallowRef<HTMLElement | null>(null);
const { height: wrapperElHeight } = useElementSize(wrapperEl);

const scrollConfig = computed(() => {
  return {
    y: wrapperElHeight.value - 72,
    x: 1000
  };
});

const { columns, columnChecks, data, loading, getData, mobilePagination, searchParams, resetSearchParams } = useTable({
  apiFn: doGetDictList,
  apiParams: {
    pageNum: 1,
    pageSize: 10,
    status: undefined,
    dictName: undefined,
    dictType: undefined
  },
  rowKey: 'dictId',
  columns: () => [
    {
      key: 'dictName',
      dataIndex: 'dictName',
      title: '字典名称',
      align: 'center'
    },
    {
      key: 'dictType',
      dataIndex: 'dictType',
      title: '字典类型',
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
      title: '操作',
      align: 'center',
      width: 200,
      customRender: ({ record }) => (
        <div class="flex justify-around gap-8px">
          {isShowBtn('system:dict:edit') && (
            <Button size="small" onClick={() => edit(record.dictId)}>
              编辑
            </Button>
          )}
          {isShowBtn('system:dict:remove') && (
            <Popconfirm onConfirm={() => handleDelete(record.dictId)} title="确认删除吗？">
              <Button danger size="small">
                删除
              </Button>
            </Popconfirm>
          )}
        </div>
      )
    }
  ]
});

const { drawerVisible, operateType, editingData, handleAdd, handleEdit, checkedRowKeys, onBatchDeleted, onDeleted } =
  useTableOperate(data, { getData, idKey: 'dictId' });

async function handleBatchDelete() {
  const { error } = await doDeleteDict(checkedRowKeys.value.join(','));
  if (!error) {
    onBatchDeleted();
  }
}

async function handleDelete(id: number) {
  const { error } = await doDeleteDict(id);
  if (!error) {
    onDeleted();
  }
}

function edit(id: number) {
  handleEdit(id);
}

function handleDictSelectChange(selectedRowKeys: Key[]) {
  checkedRowKeys.value = selectedRowKeys as number[];
}
</script>

<template>
  <div class="min-h-500px flex-col-stretch gap-16px overflow-hidden lt-sm:overflow-auto">
    <DictSearch v-model:model="searchParams" @reset="resetSearchParams" @search="getData" />
    <ACard
      title="字典列表"
      :bordered="false"
      :body-style="{ flex: 1, overflow: 'hidden' }"
      class="flex-col-stretch sm:flex-1-hidden card-wrapper"
    >
      <template #extra>
        <TableHeaderOperation
          v-model:columns="columnChecks"
          :disabled-delete="checkedRowKeys.length === 0"
          :loading="loading"
          :show-delete="true"
          table-type="dict"
          @add="handleAdd"
          @delete="handleBatchDelete"
          @refresh="getData"
        />
      </template>
      <ATable
        ref="wrapperEl"
        :columns="columns"
        :data-source="data"
        :loading="loading"
        :row-selection="{ selectedRowKeys: checkedRowKeys, onChange: handleDictSelectChange }"
        row-key="dictId"
        size="small"
        :pagination="mobilePagination"
        :scroll="scrollConfig"
        class="h-full"
      />
      <DictOperateDrawer
        v-model:visible="drawerVisible"
        :operate-type="operateType"
        :row-data="editingData"
        @submitted="getData"
      />
    </ACard>
  </div>
</template>

<style scoped></style>
