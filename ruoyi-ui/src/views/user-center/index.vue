<script setup lang="ts">
import { useAuthStore } from '@/store/modules/auth';

const authStore = useAuthStore();
</script>

<template>
  <div>{{ authStore.userInfo.user }}</div>
</template>

<style scoped></style>
