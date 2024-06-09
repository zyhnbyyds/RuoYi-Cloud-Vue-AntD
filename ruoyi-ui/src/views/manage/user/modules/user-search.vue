<script setup lang="ts">
import { $t } from '@/locales';
import { enableStatusOptions } from '@/constants/business';

defineOptions({
  name: 'UserSearch'
});

interface Emits {
  (e: 'reset'): void;
  (e: 'search'): void;
}

defineProps<{
  deptTreeData: Api.Common.CommonTree;
}>();

const emit = defineEmits<Emits>();

const model = defineModel<Api.SystemManage.UserSearchParams>('model', { required: true });

function reset() {
  emit('reset');
}

function search() {
  emit('search');
}
</script>

<template>
  <ACard :title="$t('common.search')" :bordered="false" class="card-wrapper">
    <AForm :model="model" :label-width="80">
      <ARow :gutter="[16, 16]" wrap>
        <ACol :span="24" :md="12" :lg="4">
          <AFormItem :label="$t('page.manage.user.userName')" name="userName" class="m-0">
            <AInput v-model:value="model.userName" :placeholder="$t('page.manage.user.form.userName')" />
          </AFormItem>
        </ACol>
        <ACol :span="24" :md="12" :lg="4">
          <AFormItem :label="$t('page.manage.user.phonenumber')" name="phonenumber" class="m-0">
            <AInput v-model:value="model.phonenumber" :placeholder="$t('page.manage.user.form.phonenumber')" />
          </AFormItem>
        </ACol>
        <ACol :span="24" :md="12" :lg="4">
          <AFormItem :label="$t('page.manage.user.status')" name="status" class="m-0">
            <ASelect v-model:value="model.status" :placeholder="$t('page.manage.user.form.status')" allow-clear>
              <ASelectOption v-for="option in enableStatusOptions" :key="option.value" :value="option.value">
                {{ $t(option.label) }}
              </ASelectOption>
            </ASelect>
          </AFormItem>
        </ACol>
        <ACol :span="24" :md="12" :lg="4">
          <!-- 部门 -->
          <AFormItem :label="$t('page.manage.user.dept')" name="deptId" class="m-0">
            <ATreeSelect
              v-model:value="model.deptId"
              :field-names="{ value: 'id' }"
              :placeholder="$t('page.manage.user.form.dept')"
              :tree-data="deptTreeData"
              :tree-default-expand-all="true"
              :allow-clear="true"
            />
          </AFormItem>
        </ACol>
        <ACol :span="24" :md="12" :lg="8">
          <AFormItem class="m-0">
            <div class="w-full flex-y-center justify-end gap-12px">
              <AButton @click="reset">
                <div class="flex-y-center gap-8px">
                  <icon-ic-round-refresh class="text-icon" />
                  <span>{{ $t('common.reset') }}</span>
                </div>
              </AButton>
              <AButton type="primary" ghost @click="search">
                <div class="flex-y-center gap-8px">
                  <icon-ic-round-search class="text-icon" />
                  <span>{{ $t('common.search') }}</span>
                </div>
              </AButton>
            </div>
          </AFormItem>
        </ACol>
      </ARow>
    </AForm>
  </ACard>
</template>

<style scoped></style>
