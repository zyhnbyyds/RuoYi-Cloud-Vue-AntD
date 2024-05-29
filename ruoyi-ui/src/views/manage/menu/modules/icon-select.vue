<script lang="ts" setup>
import { Icon } from '@iconify/vue';
import { SimpleScrollbar } from '~/packages/materials/src';
import { icons } from './icon';
const visible = ref(false);
defineOptions({
  name: 'IconSelect'
});

const value = defineModel<string>({ default: '' });
const iconSelectRef = ref<HTMLElement | null>(null);
const { isOutside } = useMouseInElement(iconSelectRef);

const blur = () => {
  if (isOutside.value) {
    visible.value = false;
  }
};

function selectIcon(icon: string) {
  value.value = icon;
  setTimeout(() => {
    visible.value = false;
  }, 100);
}
</script>

<template>
  <div relative>
    <div flex items-center gap-2 @click="visible = true">
      <AInput v-model:value="value" @blur="blur">
        <template #suffix>
          <Icon v-if="value" text-4 :icon="`${value}`" @click.prevent="() => {}"></Icon>
          <Icon v-if="!value" text-4 icon="carbon:apps" @click.prevent="() => {}"></Icon>
        </template>
      </AInput>
    </div>

    <Transition>
      <template v-if="visible">
        <div
          ref="iconSelectRef"
          class="absolute left-0 top-36px z-3000 h-80 w-92 rounded-md bg-light-2 shadow-md dark:bg-dark-4"
        >
          <SimpleScrollbar>
            <div flex="~ wrap" gap-1 p-4>
              <div
                v-for="icon in icons"
                :key="icon"
                :class="
                  icon === value ? 'text-dark-800 bg-gray-200 dark:text-gray-4 dark:bg-dark6' : 'text-gray-500 bg-none'
                "
                hover="bg-light-500 dark:bg-dark-500 "
                class="flex-center cursor-pointer rounded-md p-2 transition-all"
                @click="selectIcon(icon)"
              >
                <Icon class="text-5.5 font-bold" :icon="`${icon}`" />
              </div>
            </div>
          </SimpleScrollbar>
        </div>
      </template>
    </Transition>
  </div>
</template>

<style scoped></style>
