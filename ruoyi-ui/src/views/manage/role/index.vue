<script setup lang="tsx">
import { computed, shallowRef } from 'vue';
import { Button, Popconfirm, Tag } from 'ant-design-vue';
import { useElementSize } from '@vueuse/core';
import type { Key } from 'ant-design-vue/es/_util/type';
import { fetchGetRoleList } from '@/service/api';
// import { useAppStore } from '@/store/modules/app';
import { useTable, useTableOperate } from '@/hooks/common/table';
import { $t } from '@/locales';
import { enableStatusRecord } from '@/constants/business';
import { doDeleteRole } from '@/service/api/role';
import RoleOperateDrawer from './modules/role-operate-drawer.vue';
import RoleSearch from './modules/role-search.vue';

// const appStore = useAppStore();

const wrapperEl = shallowRef<HTMLElement | null>(null);
const { height: wrapperElHeight } = useElementSize(wrapperEl);

const scrollConfig = computed(() => {
  return {
    y: wrapperElHeight.value - 72,
    x: 702
  };
});

const { columns, columnChecks, data, loading, getData, mobilePagination, searchParams, resetSearchParams } = useTable({
  apiFn: fetchGetRoleList,
  apiParams: {
    pageNum: 1,
    pageSize: 10,
    status: undefined,
    roleName: undefined,
    roleKey: undefined
  },
  rowKey: 'roleId',
  columns: () => [
    {
      key: 'roleKey',
      dataIndex: 'roleKey',
      title: $t('page.manage.role.roleCode'),
      align: 'center'
    },
    {
      key: 'roleName',
      dataIndex: 'roleName',
      title: $t('page.manage.role.roleName'),
      align: 'center'
    },
    {
      key: 'status',
      dataIndex: 'status',
      title: $t('page.manage.role.roleStatus'),
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
      title: $t('page.manage.role.roleDesc')
    },
    {
      key: 'operate',
      title: $t('common.operate'),
      align: 'center',
      width: 200,
      customRender: ({ record }) =>
        !record.admin && (
          <div class="flex justify-around gap-8px">
            {isShowBtn('system:role:edit') && (
              <Button size="small" onClick={() => edit(record.roleId)}>
                {$t('common.edit')}
              </Button>
            )}
            {isShowBtn('system:role:remove') && (
              <Popconfirm onConfirm={() => handleDelete(record.roleId)} title={$t('common.confirmDelete')}>
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
} = useTableOperate(data, { getData, idKey: 'roleId' });

async function handleBatchDelete() {
  const { error } = await doDeleteRole(checkedRowKeys.value.join(','));
  if (!error) {
    onBatchDeleted();
  }
}

async function handleDelete(id: number) {
  const { error } = await doDeleteRole(id);
  if (!error) {
    onDeleted();
  }
}

function edit(id: number) {
  handleEdit(id);
}

function handleRoleSelectChange(selectedRowKeys: Key[]) {
  checkedRowKeys.value = selectedRowKeys as number[];
}
</script>

<template>
  <div class="min-h-500px flex-col-stretch gap-16px overflow-hidden lt-sm:overflow-auto">
    <RoleSearch v-model:model="searchParams" @reset="resetSearchParams" @search="getData" />
    <ACard
      :title="$t('page.manage.role.title')"
      :bordered="false"
      :body-style="{ flex: 1, overflow: 'hidden' }"
      class="flex-col-stretch sm:flex-1-hidden card-wrapper"
    >
      <template #extra>
        <TableHeaderOperation
          v-model:columns="columnChecks"
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
        :data-source="data"
        :loading="loading"
        :row-selection="{ selectedRowKeys: checkedRowKeys, onChange: handleRoleSelectChange }"
        row-key="id"
        size="small"
        :pagination="mobilePagination"
        :scroll="scrollConfig"
        class="h-full"
      />
      <RoleOperateDrawer
        v-model:visible="drawerVisible"
        :operate-type="operateType"
        :row-data="editingData"
        @submitted="getData"
      />
    </ACard>
  </div>
</template>

<style scoped></style>
