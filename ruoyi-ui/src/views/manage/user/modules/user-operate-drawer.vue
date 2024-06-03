<script setup lang="ts">
import { SimpleScrollbar } from '@sa/materials';
import { useAntdForm, useFormRules } from '@/hooks/common/form';
import { $t } from '@/locales';
import { enableStatusOptions } from '@/constants/business';
import { doPostUser, doPutUser } from '@/service/api/user';

defineOptions({
  name: 'UserOperateDrawer'
});

interface Props {
  /** the type of operation */
  operateType: AntDesign.TableOperateType;
  /** the edit row data */
  rowData?: Api.Auth.User | null;
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
const { defaultRequiredRule, patternRules } = useFormRules();

const title = computed(() => {
  const titles: Record<AntDesign.TableOperateType, string> = {
    add: $t('page.manage.user.addUser'),
    edit: $t('page.manage.user.editUser')
  };
  return titles[props.operateType];
});

type Model = Pick<Api.Auth.User, 'userName' | 'nickName' | 'email' | 'phonenumber' | 'status' | 'deptId' | 'remark'>;

const model = ref<Model>(createDefaultModel());

function createDefaultModel(): Model {
  return {
    userName: '',
    nickName: '',
    email: '',
    phonenumber: '',
    status: '0',
    deptId: 0,
    remark: ''
  };
}

type RuleKey = Exclude<keyof Model, 'remark'>;

const rules: Record<RuleKey, App.Global.FormRule> = {
  userName: defaultRequiredRule,
  nickName: defaultRequiredRule,
  status: defaultRequiredRule,
  deptId: defaultRequiredRule,
  email: patternRules.email,
  phonenumber: patternRules.phone
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

  const { error } = await (props.operateType === 'edit' ? doPutUser : doPostUser)({
    ...model.value
  } as Api.Auth.User);

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
        <AFormItem :label="$t('page.manage.user.userName')" name="userName">
          <AInput v-model:value="model.userName" :placeholder="$t('page.manage.user.form.userName')" />
        </AFormItem>
        <AFormItem :label="$t('page.manage.user.nickName')" name="nickName">
          <AInput v-model:value="model.nickName" :placeholder="$t('page.manage.user.form.nickName')" />
        </AFormItem>
        <AFormItem :label="$t('page.manage.user.email')" name="email">
          <AInput v-model:value="model.email" :placeholder="$t('page.manage.user.form.email')" />
        </AFormItem>
        <AFormItem :label="$t('page.manage.user.phonenumber')" name="phonenumber">
          <AInput v-model:value="model.phonenumber" :placeholder="$t('page.manage.user.form.phonenumber')" />
        </AFormItem>
        <AFormItem :label="$t('page.manage.user.status')" name="status">
          <ARadioGroup v-model:value="model.status">
            <ARadio v-for="item in enableStatusOptions" :key="item.value" :value="item.value">
              {{ $t(item.label) }}
            </ARadio>
          </ARadioGroup>
        </AFormItem>
        <AFormItem :label="$t('page.manage.user.dept')" name="deptId">
          <!-- <DepartmentTreeSelect v-model:value="model.deptId" /> -->
        </AFormItem>
        <AFormItem :label="$t('page.manage.user.remark')" name="remark">
          <ATextarea v-model:value="model.remark" :placeholder="$t('page.manage.user.form.remark')" />
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

<style scoped></style>
