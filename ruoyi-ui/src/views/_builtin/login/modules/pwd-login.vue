<script setup lang="ts">
import { $t } from '@/locales';
import { useAntdForm, useFormRules } from '@/hooks/common/form';
import { useAuthStore } from '@/store/modules/auth';
import { doGetCheckCode } from '@/service/api/auth';

defineOptions({
  name: 'PwdLogin'
});

const authStore = useAuthStore();
const { formRef, validate } = useAntdForm();
const { patternRules } = useFormRules();
const codeImg = ref('');

getCheckCode();

const model = reactive({
  username: 'admin',
  password: 'admin123',
  code: '',
  uuid: ''
});

const rules = {
  username: patternRules.username,
  password: patternRules.pwd
};

async function handleSubmit() {
  await validate();
  await authStore.login({
    loginForm: model,
    onError() {
      getCheckCode();
    }
  });
}

async function getCheckCode() {
  const { data, error } = await doGetCheckCode();
  if (!error) {
    codeImg.value = `data:image/png;base64,${data.img}`;
    model.uuid = data.uuid;
  }
}
</script>

<template>
  <AForm ref="formRef" :model="model" :rules="rules">
    <AFormItem name="username">
      <AInput v-model:value="model.username" size="large" :placeholder="$t('page.login.common.userNamePlaceholder')" />
    </AFormItem>
    <AFormItem name="password">
      <AInputPassword
        v-model:value="model.password"
        size="large"
        :placeholder="$t('page.login.common.passwordPlaceholder')"
      />
    </AFormItem>
    <AFormItem>
      <div class="flex gap-4">
        <AInput v-model:value="model.code" size="large" :placeholder="$t('page.login.common.checkCode')">
          <template #suffix></template>
        </AInput>
        <AImage :preview="false" :src="codeImg" @click="getCheckCode" />
      </div>
    </AFormItem>

    <ASpace direction="vertical" size="large" class="w-full">
      <div class="flex-y-center justify-between">
        <ACheckbox>{{ $t('page.login.pwdLogin.rememberMe') }}</ACheckbox>
        <AButton type="text">{{ $t('page.login.pwdLogin.forgetPassword') }}</AButton>
      </div>
      <AButton type="primary" block size="large" shape="round" :loading="authStore.loginLoading" @click="handleSubmit">
        {{ $t('common.confirm') }}
      </AButton>
    </ASpace>
  </AForm>
</template>

<style scoped></style>
