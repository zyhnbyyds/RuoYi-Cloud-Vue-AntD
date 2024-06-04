<script setup lang="tsx">
import type { Key } from 'ant-design-vue/es/_util/type';
import { Button, Popconfirm, Tag } from 'ant-design-vue';
import { useTable, useTableOperate } from '@/hooks/common/table';
import { $t } from '@/locales';
import { enableStatusRecord } from '@/constants/business';
import PostOperateDrawer from './modules/post-operate-drawer.vue';
import PostSearch from './modules/post-search.vue';

const wrapperEl = shallowRef<HTMLElement | null>(null);
const { height: wrapperElHeight } = useElementSize(wrapperEl);

const scrollConfig = computed(() => {
  return {
    y: wrapperElHeight.value - 72,
    x: 1000
  };
});

const { columns, columnChecks, data, loading, getData, mobilePagination, searchParams, resetSearchParams } = useTable({
  apiFn: doGetPostList,
  apiParams: {
    pageNum: 1,
    pageSize: 10,
    status: undefined,
    postName: undefined,
    postCode: undefined
  },
  rowKey: 'postId',
  columns: () => [
    {
      key: 'postCode',
      dataIndex: 'postCode',
      title: $t('page.manage.post.postCode'),
      align: 'center'
    },
    {
      key: 'postName',
      dataIndex: 'postName',
      title: $t('page.manage.post.postName'),
      align: 'center'
    },
    {
      key: 'postSort',
      dataIndex: 'postSort',
      title: $t('page.manage.post.postSort'),
      align: 'center'
    },
    {
      key: 'status',
      dataIndex: 'status',
      title: $t('page.manage.post.status'),
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
      title: $t('page.manage.post.remark')
    },
    {
      key: 'operate',
      title: $t('common.operate'),
      align: 'center',
      width: 200,
      customRender: ({ record }) =>
        !record.flag && (
          <div class="flex justify-around gap-8px">
            {isShowBtn('system:post:edit') && (
              <Button size="small" onClick={() => edit(record.postId)}>
                {$t('common.edit')}
              </Button>
            )}
            {isShowBtn('system:post:remove') && (
              <Popconfirm onConfirm={() => handleDelete(record.postId)} title={$t('common.confirmDelete')}>
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
  useTableOperate(data, { getData, idKey: 'postId' });

async function handleBatchDelete() {
  const { error } = await doDeletePost(checkedRowKeys.value.join(','));
  if (!error) {
    onBatchDeleted();
  }
}

async function handleDelete(id: number) {
  const { error } = await doDeletePost(id);
  if (!error) {
    onDeleted();
  }
}

function edit(id: number) {
  handleEdit(id);
}

function handlePostSelectChange(selectedRowKeys: Key[]) {
  checkedRowKeys.value = selectedRowKeys as number[];
}
</script>

<template>
  <div class="min-h-500px flex-col-stretch gap-16px overflow-hidden lt-sm:overflow-auto">
    <PostSearch v-model:model="searchParams" @reset="resetSearchParams" @search="getData" />
    <ACard
      :title="$t('page.manage.post.title')"
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
          table-type="post"
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
        :row-selection="{ selectedRowKeys: checkedRowKeys, onChange: handlePostSelectChange }"
        row-key="postId"
        size="small"
        :pagination="mobilePagination"
        :scroll="scrollConfig"
        class="h-full"
      />
      <PostOperateDrawer
        v-model:visible="drawerVisible"
        :operate-type="operateType"
        :row-data="editingData"
        @submitted="getData"
      />
    </ACard>
  </div>
</template>

<style scoped></style>
