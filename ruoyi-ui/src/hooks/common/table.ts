import { computed, effectScope, onScopeDispose, reactive, ref, watch } from 'vue';
import type { Ref } from 'vue';
import type { TablePaginationConfig } from 'ant-design-vue';
import { useBoolean, useHookTable } from '@sa/hooks';
import { useAppStore } from '@/store/modules/app';
import { $t } from '@/locales';

type TableData = AntDesign.TableData;
type GetTableData<A extends AntDesign.TableApiFn> = AntDesign.GetTableData<A>;
type TableColumn<T> = AntDesign.TableColumn<T>;

export function useTable<A extends AntDesign.TableApiFn>(config: AntDesign.AntDesignTableConfig<A>) {
  const scope = effectScope();
  const appStore = useAppStore();

  const { apiFn, apiParams, immediate } = config;

  const {
    loading,
    empty,
    data,
    columns,
    columnChecks,
    reloadColumns,
    getData,
    searchParams,
    updateSearchParams,
    resetSearchParams
  } = useHookTable<A, GetTableData<A>, TableColumn<AntDesign.TableDataWithIndex<GetTableData<A>>>>({
    apiFn,
    apiParams,
    columns: config.columns,
    transformer: res => {
      const { rows = [], total = 0 } = res.data || {};
      return {
        rows,
        total
      };
    },
    getColumnChecks: cols => {
      const checks: AntDesign.TableColumnCheck[] = [];

      cols.forEach(column => {
        if (column.key) {
          checks.push({
            key: column.key as string,
            title: column.title as string,
            checked: true
          });
        }
      });

      return checks;
    },
    getColumns: (cols, checks) => {
      const columnMap = new Map<string, TableColumn<GetTableData<A>>>();

      cols.forEach(column => {
        if (column.key) {
          columnMap.set(column.key as string, column);
        }
      });

      const filteredColumns = checks
        .filter(item => item.checked)
        .map(check => columnMap.get(check.key) as TableColumn<GetTableData<A>>);

      return filteredColumns;
    },
    onFetched: async transformed => {
      const { total } = transformed;

      updatePagination({
        total
      });
    },
    immediate
  });

  const pagination: TablePaginationConfig = reactive({
    showSizeChanger: true,
    pageSizeOptions: [10, 15, 20, 25, 30],
    total: 0,
    current: 1,
    pageSize: 10,
    onChange: async (current: number, pageSize: number) => {
      pagination.current = current;

      updateSearchParams({
        pageNum: current,
        pageSize
      });

      getData();
    }
  });

  // this is for mobile, if the system does not support mobile, you can use `pagination` directly
  const mobilePagination = computed(() => {
    const p: TablePaginationConfig = {
      ...pagination,
      simple: appStore.isMobile
    };

    return p;
  });

  function updatePagination(update: Partial<TablePaginationConfig>) {
    Object.assign(pagination, update);
  }

  scope.run(() => {
    watch(
      () => appStore.locale,
      () => {
        reloadColumns();
      }
    );
  });

  onScopeDispose(() => {
    scope.stop();
  });

  return {
    loading,
    empty,
    data,
    columns,
    columnChecks,
    reloadColumns,
    pagination,
    mobilePagination,
    updatePagination,
    getData,
    searchParams,
    updateSearchParams,
    resetSearchParams
  };
}

export function useTableOperate<T extends TableData = TableData>(data: Ref<T[]>, getData: () => Promise<void>) {
  const { bool: drawerVisible, setTrue: openDrawer, setFalse: closeDrawer } = useBoolean();

  const operateType = ref<AntDesign.TableOperateType>('add');

  function handleAdd() {
    operateType.value = 'add';
    openDrawer();
  }

  /** the editing row data */
  const editingData: Ref<T | null> = ref(null);

  function handleEdit(id: T['id']) {
    operateType.value = 'edit';
    editingData.value = data.value.find(item => item.id === id) || null;

    openDrawer();
  }

  /** the checked row keys of table */
  const checkedRowKeys = ref<string[]>([]);

  /** the hook after the batch delete operation is completed */
  async function onBatchDeleted() {
    $message?.success($t('common.deleteSuccess'));

    checkedRowKeys.value = [];

    await getData();
  }

  /** the hook after the delete operation is completed */
  async function onDeleted() {
    $message?.success($t('common.deleteSuccess'));

    await getData();
  }

  return {
    drawerVisible,
    openDrawer,
    closeDrawer,
    operateType,
    handleAdd,
    editingData,
    handleEdit,
    checkedRowKeys,
    onBatchDeleted,
    onDeleted
  };
}
