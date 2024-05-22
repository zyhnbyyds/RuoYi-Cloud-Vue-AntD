<script lang="ts" setup>
const props = defineProps<{
  operateType: AntDesign.TableOperateType;
  rowData?: Api.SystemManage.Role | null;
}>();

type ModelType = Pick<
  Api.SystemManage.Menu,
  'menuName' | 'menuType' | 'icon' | 'path' | 'component' | 'orderNum' | 'status' | 'parentId'
>;

const visible = defineModel<boolean>('visible', {
  default: false
});
const { defaultRequiredRule } = useFormRules();
const { formRef, validate } = useAntdForm();

const model = ref<ModelType>({
  menuName: '',
  menuType: 'M',
  icon: '',
  path: '',
  component: '',
  orderNum: 0,
  status: '0',
  parentId: 0
});

const formRules = {
  menuName: defaultRequiredRule,
  menuType: defaultRequiredRule,
  icon: defaultRequiredRule,
  path: defaultRequiredRule,
  component: defaultRequiredRule,
  orderNum: defaultRequiredRule,
  status: defaultRequiredRule
};

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
}
</script>

<template>
  <AModal v-model:open="visible" :title="title" width="50%">
    <AForm ref="formRef" layout="vertical" :model="model" :rules="formRules" grid grid-cols-2 gap-7 py-4>
      <AFormItem label="上级菜单" name="menuName">
        <!-- TODO: 树选择框 -->
      </AFormItem>
      <AFormItem label="菜单名称" name="menuName">
        <AInput v-model:modelValue="model.menuName" />
      </AFormItem>
      <AFormItem label="菜单类型" name="menuType">
        <ASelect v-model:modelValue="model.menuType">
          <ASelectOption value="0">目录</ASelectOption>
          <ASelectOption value="1">菜单</ASelectOption>
          <ASelectOption value="2">按钮</ASelectOption>
        </ASelect>
      </AFormItem>
      <AFormItem label="菜单图标" name="icon">
        <AInput v-model:modelValue="model.icon" />
      </AFormItem>
      <AFormItem label="菜单路径" name="path">
        <AInput v-model:modelValue="model.path" />
      </AFormItem>
      <AFormItem label="组件路径" name="component">
        <AInput v-model:modelValue="model.component" />
      </AFormItem>
      <AFormItem label="排序" name="orderNum">
        <AInputNumber v-model:modelValue="model.orderNum" w-full />
      </AFormItem>
      <AFormItem label="状态" name="status">
        <ASelect v-model:modelValue="model.status">
          <ASelectOption value="0">正常</ASelectOption>
          <ASelectOption value="1">停用</ASelectOption>
        </ASelect>
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
