<script setup lang="ts">
import { SimpleScrollbar } from '@sa/materials';
import { useAntdForm, useFormRules } from '@/hooks/common/form';
import { $t } from '@/locales';
import { enableStatusOptions } from '@/constants/business';

defineOptions({
  name: 'UserOperateDrawer'
});

interface Props {
  /** the type of operation */
  operateType: AntDesign.TableOperateType;
  /** the edit row data */
  rowData?: Api.Auth.User | null;
  deptTreeData: Api.Common.CommonTree;
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
const { defaultRequiredRule, formRules } = useFormRules();
const [spinning, spin] = useToggle();

const title = computed(() => {
  const titles: Record<AntDesign.TableOperateType, string> = {
    add: $t('page.manage.user.addUser'),
    edit: $t('page.manage.user.editUser')
  };
  return titles[props.operateType];
});

type Model = Partial<
  Pick<Api.Auth.User, 'userName' | 'nickName' | 'email' | 'phonenumber' | 'status' | 'deptId' | 'remark'> & {
    postIds: number[];
    roleIds: number[];
    password?: string;
  }
>;

const model = ref<Model>(createDefaultModel());

const userPosts = ref<Api.SystemManage.Post[]>([]);
const userRoles = ref<Api.SystemManage.Role[]>([]);

function createDefaultModel(): Model {
  return {
    userName: '',
    nickName: '',
    email: '',
    phonenumber: '',
    status: '0',
    deptId: undefined,
    remark: '',
    postIds: [],
    roleIds: [],
    password: ''
  };
}

const rules = {
  userName: defaultRequiredRule,
  nickName: defaultRequiredRule,
  status: defaultRequiredRule,
  deptId: defaultRequiredRule,
  email: formRules.email,
  phonenumber: formRules.phone,
  password: formRules.pwd,
  postIds: defaultRequiredRule,
  roleIds: defaultRequiredRule
};

async function init(userId: number | undefined = undefined) {
  spin(true);
  try {
    await Promise.all([getUserPostAndRole(userId)]);
    spin(false);
  } catch (error) {
    spin(false);
  }
}

async function getUserPostAndRole(userId: number | undefined) {
  const { error, data } = await doGetUserPostsAndRoles(userId);
  if (!error) {
    const { postIds, posts, roleIds, roles } = data;
    userPosts.value = posts;
    userRoles.value = roles;
    model.value.postIds = postIds;
    model.value.roleIds = roleIds;
  }
}

async function handleUpdateModelWhenEdit() {
  if (props.operateType === 'add') {
    model.value = createDefaultModel();
  }

  if (props.operateType === 'edit' && props.rowData) {
    await init(props.rowData.userId);
    model.value = Object.assign(model.value, omit(props.rowData, ['postIds', 'roleIds']));
  } else {
    await init();
    model.value = createDefaultModel();
  }
}

function closeDrawer() {
  visible.value = false;
}

async function handleSubmit() {
  await validate();

  const { error } = await (props.operateType === 'edit' ? doPutUser : doPostUser)(model.value as Api.Auth.User);

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
      <ASpin :spinning="spinning" size="small">
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
          <AFormItem v-if="props.operateType === 'add'" :label="$t('page.manage.user.password')" name="password">
            <AInput
              v-model:value="model.password"
              type="password"
              :placeholder="$t('page.manage.user.form.password')"
            />
          </AFormItem>
          <AFormItem :label="$t('page.manage.user.post')" name="postIds">
            <ASelect
              v-model:value="model.postIds"
              :field-names="{ label: 'postName', value: 'postId' }"
              mode="multiple"
              :options="userPosts"
            />
          </AFormItem>
          <AFormItem :label="$t('page.manage.user.role')" name="roleIds">
            <ASelect
              v-model:value="model.roleIds"
              :field-names="{ label: 'roleName', value: 'roleId' }"
              mode="multiple"
              :options="userRoles"
            />
          </AFormItem>
          <AFormItem :label="$t('page.manage.user.status')" name="status">
            <ARadioGroup v-model:value="model.status">
              <ARadio v-for="item in enableStatusOptions" :key="item.value" :value="item.value">
                {{ $t(item.label) }}
              </ARadio>
            </ARadioGroup>
          </AFormItem>
          <AFormItem :label="$t('page.manage.user.dept')" name="deptId">
            <ATreeSelect v-model:value="model.deptId" :field-names="{ value: 'id' }" :tree-data="deptTreeData" />
          </AFormItem>
          <AFormItem :label="$t('page.manage.user.remark')" name="remark">
            <ATextarea v-model:value="model.remark" :placeholder="$t('page.manage.user.form.remark')" />
          </AFormItem>
        </AForm>
      </ASpin>
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
