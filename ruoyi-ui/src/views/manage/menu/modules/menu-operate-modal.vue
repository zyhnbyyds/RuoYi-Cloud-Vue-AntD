<script lang="ts" setup>
import type {} from 'ant-design-vue';
import { generatedRoutes } from '@/router/elegant/routes';
import { $t } from '@/locales';
import type { MenuModelType } from './form';
import { formRules, menuStatusOptions, menuTypeOptions, resetAddForm } from './form';
import IconSelect from './icon-select.vue';

const props = defineProps<{
  operateType: AntDesign.TableOperateType;
  editingData?: Api.SystemManage.Menu | null;
}>();

const visible = defineModel<boolean>('visible', {
  default: false
});
const { formRef, validate, resetFields } = useAntdForm();

const model = ref<MenuModelType>(resetAddForm());
const treeData = ref<Api.SystemManage.MenuTree[]>([]);

const title = computed(() => {
  const titles: Record<AntDesign.TableOperateType, string> = {
    add: '新增菜单',
    edit: '编辑菜单'
  };
  return titles[props.operateType];
});

// TODO: 根据菜单类型动态加载组件路径、目录类型只允许选择带有子元素的，菜单类型只允许选择没有子元素的
const componentOptions = computed(() => {
  const excludePaths = ['/404', '/403', '/500'];
  function transformRoutes(routes: any[]): any[] {
    return routes.filter(route => {
      if (route.children) {
        route.children = transformRoutes(route.children);
        return true;
      }
      if (!route.hideInMenu && !excludePaths.includes(route.path) && !route.path.startsWith('/login')) {
        return true;
      }
      return false;
    });
  }

  return transformRoutes(generatedRoutes);
});

watch(visible, val => {
  if (val) {
    if (props.operateType === 'edit' && props.editingData) {
      model.value = {
        ...props.editingData,
        parentId: props.editingData.parentId || 0,
        hideInMenu: props.editingData.visible === '0' ? '1' : '0'
      };
    }
  } else {
    resetFields();
    model.value = resetAddForm();
  }
});

const submitForm = async () => {
  await validate();
  const { error } = await (props.operateType === 'add' ? doAddMenu(model.value) : doEditMenu(model.value));
  if (!error) {
    $message?.success($t(props.operateType === 'add' ? 'common.addSuccess' : 'common.updateSuccess'));
  }
  closeModal();
};

function closeModal() {
  visible.value = false;
  resetFields();
  model.value = resetAddForm();
}

async function getTreeData() {
  const { data, error } = await fetchGetMenuTree();
  if (!error && data) {
    // 添加根节点
    treeData.value = [
      {
        id: 0,
        pId: -1,
        label: '根节点',
        children: data
      }
    ];
  }
}

function handleTreeSelect(_val: string, node: any) {
  model.value.component = node.component;
  model.value.name = node.name;
}

getTreeData();
</script>

<template>
  <AModal v-model:open="visible" :title="title" :width="700">
    <AForm
      ref="formRef"
      :model="model"
      :rules="formRules"
      :label-col="{ span: 6 }"
      :wrapper-col="{ span: 16, offset: 1 }"
      class="grid grid-cols-2 gap-3 px-4 py-4 pt-6"
    >
      <AFormItem label="上级菜单" name="parentId">
        <ATreeSelect
          v-model:value="model.parentId"
          show-search
          :field-names="{ value: 'id' }"
          allow-clear
          :tree-data="treeData"
          tree-node-filter-prop="label"
        />
      </AFormItem>
      <AFormItem label="菜单名称" name="menuName">
        <AInput v-model:value="model.menuName" />
      </AFormItem>
      <AFormItem label="菜单类型" name="menuType">
        <ASelect v-model:value="model.menuType" :options="menuTypeOptions" />
      </AFormItem>
      <AFormItem v-if="model.menuType !== 'F'" label="菜单图标" name="icon">
        <IconSelect v-model="model.icon" />
      </AFormItem>
      <AFormItem v-if="model.menuType === 'C'" label="是否外链">
        <ARadioGroup v-model:value="model.isFrame" name="radioGroup" @change="() => (model.path = '')">
          <ARadio value="0">是</ARadio>
          <ARadio value="1">否</ARadio>
        </ARadioGroup>
      </AFormItem>
      <AFormItem v-if="model.menuType !== 'F'" label="菜单路径" name="path">
        <div>
          <!-- @vue-ignore -->
          <ATreeSelect
            v-if="model.isFrame === '1'"
            v-model:value="model.path"
            show-search
            :field-names="{ value: 'path', label: 'path' }"
            allow-clear
            :tree-data="componentOptions"
            tree-node-filter-prop="label"
            @select="(_val, node) => handleTreeSelect"
          />
          <AInput v-else v-model:value="model.path" />
        </div>
      </AFormItem>
      <AFormItem v-if="model.menuType === 'C'" label="隐藏菜单" name="hideInMenu">
        <ASwitch v-model:checked="model.hideInMenu" checked-value="0" un-checked-value="1" />
      </AFormItem>
      <AFormItem label="排序" name="orderNum">
        <AInputNumber v-model:value="model.orderNum" w-full />
      </AFormItem>
      <AFormItem v-if="model.menuType !== 'F'" label="状态" name="status">
        <ASelect v-model:value="model.status" :options="menuStatusOptions" />
      </AFormItem>
      <AFormItem v-if="model.menuType === 'C'" label="缓存" name="isCache">
        <ASwitch v-model:checked="model.isCache" checked-value="0" un-checked-value="1" />
      </AFormItem>
      <AFormItem v-if="model.menuType === 'F'" label="权限标识" name="perms">
        <AInput v-model:value="model.perms" />
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
