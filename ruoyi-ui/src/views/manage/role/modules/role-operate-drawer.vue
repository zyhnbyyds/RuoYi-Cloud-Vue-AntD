<script setup lang="ts">
import { SimpleScrollbar } from '@sa/materials';
import { useAntdForm, useFormRules } from '@/hooks/common/form';
import { $t } from '@/locales';
import { enableStatusOptions } from '@/constants/business';
import { doPostRole, doPutRole } from '@/service/api/role';
import MenuAuth from './menu-auth.vue';

defineOptions({
  name: 'RoleOperateDrawer'
});

interface Props {
  /** the type of operation */
  operateType: AntDesign.TableOperateType;
  /** the edit row data */
  rowData?: Api.SystemManage.Role | null;
}

const props = defineProps<Props>();

interface Emits {
  (e: 'submitted'): void;
}

const emit = defineEmits<Emits>();

const visible = defineModel<boolean>('visible', {
  default: false
});
const menuAuthRef = ref<InstanceType<typeof MenuAuth> | null>(null);

const authStore = useAuthStore();

const { formRef, validate, resetFields } = useAntdForm();
const { defaultRequiredRule } = useFormRules();

const title = computed(() => {
  const titles: Record<AntDesign.TableOperateType, string> = {
    add: $t('page.manage.role.addRole'),
    edit: $t('page.manage.role.editRole')
  };
  return titles[props.operateType];
});

type Model = Pick<Api.SystemManage.Role, 'roleName' | 'roleKey' | 'remark' | 'status'> & { menuIds: number[] };

const model = ref<Model>(createDefaultModel());

function createDefaultModel(): Model {
  return {
    roleName: '',
    roleKey: '',
    remark: '',
    status: '0',
    menuIds: []
  };
}

type RuleKey = Exclude<keyof Model, 'remark' | 'menuIds'>;

const rules: Record<RuleKey, App.Global.FormRule> = {
  roleName: defaultRequiredRule,
  roleKey: defaultRequiredRule,
  status: defaultRequiredRule
};

const roleId = computed(() => props.rowData?.roleId || -1);

function handleUpdateModelWhenEdit() {
  if (props.operateType === 'add') {
    model.value = createDefaultModel();
  }

  if (props.operateType === 'edit' && props.rowData) {
    model.value = { ...props.rowData, menuIds: [] };
  }
}

function closeDrawer() {
  visible.value = false;
}

async function handleSubmit() {
  await validate();
  const menuIds = transformMenuChildWithRootIds(menuAuthRef.value?.tree || [], model.value.menuIds);

  const { error } = await (props.operateType === 'edit' ? doPutRole : doPostRole)({
    ...model.value,
    menuIds,
    menuCheckStrictly: true
  } as Api.SystemManage.Role);

  if (!error) {
    authStore.refreshUserInfo();
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
    } else {
      menuAuthRef.value?.clearChecks();
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
        <AFormItem :label="$t('page.manage.role.roleName')" name="roleName">
          <AInput v-model:value="model.roleName" :placeholder="$t('page.manage.role.form.roleName')" />
        </AFormItem>
        <AFormItem :label="$t('page.manage.role.roleCode')" name="roleKey">
          <AInput v-model:value="model.roleKey" :placeholder="$t('page.manage.role.form.roleCode')" />
        </AFormItem>
        <AFormItem :label="$t('page.manage.role.roleStatus')" name="status">
          <ARadioGroup v-model:value="model.status">
            <ARadio v-for="item in enableStatusOptions" :key="item.value" :value="item.value">
              {{ $t(item.label) }}
            </ARadio>
          </ARadioGroup>
        </AFormItem>
        <AFormItem :label="$t('page.manage.role.roleDesc')" name="roleDesc">
          <AInput v-model:value="model.remark" :placeholder="$t('page.manage.role.form.roleDesc')" />
        </AFormItem>

        <AFormItem>
          <MenuAuth
            ref="menuAuthRef"
            v-model:menu-ids="model.menuIds"
            :drawer-visible="visible"
            :type="operateType"
            :role-id="roleId"
          />
          <template #label>
            <div class="w-full flex-between">
              <span>{{ $t('page.manage.role.menuAuth') }}</span>
            </div>
          </template>
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
