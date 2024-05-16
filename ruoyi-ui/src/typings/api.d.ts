/**
 * Namespace Api
 *
 * All backend api type
 */
declare namespace Api {
  namespace Common {
    /** common params of paginating */
    interface PaginatingCommonParams {
      /** total count */
      total: number;
    }

    /** common params of paginating query list data */
    interface PaginatingQueryRecord<T = any> extends PaginatingCommonParams {
      rows: T[];
    }

    /**
     * enable status
     *
     * - "0": enabled
     * - "1": disabled
     */
    type EnableStatus = '1' | '0';

    /** common record */
    type CommonRecord<T = any> = {
      /** record creator */
      createBy: string;
      /** record create time */
      createTime: string;
      /** record updater */
      updateBy: string;
      /** record update time */
      updateTime: string;
      /** record status */
      status: EnableStatus;
    } & T;
  }

  namespace Department {
    interface Dept {
      createBy: any;
      createTime: any;
      updateBy: any;
      updateTime: any;
      remark: any;
      deptId: number;
      parentId: number;
      ancestors: string;
      deptName: string;
      orderNum: number;
      leader: string;
      phone: any;
      email: any;
      status: string;
      delFlag: any;
      parentName: any;
      children: any[];
    }
  }

  /**
   * Namespace Auth
   *
   * Backend api module: "auth"
   */
  namespace Auth {
    interface LoginToken {
      access_token: string;
      refreshToken: string;
    }
    /** User info */
    interface UserInfo {
      user: User | null;
      roles: string[];
      buttons: string[];
      /** permissions */
      permissions: string[];
    }

    interface User {
      createBy: string;
      createTime: string;
      updateBy: any;
      updateTime: any;
      remark: string;
      userId: number;
      deptId: number;
      userName: string;
      nickName: string;
      email: string;
      phonenumber: string;
      sex: string;
      avatar: string;
      password: string;
      status: string;
      delFlag: string;
      loginIp: string;
      loginDate: string;
      dept: Department.Dept;
      roles: Role[];
      roleIds: any;
      postIds: any;
      roleId: any;
      admin: boolean;
    }

    interface Role {
      remark: any;
      roleId: number;
      roleName: string;
      roleKey: string;
      roleSort: number;
      dataScope: string;
      menuCheckStrictly: boolean;
      deptCheckStrictly: boolean;
      status: string;
      delFlag: '0' | '1';
      flag: boolean;
      menuIds: number[] | null;
      deptIds: number[] | null;
      permissions: any;
      admin: boolean;
    }

    interface LoginBody {
      username: string;
      password: string;
      code: string;
      uuid: string;
    }
  }

  /**
   * Namespace Route
   *
   * Backend api module: "route"
   */
  namespace Route {
    type ElegantConstRoute = import('@elegant-router/types').ElegantConstRoute;

    interface MenuRoute extends ElegantConstRoute {
      id: string;
    }

    interface UserRoute {
      routes: MenuRoute[];
      home: import('@elegant-router/types').LastLevelRouteKey;
    }
  }

  /**
   * namespace SystemManage
   *
   * backend api module: "systemManage"
   */
  namespace SystemManage {
    type CommonSearchParams = {
      /** page number */
      pageNum: number;
      /** page size */
      pageSize: number;
    };

    /** role */
    type Role = Common.CommonRecord<{
      remark: string;
      roleId: number;
      roleName: string;
      roleKey: string;
      roleSort: number;
      dataScope: string;
      menuCheckStrictly: boolean;
      deptCheckStrictly: boolean;
      status: string;
      delFlag: '0' | '1';
      flag: boolean;
      menuIds: number[] | null;
      deptIds: number[] | null;
      permissions: string;
      admin: boolean;
    }>;

    /** role search params */
    type RoleSearchParams = Partial<
      Pick<Api.SystemManage.Role, 'roleName' | 'roleKey' | 'status'> & CommonSearchParams
    >;

    /** role list */
    type RoleList = Common.PaginatingQueryRecord<Role>;

    /** all role */
    type AllRole = Pick<Role, 'roleId' | 'roleName' | 'remark' | 'roleKey'>;

    /**
     * user gender
     *
     * - "1": "male"
     * - "2": "female"
     */
    type UserGender = '1' | '2';

    /** user */
    type User = Common.CommonRecord<{
      /** user name */
      username: string;
      /** user gender */
      userGender: UserGender | null;
      /** user nick name */
      nickName: string;
      /** user phone */
      userPhone: string;
      /** user email */
      userEmail: string;
      /** user role code collection */
      userRoles: string[];
    }>;

    /** user search params */
    type UserSearchParams = CommonType.RecordNullable<
      Pick<Api.SystemManage.User, 'username' | 'userGender' | 'nickName' | 'userPhone' | 'userEmail' | 'status'> &
        CommonSearchParams
    >;

    /** user list */
    type UserList = Common.PaginatingQueryRecord<User>;

    /**
     * menu type
     *
     * - "1": directory
     * - "2": menu
     */
    type MenuType = '1' | '2';

    type MenuButton = {
      /**
       * button code
       *
       * it can be used to control the button permission
       */
      code: string;
      /** button description */
      desc: string;
    };

    /**
     * icon type
     *
     * - "1": iconify icon
     * - "2": local icon
     */
    type IconType = '1' | '2';

    type Menu = Common.CommonRecord<{
      /** parent menu id */
      parentId: number;
      /** menu type */
      menuType: MenuType;
      /** menu name */
      menuName: string;
      /** route name */
      routeName: string;
      /** route path */
      routePath: string;
      /** component */
      component?: string;
      menuId: number;
      path: string;
      /**
       * i18n key
       *
       * it is for internationalization
       */
      i18nKey?: App.I18n.I18nKey;
      /** iconify icon name or local icon name */
      icon: string;
      /** icon type */
      iconType: IconType;
      /** menu order */
      order: number;
      /** whether to cache the route */
      keepAlive?: boolean;
      /** outer link */
      href?: string;
      /** whether to hide the route in the menu */
      hideInMenu?: boolean;
      /**
       * The menu key will be activated when entering the route
       *
       * The route is not in the menu
       *
       * @example
       *   the route is "user_detail", if it is set to "user_list", the menu "user_list" will be activated
       */
      activeMenu?: import('@elegant-router/types').LastLevelRouteKey;
      /** By default, the same route path will use one tab, if set to true, it will use multiple tabs */
      multiTab?: boolean;
      /** If set, the route will be fixed in tabs, and the value is the order of fixed tabs */
      fixedIndexInTab?: number;
      /** menu buttons */
      buttons?: MenuButton[];
      /** children menu */
      children?: Menu[];
    }>;

    /** menu list */
    type MenuList = Common.PaginatingQueryRecord<Menu>;

    type MenuTree = {
      id: number;
      label: string;
      pId: number;
      children?: MenuTree[];
    };
  }
}
