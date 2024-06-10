/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : ry-cloud

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 10/06/2024 11:56:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(0) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(0) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(0) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(0) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(0) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(0) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(0) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(0) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(0) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-05-08 21:50:55', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-05-08 21:50:55', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-05-08 21:50:55', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-05-08 21:50:55', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-05-08 21:50:55', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-08 21:50:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-08 21:50:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-08 21:50:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-08 21:50:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-08 21:50:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-08 21:50:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-08 21:50:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-08 21:50:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-08 21:50:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-05-08 21:50:54', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '嵌入式部门', 1, '小美', '19939926438', '19939926438@163.com', '1', '0', 'ryadmin', '2024-06-02 16:16:37', 'admin', '2024-06-02 17:24:11', 'ttt');
INSERT INTO `sys_dept` VALUES (201, 100, '0,100', '后端部门', 3, '小黑', '19939926438', NULL, '0', '2', 'admin', '2024-06-02 16:52:12', '', NULL, '测试111');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-05-08 21:50:55', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '测试字典', 'sys_test_type', '0', 'admin', '2024-06-09 22:46:22', '', NULL, 'dsadasd');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-05-08 21:50:55', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-05-08 21:50:55', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-05-08 21:50:55', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`access_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 209 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-09 22:23:21');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-10 20:06:29');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '0', '退出成功', '2024-05-10 20:37:17');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-10 20:37:24');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '0', '退出成功', '2024-05-10 21:57:44');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-10 22:01:41');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2024-05-12 15:46:14');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 15:46:56');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2024-05-12 16:12:57');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '1', '密码输入错误1次', '2024-05-12 16:23:30');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '1', '密码输入错误2次', '2024-05-12 16:31:25');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '1', '密码输入错误3次', '2024-05-12 16:32:22');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '1', '密码输入错误4次', '2024-05-12 16:36:56');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '1', '密码输入错误5次', '2024-05-12 16:44:37');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 17:04:47');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 17:16:01');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 17:16:38');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 17:26:15');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 17:27:54');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 17:31:19');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 17:32:52');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 19:25:44');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 19:26:20');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 19:35:21');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 19:37:48');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 19:46:33');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 19:50:06');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 19:52:19');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 20:22:28');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 20:33:50');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 21:33:33');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 21:40:01');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 21:40:27');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '182.230.201.126', '0', '登录成功', '2024-05-12 21:50:05');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 23:38:10');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '0', '退出成功', '2024-05-12 23:38:10');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 23:38:31');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '0', '退出成功', '2024-05-12 23:38:32');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-12 23:41:16');
INSERT INTO `sys_logininfor` VALUES (139, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-12 23:54:03');
INSERT INTO `sys_logininfor` VALUES (140, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-12 23:56:18');
INSERT INTO `sys_logininfor` VALUES (141, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-12 23:58:25');
INSERT INTO `sys_logininfor` VALUES (142, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 00:04:00');
INSERT INTO `sys_logininfor` VALUES (143, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 00:07:03');
INSERT INTO `sys_logininfor` VALUES (144, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 00:08:20');
INSERT INTO `sys_logininfor` VALUES (145, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 00:29:25');
INSERT INTO `sys_logininfor` VALUES (146, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 00:33:44');
INSERT INTO `sys_logininfor` VALUES (147, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 00:40:29');
INSERT INTO `sys_logininfor` VALUES (148, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 00:48:33');
INSERT INTO `sys_logininfor` VALUES (149, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 00:54:22');
INSERT INTO `sys_logininfor` VALUES (150, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 20:45:08');
INSERT INTO `sys_logininfor` VALUES (151, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 20:58:00');
INSERT INTO `sys_logininfor` VALUES (152, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 21:44:12');
INSERT INTO `sys_logininfor` VALUES (153, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 21:44:35');
INSERT INTO `sys_logininfor` VALUES (154, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 21:47:01');
INSERT INTO `sys_logininfor` VALUES (155, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-13 21:50:29');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-14 00:22:50');
INSERT INTO `sys_logininfor` VALUES (157, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-14 21:41:43');
INSERT INTO `sys_logininfor` VALUES (158, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-14 21:44:57');
INSERT INTO `sys_logininfor` VALUES (159, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-14 22:30:28');
INSERT INTO `sys_logininfor` VALUES (160, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-14 22:41:12');
INSERT INTO `sys_logininfor` VALUES (161, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-14 22:45:44');
INSERT INTO `sys_logininfor` VALUES (162, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-14 22:47:33');
INSERT INTO `sys_logininfor` VALUES (163, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-15 19:05:23');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-15 19:13:18');
INSERT INTO `sys_logininfor` VALUES (165, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-15 20:10:04');
INSERT INTO `sys_logininfor` VALUES (166, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-16 19:51:32');
INSERT INTO `sys_logininfor` VALUES (167, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-16 22:05:57');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-16 22:09:29');
INSERT INTO `sys_logininfor` VALUES (169, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-16 22:12:01');
INSERT INTO `sys_logininfor` VALUES (170, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-16 22:21:27');
INSERT INTO `sys_logininfor` VALUES (171, 'ryadmin', '127.0.0.1', '1', '登录用户不存在', '2024-05-16 22:22:35');
INSERT INTO `sys_logininfor` VALUES (172, 'ryadmin', '127.0.0.1', '1', '登录用户不存在', '2024-05-16 22:23:02');
INSERT INTO `sys_logininfor` VALUES (173, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-16 22:26:44');
INSERT INTO `sys_logininfor` VALUES (174, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-16 22:32:08');
INSERT INTO `sys_logininfor` VALUES (175, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-16 22:45:55');
INSERT INTO `sys_logininfor` VALUES (176, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-16 22:56:56');
INSERT INTO `sys_logininfor` VALUES (177, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-16 23:00:59');
INSERT INTO `sys_logininfor` VALUES (178, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-16 23:27:56');
INSERT INTO `sys_logininfor` VALUES (179, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-18 14:16:25');
INSERT INTO `sys_logininfor` VALUES (180, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-18 21:00:58');
INSERT INTO `sys_logininfor` VALUES (181, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-18 22:46:18');
INSERT INTO `sys_logininfor` VALUES (182, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-18 22:49:03');
INSERT INTO `sys_logininfor` VALUES (183, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-18 22:54:51');
INSERT INTO `sys_logininfor` VALUES (184, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-18 22:55:03');
INSERT INTO `sys_logininfor` VALUES (185, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-21 22:16:28');
INSERT INTO `sys_logininfor` VALUES (186, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-21 23:03:49');
INSERT INTO `sys_logininfor` VALUES (187, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-22 21:28:07');
INSERT INTO `sys_logininfor` VALUES (188, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-25 11:08:17');
INSERT INTO `sys_logininfor` VALUES (189, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-26 16:17:27');
INSERT INTO `sys_logininfor` VALUES (190, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-28 21:32:30');
INSERT INTO `sys_logininfor` VALUES (191, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-28 23:11:13');
INSERT INTO `sys_logininfor` VALUES (192, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-28 23:13:56');
INSERT INTO `sys_logininfor` VALUES (193, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-29 22:24:27');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '0', '登录成功', '2024-05-29 23:35:24');
INSERT INTO `sys_logininfor` VALUES (195, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-05-30 23:13:04');
INSERT INTO `sys_logininfor` VALUES (196, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-06-01 20:58:09');
INSERT INTO `sys_logininfor` VALUES (197, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-06-02 09:01:44');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-02 16:21:17');
INSERT INTO `sys_logininfor` VALUES (199, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-06-02 16:24:08');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-02 16:27:34');
INSERT INTO `sys_logininfor` VALUES (201, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-06-02 16:29:13');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-02 16:29:29');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-02 16:35:44');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-03 21:39:52');
INSERT INTO `sys_logininfor` VALUES (205, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-06-04 22:13:51');
INSERT INTO `sys_logininfor` VALUES (206, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-06-08 11:09:07');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '0', '登录成功', '2024-06-09 10:28:05');
INSERT INTO `sys_logininfor` VALUES (208, 'ryadmin', '127.0.0.1', '0', '登录成功', '2024-06-10 11:22:19');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单key',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '/manage', 'layout.base', '', 1, 0, 'M', '0', '0', '', 'carbon:cloud-service-management', 'admin', '2024-05-08 21:50:55', 'admin', '2024-05-12 23:46:57', '系统管理目录', 'manage');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/manage/user', 'view.manage_user', '', 1, 0, 'C', '0', '0', 'system:user:list', 'ic:round-manage-accounts', 'admin', '2024-05-08 21:50:55', 'admin', '2024-05-12 23:50:31', '用户管理菜单', 'manage_user');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/manage/role', 'view.manage_role', '', 1, 0, 'C', '0', '0', 'system:role:list', 'carbon:user-role', 'admin', '2024-05-08 21:50:55', '', NULL, '角色管理菜单', 'manage_role');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/manage/menu', 'view.manage_menu', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'material-symbols:route', 'admin', '2024-05-08 21:50:55', 'admin', '2024-05-12 23:46:12', '菜单管理菜单', 'manage_menu');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/manage/dept', 'view.manage_dept', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'carbon:box', 'admin', '2024-05-08 21:50:55', 'ryadmin', '2024-05-30 23:17:41', '部门管理菜单', 'manage_dept');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/manage/post', 'view.manage_post', NULL, 1, 0, 'C', '0', '0', 'system:post:list', 'carbon:group', 'admin', '2024-06-02 22:18:48', '', NULL, '', 'manage_post');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/manage/dict', 'view.manage_dict', NULL, 1, 0, 'C', '0', '0', 'system:dict:list', 'carbon:volume-block-storage', 'admin', '2024-06-02 23:13:40', '', NULL, '', 'manage_dict');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-05-08 21:50:55', '', NULL, '', NULL);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-05-08 21:50:56', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-05-08 21:50:56', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(0) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '字典类型', 9, 'com.ruoyi.system.controller.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/dict/type/refreshCache', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-09 22:24:54', 38);
INSERT INTO `sys_oper_log` VALUES (101, '在线用户', 7, 'com.ruoyi.system.controller.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'admin', NULL, '/online/a2d615e9-8b0b-4726-afeb-f78f2f6b0ceb', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-10 20:37:14', 10);
INSERT INTO `sys_oper_log` VALUES (102, '用户管理', 5, 'com.ruoyi.system.controller.SysUserController.export()', 'POST', 1, 'admin', NULL, '/user/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-05-10 22:01:58', 1271);
INSERT INTO `sys_oper_log` VALUES (103, '登录日志', 5, 'com.ruoyi.system.controller.SysLogininforController.export()', 'POST', 1, 'admin', NULL, '/logininfor/export', '127.0.0.1', '', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-05-10 22:03:36', 74);
INSERT INTO `sys_oper_log` VALUES (104, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:42:02', 88);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"view.multi-menu_second_child_home\",\"createTime\":\"2024-05-08 21:50:55\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"/multi-menu/second/child/home\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:44:58', 30);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"view.manage_route\",\"createTime\":\"2024-05-08 21:50:55\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"/manage/route\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:46:12', 11);
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2024-05-08 21:50:55\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/manage\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:46:57', 22);
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"view.manage_user\",\"createTime\":\"2024-05-08 21:50:55\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1,\"path\":\"/manage/user\",\"perms\":\"system:user:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:50:31', 14);
INSERT INTO `sys_oper_log` VALUES (109, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/user/resetPwd', '127.0.0.1', '', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-12 23:50:57', 118);
INSERT INTO `sys_oper_log` VALUES (110, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 21:57:37', 63);
INSERT INTO `sys_oper_log` VALUES (111, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1012,1013,1014,1015,102,101,1007,1008,1009,1010,1011],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 21:58:02', 18);
INSERT INTO `sys_oper_log` VALUES (112, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1007,1008,1009,1010,1011,1012,1013,1014,1015,101,102,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,1],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 21:58:18', 30);
INSERT INTO `sys_oper_log` VALUES (113, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,100,101,102],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 21:58:52', 23);
INSERT INTO `sys_oper_log` VALUES (114, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,100,101],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 23:28:51', 55);
INSERT INTO `sys_oper_log` VALUES (115, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,101,102,103,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-16 23:41:07', 23);
INSERT INTO `sys_oper_log` VALUES (116, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[103,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 14:17:30', 66);
INSERT INTO `sys_oper_log` VALUES (117, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[103,1007,1008,1009,1010,1011,1012,1013,1014,1015,101,102,1],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 14:20:29', 34);
INSERT INTO `sys_oper_log` VALUES (118, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[103,1008,1009,1010,1011,1012,1013,1014,1015,102,1007,101,1],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 14:23:56', 36);
INSERT INTO `sys_oper_log` VALUES (119, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[103,1007,1008,1009,1010,1011,101,1],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 22:05:20', 35);
INSERT INTO `sys_oper_log` VALUES (120, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1007,1008,1009,1010,1011,101,1],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 22:05:35', 33);
INSERT INTO `sys_oper_log` VALUES (121, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1007,1008,1010,1011,1],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 22:05:45', 22);
INSERT INTO `sys_oper_log` VALUES (122, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1007,1008,1011,1],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 22:07:11', 26);
INSERT INTO `sys_oper_log` VALUES (123, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1007,1008,101,1],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 22:12:49', 26);
INSERT INTO `sys_oper_log` VALUES (124, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[100,102,1007,1008,101,1],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 22:35:40', 22);
INSERT INTO `sys_oper_log` VALUES (125, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1007,1008,1009,1010,101,1],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 22:55:30', 29);
INSERT INTO `sys_oper_log` VALUES (126, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1007,1008,1009,1010,101,1],\"params\":{},\"remark\":\"普通角色111\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"1\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 22:55:59', 25);
INSERT INTO `sys_oper_log` VALUES (127, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"ryadmin\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1,101,1007,1008,1009,1010],\"params\":{},\"remark\":\"测试角色\",\"roleId\":100,\"roleKey\":\"test-add\",\"roleName\":\"测试新增\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:09:26', 38);
INSERT INTO `sys_oper_log` VALUES (128, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-18 23:09:26\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1007,1009,1010,101,1],\"params\":{},\"remark\":\"测试角色\",\"roleId\":100,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\"}', '{\"msg\":\"修改角色\'普通刺客\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2024-05-18 23:09:35', 6);
INSERT INTO `sys_oper_log` VALUES (129, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-18 23:09:26\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1007,1009,1010,101,1],\"params\":{},\"remark\":\"测试角色\",\"roleId\":100,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\"}', '{\"msg\":\"修改角色\'普通刺客\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2024-05-18 23:09:46', 4);
INSERT INTO `sys_oper_log` VALUES (130, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1007,1008,1009,1010,101,1],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:10:23', 27);
INSERT INTO `sys_oper_log` VALUES (131, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-18 23:09:26\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1007,1009,1010,101,1],\"params\":{},\"remark\":\"测试角色\",\"roleId\":100,\"roleKey\":\"test-add\",\"roleName\":\"测试新增\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:17:07', 29);
INSERT INTO `sys_oper_log` VALUES (132, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-18 23:09:26\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1007,1009,101,1],\"params\":{},\"remark\":\"测试角色\",\"roleId\":100,\"roleKey\":\"test-add\",\"roleName\":\"测试新增\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:17:59', 19);
INSERT INTO `sys_oper_log` VALUES (133, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-18 23:09:26\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1007,1009,101,1],\"params\":{},\"remark\":\"测试角色\",\"roleId\":100,\"roleKey\":\"test-add\",\"roleName\":\"测试新增\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:18:35', 28);
INSERT INTO `sys_oper_log` VALUES (134, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"ryadmin\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1,101,1007,1008,1009,1010],\"params\":{},\"remark\":\"\",\"roleId\":101,\"roleKey\":\"test2\",\"roleName\":\"测试2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:30:42', 10);
INSERT INTO `sys_oper_log` VALUES (135, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-18 23:30:42\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1007,1009,101,1],\"params\":{},\"roleId\":101,\"roleKey\":\"test2\",\"roleName\":\"测试2\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:31:37', 30);
INSERT INTO `sys_oper_log` VALUES (136, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"ryadmin\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1,101,1007,1008,1009,1010],\"params\":{},\"remark\":\"1111\",\"roleId\":102,\"roleKey\":\"111\",\"roleName\":\"111\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:45:02', 27);
INSERT INTO `sys_oper_log` VALUES (137, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"ryadmin\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1007,1009,101,1],\"params\":{},\"remark\":\"121212\",\"roleId\":103,\"roleKey\":\"121212\",\"roleName\":\"211212\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:52:09', 21);
INSERT INTO `sys_oper_log` VALUES (138, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"ryadmin\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1007,1009,101,1],\"params\":{},\"remark\":\"asd\",\"roleId\":104,\"roleKey\":\"asdasd\",\"roleName\":\"adasd\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:53:04', 25);
INSERT INTO `sys_oper_log` VALUES (139, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'ryadmin', NULL, '/role/103', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:56:19', 43);
INSERT INTO `sys_oper_log` VALUES (140, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'ryadmin', NULL, '/role/102', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:57:05', 15);
INSERT INTO `sys_oper_log` VALUES (141, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'ryadmin', NULL, '/role/101', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:57:12', 27);
INSERT INTO `sys_oper_log` VALUES (142, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'ryadmin', NULL, '/role/104', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:57:19', 21);
INSERT INTO `sys_oper_log` VALUES (143, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-18 23:09:26\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1007,1009,1008,1010,101,1],\"params\":{},\"remark\":\"测试角色\",\"roleId\":100,\"roleKey\":\"test-add\",\"roleName\":\"测试新增\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-18 23:58:00', 33);
INSERT INTO `sys_oper_log` VALUES (144, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'ryadmin', NULL, '/role/100', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-19 00:51:02', 23);
INSERT INTO `sys_oper_log` VALUES (145, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"ryadmin\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,101,102,103,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010],\"params\":{},\"remark\":\"测试角色\",\"roleId\":105,\"roleKey\":\"test-add\",\"roleName\":\"普通刺客111\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-28 21:33:02', 61);
INSERT INTO `sys_oper_log` VALUES (146, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'ryadmin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-28 21:33:02\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[102,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,100,101,1],\"params\":{},\"remark\":\"测试角色\",\"roleId\":105,\"roleKey\":\"test-add\",\"roleName\":\"普通刺客111\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-28 21:33:12', 21);
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'ryadmin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"layout.base$view.about\",\"icon\":\"carbon:account\",\"isFrame\":\"false\",\"menuName\":\"关于界面\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"/about\",\"perms\":\"\",\"status\":\"0\"}', NULL, 1, 'system:menu:add', '2024-05-28 22:35:03', 8);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'ryadmin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"layout.base$view.about\",\"icon\":\"carbon:3d-cursor\",\"isFrame\":\"false\",\"menuName\":\"关于\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"/about\",\"perms\":\"\",\"status\":\"0\"}', NULL, 1, 'system:menu:add', '2024-05-28 23:13:33', 0);
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'ryadmin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"layout.base$view.about\",\"createBy\":\"ryadmin\",\"icon\":\"carbon:ibm-telehealth\",\"isFrame\":\"false\",\"menuName\":\"关于\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"/about\",\"perms\":\"\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'false\' for column \'is_frame\' at row 1\r\n### The error may exist in file [D:\\project\\gitee\\RuoYi-Cloud\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\SysMenuMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMenuMapper.insertMenu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_menu(            menu_name,     order_num,     path,     component,         is_frame,         menu_type,         status,         icon,         create_by,    create_time   )values(            ?,     ?,     ?,     ?,         ?,         ?,         ?,         ?,         ?,    sysdate()   )\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'false\' for column \'is_frame\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'false\' for column \'is_frame\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'false\' for column \'is_frame\' at row 1', '2024-05-28 23:14:20', 102);
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'ryadmin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"layout.base$view.about\",\"createBy\":\"ryadmin\",\"icon\":\"carbon:user-avatar\",\"isFrame\":\"false\",\"menuName\":\"关于\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"/about\",\"perms\":\"\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'false\' for column \'is_frame\' at row 1\r\n### The error may exist in file [D:\\project\\gitee\\RuoYi-Cloud\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\SysMenuMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMenuMapper.insertMenu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_menu(            menu_name,     order_num,     path,     component,         is_frame,         menu_type,         status,         icon,         create_by,    create_time   )values(            ?,     ?,     ?,     ?,         ?,         ?,         ?,         ?,         ?,    sysdate()   )\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'false\' for column \'is_frame\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'false\' for column \'is_frame\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'false\' for column \'is_frame\' at row 1', '2024-05-28 23:18:21', 12);
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'ryadmin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"layout.base$view.about\",\"createBy\":\"ryadmin\",\"icon\":\"carbon:3d-cursor\",\"isFrame\":\"1\",\"menuName\":\"guanyu\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/about\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-28 23:20:38', 23);
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'ryadmin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"view.manage_dept\",\"createTime\":\"2024-05-08 21:50:55\",\"icon\":\"carbon:box\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理修改\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"/manage/dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"ryadmin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-29 22:54:06', 35);
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'ryadmin', NULL, '/menu/103', '127.0.0.1', '', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-05-29 22:55:28', 3);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'ryadmin', NULL, '/menu/103', '127.0.0.1', '', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-05-29 22:55:43', 2);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'ryadmin', NULL, '/menu/100', '127.0.0.1', '', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-05-29 23:00:26', 1);
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'ryadmin', NULL, '/menu/1', '127.0.0.1', '', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2024-05-29 23:01:07', 3);
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'ryadmin', NULL, '/menu/1008', '127.0.0.1', '', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-05-29 23:20:37', 5);
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'ryadmin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"\",\"createBy\":\"ryadmin\",\"icon\":\"carbon:earth-americas-filled\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"函数菜单\",\"menuType\":\"C\",\"name\":\"\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"/function\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-29 23:27:23', 13);
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'ryadmin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"\",\"createBy\":\"ryadmin\",\"icon\":\"carbon:carbon\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"函数\",\"menuType\":\"M\",\"name\":\"\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/function\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-29 23:29:59', 22);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'ryadmin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"\",\"createBy\":\"ryadmin\",\"icon\":\"carbon:carbon-for-ibm-product\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"关于弟弟\",\"menuType\":\"M\",\"name\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"/about\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-29 23:30:34', 13);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'ryadmin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"layout.base$view.about\",\"createBy\":\"ryadmin\",\"icon\":\"carbon:ai-results-low\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"guanyu1\",\"menuType\":\"M\",\"name\":\"about\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"/about\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-29 23:32:10', 21);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'ryadmin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"view.manage_dept\",\"createTime\":\"2024-05-08 21:50:55\",\"icon\":\"carbon:box\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"/manage/dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"ryadmin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 23:13:51', 36);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'ryadmin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"view.manage_dept\",\"createTime\":\"2024-05-08 21:50:55\",\"icon\":\"carbon:box\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理1\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"/manage/dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"ryadmin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 23:17:35', 19);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'ryadmin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"view.manage_dept\",\"createTime\":\"2024-05-08 21:50:55\",\"icon\":\"carbon:box\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"/manage/dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"ryadmin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-05-30 23:17:41', 23);
INSERT INTO `sys_oper_log` VALUES (165, '部门管理', 1, 'com.ruoyi.system.controller.SysDeptController.add()', 'POST', 1, 'ryadmin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"ryadmin\",\"deptName\":\"嵌入式部门\",\"email\":\"19939926438@163.com\",\"leader\":\"小美\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"19939926438\",\"remark\":\"若依科技-嵌入式部门\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-02 16:16:38', 40);
INSERT INTO `sys_oper_log` VALUES (166, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"ryadmin\",\"createTime\":\"2024-06-02 16:16:37\",\"delFlag\":\"0\",\"deptId\":200,\"deptName\":\"嵌入式部门\",\"email\":\"19939926438@163.com\",\"leader\":\"小美\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"19939926438\",\"remark\":\"修改\",\"status\":\"0\",\"updateBy\":\"admin\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\r\n### The error may exist in file [D:\\project\\gitee\\RuoYi-Cloud\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.updateDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_dept     SET parent_id = ?,     dept_name = ?,     ancestors = ?,     order_num = ?,     leader = ?,     phone = ?,     email = ?,     status = ?,     update_by = ?,    remark = ?,     update_time = sysdate()     where dept_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'', '2024-06-02 16:36:34', 123);
INSERT INTO `sys_oper_log` VALUES (167, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"ryadmin\",\"createTime\":\"2024-06-02 16:16:37\",\"delFlag\":\"0\",\"deptId\":200,\"deptName\":\"嵌入式部门\",\"email\":\"19939926438@163.com\",\"leader\":\"小美\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"19939926438\",\"remark\":\"111\",\"status\":\"0\",\"updateBy\":\"admin\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\r\n### The error may exist in file [D:\\project\\gitee\\RuoYi-Cloud\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.updateDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_dept     SET parent_id = ?,     dept_name = ?,     ancestors = ?,     order_num = ?,     leader = ?,     phone = ?,     email = ?,     status = ?,     update_by = ?,    remark = ?,     update_time = sysdate()     where dept_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'', '2024-06-02 16:37:30', 14);
INSERT INTO `sys_oper_log` VALUES (168, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"ryadmin\",\"createTime\":\"2024-06-02 16:16:37\",\"delFlag\":\"0\",\"deptId\":200,\"deptName\":\"嵌入式部门\",\"email\":\"19939926438@163.com\",\"leader\":\"小美\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"19939926438\",\"remark\":\"111\",\"status\":\"0\",\"updateBy\":\"admin\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\r\n### The error may exist in file [D:\\project\\gitee\\RuoYi-Cloud\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.updateDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_dept     SET parent_id = ?,     dept_name = ?,     ancestors = ?,     order_num = ?,     leader = ?,     phone = ?,     email = ?,     status = ?,     update_by = ?,    remark = ?,     update_time = sysdate()     where dept_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'', '2024-06-02 16:40:45', 109);
INSERT INTO `sys_oper_log` VALUES (169, '部门管理', 1, 'com.ruoyi.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"前端部门\",\"email\":\"\",\"leader\":\"小帅\",\"orderNum\":0,\"params\":{},\"parentId\":100,\"phone\":\"19939926438\",\"remark\":\"测试\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\r\n### The error may exist in file [D:\\project\\gitee\\RuoYi-Cloud\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dept(            parent_id,       dept_name,       ancestors,       order_num,       leader,       phone,             status,       create_by,       remark,      create_time    )values(            ?,       ?,       ?,       ?,       ?,       ?,             ?,       ?,          ?,      sysdate()    )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'remark\' in \'field list\'', '2024-06-02 16:46:11', 28);
INSERT INTO `sys_oper_log` VALUES (170, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"ryadmin\",\"createTime\":\"2024-06-02 16:16:37\",\"delFlag\":\"0\",\"deptId\":200,\"deptName\":\"嵌入式部门\",\"email\":\"19939926438@163.com\",\"leader\":\"小美\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"19939926438\",\"remark\":\"ttt\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-02 16:50:26', 37);
INSERT INTO `sys_oper_log` VALUES (171, '部门管理', 1, 'com.ruoyi.system.controller.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"后端部门\",\"email\":\"\",\"leader\":\"小黑\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"phone\":\"19939926438\",\"remark\":\"测试111\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-02 16:52:12', 25);
INSERT INTO `sys_oper_log` VALUES (172, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/201', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-02 17:04:53', 38);
INSERT INTO `sys_oper_log` VALUES (173, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"ryadmin\",\"createTime\":\"2024-06-02 16:16:37\",\"delFlag\":\"0\",\"deptId\":200,\"deptName\":\"嵌入式部门\",\"email\":\"19939926438@163.com\",\"leader\":\"小美\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"19939926438\",\"remark\":\"ttt\",\"status\":\"1\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-02 17:24:11', 29);
INSERT INTO `sys_oper_log` VALUES (174, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":0,\"email\":\"19939926438@163.com\",\"nickName\":\"啊啊啊啊a\",\"params\":{},\"phonenumber\":\"19939926438\",\"remark\":\"111\",\"status\":\"0\",\"userName\":\"aaa\"}', NULL, 1, 'rawPassword cannot be null', '2024-06-02 18:26:33', 15);
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"view.manage_post\",\"createBy\":\"admin\",\"icon\":\"carbon:group\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"岗位管理\",\"menuType\":\"M\",\"name\":\"manage_post\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"/manage/post\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-02 22:17:49', 36);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2006', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-02 22:18:00', 26);
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"view.manage_post\",\"createBy\":\"admin\",\"icon\":\"carbon:group\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"name\":\"manage_post\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"/manage/post\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-02 22:18:48', 22);
INSERT INTO `sys_oper_log` VALUES (178, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1012,1013,1014,1015,1016,1017,1018,1019,100,102,103,2007,101,1],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-02 22:19:17', 89);
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"layout.base$view.user-center\",\"createBy\":\"admin\",\"icon\":\"carbon:user-avatar\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户中心\",\"menuType\":\"C\",\"name\":\"user-center\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"/user-center\",\"perms\":\"\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [D:\\project\\gitee\\RuoYi-Cloud\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\SysMenuMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMenuMapper.insertMenu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_menu(            menu_name,     order_num,     path,     component,         is_frame,     is_cache,     menu_type,         status,         icon,         create_by,     name,    create_time   )values(            ?,     ?,     ?,     ?,         ?,     ?,     ?,         ?,         ?,         ?,    sysdate()   )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2024-06-02 22:31:07', 107);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"layout.base$view.user-center\",\"createBy\":\"admin\",\"icon\":\"carbon:user-avatar\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuName\":\"个人中心\",\"menuType\":\"C\",\"name\":\"user-center\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"/user-center\",\"perms\":\"\",\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [D:\\project\\gitee\\RuoYi-Cloud\\ruoyi-modules\\ruoyi-system\\target\\classes\\mapper\\system\\SysMenuMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMenuMapper.insertMenu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_menu(            menu_name,     order_num,     path,     component,         is_frame,     is_cache,     menu_type,         status,         icon,         create_by,     name,    create_time   )values(            ?,     ?,     ?,     ?,         ?,     ?,     ?,         ?,         ?,         ?,    sysdate()   )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1', '2024-06-02 22:44:34', 113);
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"layout.base$view.user-center\",\"createBy\":\"admin\",\"icon\":\"carbon:user-avatar\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"个人中心\",\"menuType\":\"C\",\"name\":\"user-center\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"/user-center\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-02 22:55:08', 41);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"view.manage_dict\",\"createBy\":\"admin\",\"icon\":\"carbon:volume-block-storage\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"字典管理\",\"menuType\":\"C\",\"name\":\"manage_dict\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"/manage/dict\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-02 23:13:40', 13);
INSERT INTO `sys_oper_log` VALUES (183, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2024-05-08 21:50:54\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1012,1013,1014,1015,1016,1017,1018,1019,100,102,103,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,101,1],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通刺客\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-02 23:14:56', 45);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"layout.base$view.userinfo\",\"createTime\":\"2024-06-02 22:55:08\",\"icon\":\"carbon:user-avatar\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"个人中心\",\"menuType\":\"C\",\"name\":\"userinfo\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"/userinfo\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-02 23:17:59', 22);
INSERT INTO `sys_oper_log` VALUES (185, '岗位管理', 1, 'com.ruoyi.system.controller.SysPostController.add()', 'POST', 1, 'ryadmin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"ryadmin\",\"flag\":false,\"params\":{},\"postCode\":\"test\",\"postId\":5,\"postName\":\"测试\",\"postSort\":5,\"remark\":\"测试岗位\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-04 22:23:31', 41);
INSERT INTO `sys_oper_log` VALUES (186, '岗位管理', 2, 'com.ruoyi.system.controller.SysPostController.edit()', 'PUT', 1, 'ryadmin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"ryadmin\",\"createTime\":\"2024-06-04 22:23:31\",\"flag\":false,\"params\":{},\"postCode\":\"test\",\"postId\":5,\"postName\":\"测试\",\"postSort\":5,\"remark\":\"测试岗位修改\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-04 22:24:58', 25);
INSERT INTO `sys_oper_log` VALUES (187, '岗位管理', 1, 'com.ruoyi.system.controller.SysPostController.add()', 'POST', 1, 'ryadmin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"ryadmin\",\"flag\":false,\"params\":{},\"postCode\":\"ce11\",\"postId\":6,\"postName\":\"测试2\",\"postSort\":7,\"remark\":\"懂得都懂\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-04 22:36:20', 24);
INSERT INTO `sys_oper_log` VALUES (188, '岗位管理', 3, 'com.ruoyi.system.controller.SysPostController.remove()', 'DELETE', 1, 'ryadmin', NULL, '/post/5,6', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-04 22:36:25', 31);
INSERT INTO `sys_oper_log` VALUES (189, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":200,\"email\":\"19939926438@163.com\",\"nickName\":\"测试用户\",\"params\":{},\"phonenumber\":\"19939926438\",\"postIds\":[2,3],\"remark\":\"安啦\",\"roleIds\":[105],\"status\":\"0\",\"userId\":100,\"userName\":\"testAdd\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-09 12:43:21', 161);
INSERT INTO `sys_oper_log` VALUES (190, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-06-09 12:43:21\",\"delFlag\":\"0\",\"dept\":{\"children\":[],\"deptId\":200,\"deptName\":\"嵌入式部门\",\"leader\":\"小美\",\"params\":{}},\"deptId\":200,\"email\":\"19939926438@163.com\",\"loginIp\":\"\",\"nickName\":\"测试用户\",\"params\":{},\"phonenumber\":\"19939926438\",\"postIds\":[2,3],\"remark\":\"安啦\",\"roleIds\":[105,2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"testAdd\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-09 12:43:41', 27);
INSERT INTO `sys_oper_log` VALUES (191, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/100', '127.0.0.1', '', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2024-06-09 13:49:05', 3);
INSERT INTO `sys_oper_log` VALUES (192, '用户管理', 3, 'com.ruoyi.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/user/2,100', '127.0.0.1', '', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-09 13:50:52', 22);
INSERT INTO `sys_oper_log` VALUES (193, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":104,\"email\":\"19939926438@163.com\",\"nickName\":\"测试用户\",\"params\":{},\"phonenumber\":\"19939926438\",\"postIds\":[3,2],\"remark\":\"2121\",\"roleIds\":[2,105],\"status\":\"0\",\"userId\":101,\"userName\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-09 14:01:36', 118);
INSERT INTO `sys_oper_log` VALUES (194, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/role/105', '127.0.0.1', '', '{}', NULL, 1, '普通刺客111已分配,不能删除', '2024-06-09 14:02:31', 17);
INSERT INTO `sys_oper_log` VALUES (195, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"测试字典\",\"dictType\":\"sys_test_type\",\"params\":{},\"remark\":\"dsadasd\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-09 22:46:22', 29);
INSERT INTO `sys_oper_log` VALUES (196, '岗位管理', 2, 'com.ruoyi.system.controller.SysPostController.edit()', 'PUT', 1, 'ryadmin', NULL, '/post', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2024-05-08 21:50:54\",\"flag\":false,\"params\":{},\"postCode\":\"user\",\"postId\":4,\"postName\":\"普通员工\",\"postSort\":4,\"remark\":\"反反复复\",\"status\":\"0\",\"updateBy\":\"ryadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-06-10 11:45:34', 34);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-05-08 21:50:54', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-05-08 21:50:54', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-05-08 21:50:54', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-05-08 21:50:54', 'ryadmin', '2024-06-10 11:45:33', '反反复复');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', '1', 1, 1, '0', '0', 'admin', '2024-05-08 21:50:54', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通刺客', 'common', '2', 1, 1, '0', '0', 'admin', '2024-05-08 21:50:54', 'admin', '2024-06-02 23:14:56', '普通角色');
INSERT INTO `sys_role` VALUES (100, '测试新增', 'test-add', '1', 1, 0, '0', '2', 'ryadmin', '2024-05-18 23:09:26', 'ryadmin', '2024-05-18 23:58:00', '测试角色');
INSERT INTO `sys_role` VALUES (101, '测试2', 'test2', '1', 1, 0, '0', '2', 'ryadmin', '2024-05-18 23:30:42', 'ryadmin', '2024-05-18 23:31:37', NULL);
INSERT INTO `sys_role` VALUES (102, '111', '111', '1', 0, 0, '0', '2', 'ryadmin', '2024-05-18 23:45:02', '', NULL, '1111');
INSERT INTO `sys_role` VALUES (103, '211212', '121212', '1', 0, 0, '0', '2', 'ryadmin', '2024-05-18 23:52:09', '', NULL, '121212');
INSERT INTO `sys_role` VALUES (104, 'adasd', 'asdasd', '1', 1, 0, '0', '2', 'ryadmin', '2024-05-18 23:53:04', '', NULL, 'asd');
INSERT INTO `sys_role` VALUES (105, '普通刺客111', 'test-add', '1', 1, 0, '0', '0', 'ryadmin', '2024-05-28 21:33:02', 'ryadmin', '2024-05-28 21:33:12', '测试角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (105, 1);
INSERT INTO `sys_role_menu` VALUES (105, 100);
INSERT INTO `sys_role_menu` VALUES (105, 101);
INSERT INTO `sys_role_menu` VALUES (105, 102);
INSERT INTO `sys_role_menu` VALUES (105, 1000);
INSERT INTO `sys_role_menu` VALUES (105, 1001);
INSERT INTO `sys_role_menu` VALUES (105, 1002);
INSERT INTO `sys_role_menu` VALUES (105, 1003);
INSERT INTO `sys_role_menu` VALUES (105, 1004);
INSERT INTO `sys_role_menu` VALUES (105, 1005);
INSERT INTO `sys_role_menu` VALUES (105, 1006);
INSERT INTO `sys_role_menu` VALUES (105, 1007);
INSERT INTO `sys_role_menu` VALUES (105, 1008);
INSERT INTO `sys_role_menu` VALUES (105, 1009);
INSERT INTO `sys_role_menu` VALUES (105, 1010);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-05-08 21:50:54', 'admin', '2024-05-08 21:50:54', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ryadmin', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$1o.S9fySem5/jcIfpUosNOb.WiDgWu2sAZQRR3JVyL/Yj.FWveMt2', '0', '2', '127.0.0.1', '2024-05-08 21:50:54', 'admin', '2024-05-08 21:50:54', 'admin', '2024-05-12 23:50:57', '测试员');
INSERT INTO `sys_user` VALUES (100, 200, 'testAdd', '测试用户', '00', '19939926438@163.com', '19939926438', '0', '', '$2a$10$SAM2u1PDZ.jOAK8kUTD7Ie0aVJhW6JBLqtRNrA08qjtHV89BDVlDi', '0', '2', '', NULL, 'admin', '2024-06-09 12:43:21', 'admin', '2024-06-09 12:43:41', '安啦');
INSERT INTO `sys_user` VALUES (101, 104, 'ryadmin', '测试用户', '00', '19939926438@163.com', '19939926438', '0', '', '$2a$10$o6cLpxFmvBXel17/cpA/XeBM.giyKba3EwuHHP14p9TeGxC1WaVNq', '0', '0', '', NULL, 'admin', '2024-06-09 14:01:36', '', NULL, '2121');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (101, 2);
INSERT INTO `sys_user_post` VALUES (101, 3);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (101, 105);

SET FOREIGN_KEY_CHECKS = 1;
