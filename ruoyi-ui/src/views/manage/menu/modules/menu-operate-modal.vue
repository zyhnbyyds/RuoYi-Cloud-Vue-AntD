<script lang="ts" setup>
import type {} from 'ant-design-vue';
import type { ModelType } from './form';
import { formRules, menuStatusOptions, menuTypeOptions, resetAddForm } from './form';
import IconSelect from './icon-select.vue';

const props = defineProps<{
  operateType: AntDesign.TableOperateType;
  rowData?: Api.SystemManage.Role | null;
}>();

const visible = defineModel<boolean>('visible', {
  default: false
});
const { formRef, validate, resetFields } = useAntdForm();

const model = ref<ModelType>(resetAddForm());
const treeData = ref<Api.SystemManage.MenuTree[]>([]);

const title = computed(() => {
  const titles: Record<AntDesign.TableOperateType, string> = {
    add: '新增菜单',
    edit: '编辑菜单'
  };
  return titles[props.operateType];
});

const submitForm = async () => {
  await validate();
  closeModal();
};

function closeModal() {
  visible.value = false;
  resetFields();
  model.value = resetAddForm();
}

async function getTreeData() {
  const { data, error } = await fetchGetMenuTree();
  if (!error && data) {
    // 添加根节点
    treeData.value = [
      {
        id: 0,
        pId: -1,
        label: '根节点',
        children: data
      }
    ];
    // 'i-carbon:ai-governance',
  }
}

getTreeData();
</script>

<template>
  <AModal v-model:open="visible" :title="title" :width="700">
    <AForm
      ref="formRef"
      :model="model"
      :rules="formRules"
      :label-col="{ span: 6 }"
      :wrapper-col="{ span: 16, offset: 1 }"
      class="grid grid-cols-2 gap-3 px-4 py-4 pt-6"
    >
      <AFormItem label="上级菜单" name="parentId">
        <ATreeSelect
          v-model:value="model.parentId"
          show-search
          :field-names="{ value: 'id' }"
          allow-clear
          :virtual="false"
          :tree-data="treeData"
          tree-node-filter-prop="label"
        />
      </AFormItem>
      <AFormItem label="菜单名称" name="menuName">
        <AInput v-model:value="model.menuName" />
      </AFormItem>
      <AFormItem label="菜单类型" name="menuType">
        <ASelect v-model:value="model.menuType" :options="menuTypeOptions" />
      </AFormItem>
      <AFormItem label="菜单图标" name="icon">
        <IconSelect v-model:value="model.icon" />
      </AFormItem>
      <AFormItem label="菜单路径" name="path">
        <AInput v-model:value="model.path" />
      </AFormItem>
      <AFormItem label="组件路径" name="component">
        <AInput v-model:value="model.component" />
      </AFormItem>
      <AFormItem label="排序" name="orderNum">
        <AInputNumber v-model:value="model.orderNum" w-full />
      </AFormItem>
      <AFormItem label="状态" name="status">
        <ASelect v-model:value="model.status" :options="menuStatusOptions" />
      </AFormItem>
    </AForm>

    <template #footer>
      <AButton @click="submitForm">确定</AButton>
      <AButton @click="closeModal">取消</AButton>
    </template>
  </AModal>
</template>

<style scoped>
:deep(.ant-input-number) {
  width: 100%;
}
</style>
