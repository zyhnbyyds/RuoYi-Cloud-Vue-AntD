import process from 'node:process';
import path from 'node:path';
import type { PluginOption } from 'vite';
import Icons from 'unplugin-icons/vite';
import IconsResolver from 'unplugin-icons/resolver';
import Components from 'unplugin-vue-components/vite';
import { AntDesignVueResolver } from 'unplugin-vue-components/resolvers';
import { FileSystemIconLoader } from 'unplugin-icons/loaders';
import { createSvgIconsPlugin } from 'vite-plugin-svg-icons';
import AutoImport from 'unplugin-auto-import/vite';

export function setupUnplugin(viteEnv: Env.ImportMeta) {
  const { VITE_ICON_PREFIX, VITE_ICON_LOCAL_PREFIX } = viteEnv;

  const localIconPath = path.join(process.cwd(), 'src/assets/svg-icon');

  /** The name of the local icon collection */
  const collectionName = VITE_ICON_LOCAL_PREFIX.replace(`${VITE_ICON_PREFIX}-`, '');

  const plugins: PluginOption[] = [
    Icons({
      compiler: 'vue3',
      customCollections: {
        [collectionName]: FileSystemIconLoader(localIconPath, svg =>
          svg.replace(/^<svg\s/, '<svg width="1em" height="1em" ')
        )
      },
      scale: 1,
      defaultClass: 'inline-block'
    }),
    Components({
      dts: 'src/typings/components.d.ts',
      types: [{ from: 'vue-router', names: ['RouterLink', 'RouterView'] }],
      resolvers: [
        AntDesignVueResolver({
          importStyle: false
        }),
        IconsResolver({ customCollections: [collectionName], componentPrefix: VITE_ICON_PREFIX })
      ]
    }),
    createSvgIconsPlugin({
      iconDirs: [localIconPath],
      symbolId: `${VITE_ICON_LOCAL_PREFIX}-[dir]-[name]`,
      inject: 'body-last',
      customDomId: '__SVG_ICON_LOCAL__'
    }),
    AutoImport({
      imports: [
        'vue',
        'vue-router',
        'vitest',
        '@vueuse/core',
        'pinia',
        { 'lodash-es': ['cloneDeep', 'assign', 'omit', 'pick'] },
        {
          'ant-design-vue': [
            ['message', '$message'],
            ['notification', '$notification'],
            ['Modal', '$modal']
          ]
        }
      ],
      dts: 'src/typings/auto-imports.d.ts',
      dirs: ['src/utils/**', 'src/store/modules/**', 'src/hooks/common/**', 'src/service/api/**']
    })
  ];

  return plugins;
}
