<script lang="ts" setup>
import { $t } from '@/locales';
import type { DeptFormType } from '@/service/api/dept';
import { formRules, resetForm, statusOptions } from './form';

const props = defineProps<{
  operateType: AntDesign.TableOperateType;
  editingData?: Api.SystemManage.Dept | null;
  treeData?: Api.SystemManage.Dept[];
}>();
const emits = defineEmits<{
  'submit-success': [];
}>();

const visible = defineModel<boolean>('visible', {
  default: false
});
const { formRef, validate, resetFields } = useAntdForm();

const model = ref<DeptFormType>(resetForm());

const title = computed(() => {
  const titles: Record<AntDesign.TableOperateType, string> = {
    add: '新增部门',
    edit: '编辑部门'
  };
  return titles[props.operateType];
});

watch(visible, val => {
  if (val) {
    if (props.operateType === 'edit' && props.editingData) {
      model.value = { ...props.editingData };
    }
  } else {
    resetFields();
    model.value = resetForm();
  }
});

const submitForm = async () => {
  await validate();
  if (!formRef.value?.validate) return;
  if (props.operateType === 'edit' && !props.editingData?.deptId) return;

  const { error } = await (props.operateType === 'add'
    ? doAddDept(model.value)
    : doEditDept({ ...model.value, deptId: props.editingData!.deptId }));

  if (!error) {
    $message?.success($t(props.operateType === 'add' ? 'common.addSuccess' : 'common.updateSuccess'));
    emits('submit-success');
  }
  closeModal();
};

function closeModal() {
  visible.value = false;
  resetFields();
}
</script>

<template>
  <AModal v-model:open="visible" :title="title" :width="700">
    <AForm
      ref="formRef"
      mt-7
      :label-col="{ span: 5 }"
      :wrapper-col="{ span: 17, offset: 1 }"
      :model="model"
      :rules="formRules"
    >
      <ARow :gutter="[16, 16]">
        <ACol :xs="24" :sm="12">
          <AFormItem label="上级部门" name="parentId">
            <ATreeSelect
              v-model:value="model.parentId"
              :default-value="100"
              :field-names="{ value: 'deptId', label: 'deptName' }"
              :tree-data="treeData"
              show-search
              allow-clear
              tree-node-filter-prop="label"
            />
          </AFormItem>
        </ACol>
        <ACol :xs="24" :sm="12">
          <AFormItem label="部门名称" name="deptName">
            <AInput v-model:value="model.deptName" />
          </AFormItem>
        </ACol>
        <ACol :xs="24" :sm="12">
          <AFormItem label="负责人" name="leader">
            <AInput v-model:value="model.leader" />
          </AFormItem>
        </ACol>
        <ACol :xs="24" :sm="12">
          <AFormItem label="联系电话" name="phone">
            <AInput v-model:value="model.phone" />
          </AFormItem>
        </ACol>
        <ACol :xs="24" :sm="12">
          <AFormItem label="邮箱" name="email">
            <AInput v-model:value="model.email" />
          </AFormItem>
        </ACol>
        <ACol :xs="24" :sm="12">
          <AFormItem label="状态" name="status">
            <ASelect v-model:value="model.status" :options="statusOptions" />
          </AFormItem>
        </ACol>
        <ACol :xs="24" :sm="12">
          <AFormItem label="排序" name="orderNum">
            <AInputNumber v-model:value="model.orderNum" w-full />
          </AFormItem>
        </ACol>
        <ACol :span="24">
          <AFormItem :label-col="{ span: 3 }" :wrapper-col="{ span: 20, offset: 0 }" label="备注" name="remark">
            <ATextarea v-model:value="model.remark" />
          </AFormItem>
        </ACol>
      </ARow>
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
