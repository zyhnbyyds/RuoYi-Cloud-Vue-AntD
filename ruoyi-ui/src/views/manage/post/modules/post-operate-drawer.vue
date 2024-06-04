<script setup lang="ts">
import { SimpleScrollbar } from '@sa/materials';
import { useAntdForm, useFormRules } from '@/hooks/common/form';
import { $t } from '@/locales';
import { enableStatusOptions } from '@/constants/business';
import type { PostSubmitModel } from '@/service/api/post';

defineOptions({
  name: 'PostOperateDrawer'
});

interface Props {
  /** the type of operation */
  operateType: AntDesign.TableOperateType;
  /** the edit row data */
  rowData?: Api.SystemManage.Post | null;
}

const props = defineProps<Props>();

interface Emits {
  (e: 'submitted'): void;
}

const emit = defineEmits<Emits>();

const visible = defineModel<boolean>('visible', {
  default: false
});

const { formRef, validate, resetFields } = useAntdForm();
const { defaultRequiredRule } = useFormRules();

const title = computed(() => {
  const titles: Record<AntDesign.TableOperateType, string> = {
    add: $t('page.manage.post.addPost'),
    edit: $t('page.manage.post.editPost')
  };
  return titles[props.operateType];
});

const model = ref<PostSubmitModel>(createDefaultModel());

function createDefaultModel(): PostSubmitModel {
  return {
    postCode: '',
    postName: '',
    postSort: 0,
    status: '0',
    remark: ''
  };
}

type RuleKey = Exclude<keyof PostSubmitModel, 'remark'>;

const rules: Record<RuleKey, App.Global.FormRule> = {
  postCode: defaultRequiredRule,
  postName: defaultRequiredRule,
  postSort: defaultRequiredRule,
  status: defaultRequiredRule
};

function handleUpdateModelWhenEdit() {
  if (props.operateType === 'add') {
    model.value = createDefaultModel();
  }

  if (props.operateType === 'edit' && props.rowData) {
    model.value = { ...props.rowData };
  }
}

function closeDrawer() {
  visible.value = false;
}

async function handleSubmit() {
  await validate();

  const { error } = await (props.operateType === 'edit' ? doEditPost : doAddPost)(model.value);

  if (!error) {
    $message?.success($t(props.operateType === 'add' ? 'common.addSuccess' : 'common.updateSuccess'));
    closeDrawer();
    emit('submitted');
  }
}

watch(
  () => visible.value,
  val => {
    if (val) {
      handleUpdateModelWhenEdit();
      resetFields();
    }
  }
);
</script>

<template>
  <ADrawer
    v-model:open="visible"
    :body-style="{ paddingRight: '0px', paddingTop: '0', paddingBottom: '0' }"
    :title="title"
    :width="460"
  >
    <SimpleScrollbar>
      <AForm ref="formRef" py-20px pr-20px layout="vertical" :model="model" :rules="rules">
        <AFormItem :label="$t('page.manage.post.postCode')" name="postCode">
          <AInput v-model:value="model.postCode" :placeholder="$t('page.manage.post.form.postCode')" />
        </AFormItem>
        <AFormItem :label="$t('page.manage.post.postName')" name="postName">
          <AInput v-model:value="model.postName" :placeholder="$t('page.manage.post.form.postName')" />
        </AFormItem>
        <AFormItem :label="$t('page.manage.post.postSort')" name="postSort">
          <AInputNumber v-model:value="model.postSort" :placeholder="$t('page.manage.post.form.postSort')" />
        </AFormItem>
        <AFormItem :label="$t('page.manage.post.status')" name="status">
          <ARadioGroup v-model:value="model.status">
            <ARadio v-for="item in enableStatusOptions" :key="item.value" :value="item.value">
              {{ $t(item.label) }}
            </ARadio>
          </ARadioGroup>
        </AFormItem>
        <AFormItem :label="$t('page.manage.post.remark')" name="remark">
          <ATextarea v-model:value="model.remark" :placeholder="$t('page.manage.post.form.remark')" />
        </AFormItem>
      </AForm>
    </SimpleScrollbar>

    <template #footer>
      <div class="flex-y-center justify-end gap-12px">
        <AButton @click="closeDrawer">{{ $t('common.cancel') }}</AButton>
        <AButton type="primary" @click="handleSubmit">{{ $t('common.confirm') }}</AButton>
      </div>
    </template>
  </ADrawer>
</template>

<style scoped>
:deep(.ant-input-number) {
  width: 100%;
}
</style>
