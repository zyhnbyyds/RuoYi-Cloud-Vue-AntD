<script setup lang="tsx">
import { Button, Popconfirm, Tag } from 'ant-design-vue';
import type { Key } from 'ant-design-vue/es/_util/type';
import { useTable, useTableOperate } from '@/hooks/common/table';
import { $t } from '@/locales';
import { enableStatusRecord } from '@/constants/business';
import { SimpleScrollbar } from '~/packages/materials/src';
import UserOperateDrawer from './modules/user-operate-drawer.vue';
import UserSearch from './modules/user-search.vue';

const wrapperEl = shallowRef<HTMLElement | null>(null);
const { height: wrapperElHeight } = useElementSize(wrapperEl);

const scrollConfig = computed(() => {
  return {
    y: wrapperElHeight.value - 72,
    x: 1000
  };
});

const { columns, columnChecks, data, loading, getData, mobilePagination, searchParams, resetSearchParams } = useTable({
  apiFn: doGetUserList,
  apiParams: {
    pageNum: 1,
    pageSize: 10,
    status: undefined,
    userName: undefined,
    email: undefined
  },
  rowKey: 'userId',
  columns: () => [
    {
      key: 'userName',
      dataIndex: 'userName',
      title: $t('page.manage.user.userName'),
      align: 'center'
    },
    {
      key: 'nickName',
      dataIndex: 'nickName',
      title: $t('page.manage.user.nickName'),
      align: 'center'
    },
    {
      key: 'email',
      dataIndex: 'email',
      title: $t('page.manage.user.email'),
      align: 'center'
    },
    {
      key: 'phonenumber',
      dataIndex: 'phonenumber',
      title: $t('page.manage.user.phonenumber'),
      align: 'center'
    },
    {
      key: 'status',
      dataIndex: 'status',
      title: $t('page.manage.user.status'),
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
      key: 'dept',
      dataIndex: 'dept',
      title: $t('page.manage.user.dept'),
      align: 'center',
      customRender: ({ record }) => record.dept?.deptName || ''
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
      customRender: ({ record }) =>
        !record.admin && (
          <div class="flex justify-around gap-8px">
            {isShowBtn('system:user:edit') && (
              <Button size="small" onClick={() => edit(record.userId)}>
                {$t('common.edit')}
              </Button>
            )}
            {isShowBtn('system:user:remove') && (
              <Popconfirm onConfirm={() => handleDelete(record.userId)} title={$t('common.confirmDelete')}>
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

const {
  drawerVisible,
  operateType,
  editingData,
  handleAdd,
  handleEdit,
  checkedRowKeys,
  onBatchDeleted,
  onDeleted
  // closeDrawer
} = useTableOperate(data, { getData, idKey: 'userId' });

const deptTreeData = ref<Api.Common.CommonTree>([]);

onMounted(() => {
  getUserDeptTree();
});

async function handleBatchDelete() {
  const { error } = await doDeleteUser(checkedRowKeys.value.join(','));
  if (!error) {
    onBatchDeleted();
  }
}

async function handleDelete(id: number) {
  const { error } = await doDeleteUser(id);
  if (!error) {
    onDeleted();
  }
}

function edit(id: number) {
  handleEdit(id);
}

function handleUserSelectChange(selectedRowKeys: Key[]) {
  checkedRowKeys.value = selectedRowKeys as number[];
}

async function getUserDeptTree() {
  const { error, data: tree } = await doGetUserDeptTree();
  if (!error) {
    deptTreeData.value = tree;
  }
}
</script>

<template>
  <SimpleScrollbar>
    <div class="min-h-500px flex-col-stretch gap-16px overflow-hidden lt-sm:overflow-auto">
      <UserSearch
        v-model:model="searchParams"
        :dept-tree-data="deptTreeData"
        @reset="resetSearchParams"
        @search="getData"
      />
      <ACard
        :title="$t('page.manage.user.title')"
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
          :row-selection="{
            selectedRowKeys: checkedRowKeys,
            onChange: handleUserSelectChange,
            getCheckboxProps: record => ({
              disabled: record.admin
            })
          }"
          row-key="userId"
          size="small"
          :pagination="mobilePagination"
          :scroll="scrollConfig"
          class="h-full"
        />
        <UserOperateDrawer
          v-model:visible="drawerVisible"
          :dept-tree-data="deptTreeData"
          :operate-type="operateType"
          :row-data="editingData"
          @submitted="getData"
        />
      </ACard>
    </div>
  </SimpleScrollbar>
</template>

<style scoped></style>
