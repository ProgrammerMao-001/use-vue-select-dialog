/*
 Navicat Premium Data Transfer

 Source Server         : hello
 Source Server Type    : MySQL
 Source Server Version : 100411
 Source Host           : 127.0.0.1:3306
 Source Schema         : vue-select-dialog

 Target Server Type    : MySQL
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 07/02/2025 13:25:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader_id` bigint NULL DEFAULT NULL COMMENT '负责人主键',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `is_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否区域节点（0否 1是）',
  `is_branch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否分支节点（0否 1是）',
  `is_lowest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否下级部门节点（0否 1是）',
  `area_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名称',
  `node_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '节点类型(1区域 2部门 3部门分支)',
  `deleted` int NULL DEFAULT 0 COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, 0, '0', '总公司', 1, 1001, '0', '0', '0', '0', NULL, '2', 0, 'admin', '2025-02-06 17:59:25', 'admin', '2025-02-06 17:59:25');
INSERT INTO `dept` VALUES (2, 1, '0,1', '研发部', 1, 1002, '0', '0', '0', '1', NULL, '2', 0, 'admin', '2025-02-06 17:59:25', 'admin', '2025-02-06 17:59:25');
INSERT INTO `dept` VALUES (3, 1, '0,1', '市场部', 2, 1003, '1', '0', '0', '1', NULL, '2', 0, 'admin', '2025-02-06 17:59:25', 'admin', '2025-02-06 17:59:25');
INSERT INTO `dept` VALUES (4, 2, '0,1,2', '前端组', 1, 1004, '0', '0', '1', '1', NULL, '3', 0, 'admin', '2025-02-06 17:59:25', 'admin', '2025-02-06 17:59:25');
INSERT INTO `dept` VALUES (5, 2, '0,1,2', '后端组', 2, 1005, '0', '0', '1', '1', NULL, '3', 0, 'admin', '2025-02-06 17:59:25', 'admin', '2025-02-06 17:59:25');
INSERT INTO `dept` VALUES (6, 3, '0,1,3', '销售组', 1, 1006, '1', '0', '1', '1', NULL, '3', 0, 'admin', '2025-02-06 17:59:25', 'admin', '2025-02-06 17:59:25');
INSERT INTO `dept` VALUES (7, 3, '0,1,3', '市场推广组', 2, 1007, '0', '0', '1', '1', NULL, '3', 0, 'admin', '2025-02-06 17:59:25', 'admin', '2025-02-06 17:59:25');
INSERT INTO `dept` VALUES (8, 0, '0', '分公司', 2, 1008, '0', '1', '0', '0', '北京', '1', 0, 'admin', '2025-02-06 17:59:25', 'admin', '2025-02-06 17:59:25');
INSERT INTO `dept` VALUES (9, 8, '0,8', '分公司研发部', 1, 1009, '0', '0', '0', '1', NULL, '2', 0, 'admin', '2025-02-06 17:59:25', 'admin', '2025-02-06 17:59:25');
INSERT INTO `dept` VALUES (10, 8, '0,8', '分公司市场部', 2, 1010, '1', '0', '0', '1', NULL, '2', 0, 'admin', '2025-02-06 17:59:25', 'admin', '2025-02-06 17:59:25');
INSERT INTO `dept` VALUES (100, 0, '0', '邢台市', 0, 1, '0', NULL, NULL, NULL, NULL, '2', 0, 'admin', '2021-03-19 21:11:48', 'system', '2024-09-10 16:16:34');
INSERT INTO `dept` VALUES (101, 100, '0,100', '测试部门', 1, 2, '1', NULL, NULL, NULL, NULL, '2', 0, 'system', '2024-07-03 18:25:58', '', NULL);
INSERT INTO `dept` VALUES (102, 100, '0,100', 'asdad', 2, 3, '0', NULL, NULL, NULL, NULL, '2', 1, 'system', '2024-07-03 18:38:23', '', NULL);
INSERT INTO `dept` VALUES (103, 101, '0,100,101', '测试子部门', 1, 3, '0', NULL, NULL, NULL, NULL, '2', 0, 'system', '2024-07-05 18:27:07', '', NULL);
INSERT INTO `dept` VALUES (104, 101, '0,100,101', '112112', 2, 3, '1', NULL, NULL, NULL, NULL, '2', 1, 'system', '2024-07-05 18:29:49', '', NULL);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `sys_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '系统编号',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `report_id` bigint NULL DEFAULT NULL COMMENT 'data_report主键',
  `button_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '按钮类型（add 添加 edit 修改 remove 删除 import 导出 export 导出）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2989 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 'system', '系统管理', 0, 11, 'system', NULL, NULL, '1', '0', 'M', '0', '0', '', 'system', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system', '2024-09-11 09:59:21', '系统管理目录');
INSERT INTO `menu` VALUES (2, 'system', '系统监控', 0, 15, 'monitor', NULL, NULL, '1', '0', 'M', '0', '0', '', 'monitor', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system', '2024-09-09 19:13:45', '系统监控目录');
INSERT INTO `menu` VALUES (100, 'system', '用户管理', 1, 1, 'user', 'system/user/index', NULL, '1', '0', 'C', '0', '0', 'system:user:list', 'user', NULL, '', 'admin', '2021-03-19 21:11:48', 'system[超级管理员]', '2022-08-11 11:43:42', '用户管理菜单');
INSERT INTO `menu` VALUES (101, 'system', '角色管理', 1, 2, 'role', 'system/role/index', NULL, '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '角色管理菜单');
INSERT INTO `menu` VALUES (102, 'system', '菜单管理', 2221, 4, 'menu', 'system/menu/index', NULL, '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system/超级管理员', '2023-12-27 17:07:38', '菜单管理菜单');
INSERT INTO `menu` VALUES (103, 'system', '部门管理', 1, 4, 'dept', 'system/dept/index', NULL, '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'lszh_admin/lszh_admin/丽水管理员', '2023-02-10 12:40:12', '部门管理菜单');
INSERT INTO `menu` VALUES (104, 'system', '岗位管理', 1, 3, 'post', 'system/post/index', NULL, '1', '0', 'C', '0', '0', 'system:post:list', 'post', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'lszh_admin/lszh_admin/丽水管理员', '2023-02-10 12:39:57', '岗位管理菜单');
INSERT INTO `menu` VALUES (105, 'system', '字典管理', 2221, 1, 'dict', 'system/dict/index', NULL, '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system/超级管理员', '2023-12-27 17:07:05', '字典管理菜单');
INSERT INTO `menu` VALUES (106, 'system', '参数设置', 2221, 2, 'config', 'system/config/index', NULL, '1', '0', 'C', '0', '0', 'system:config:list', 'edit', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system/超级管理员', '2023-12-27 17:07:21', '参数设置菜单');
INSERT INTO `menu` VALUES (107, 'system', '通知公告', 1, 6, 'notice', 'system/notice/index', NULL, '1', '0', 'C', '0', '0', 'message:notice:list', 'message', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'lszh_admin/lszh_admin/丽水管理员', '2023-02-10 12:31:44', '通知公告菜单');
INSERT INTO `menu` VALUES (108, 'system', '日志管理', 1, 12, 'log', '', NULL, '1', '0', 'M', '0', '0', '', 'log', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system[超级管理员]', '2023-06-28 16:05:17', '日志管理菜单');
INSERT INTO `menu` VALUES (109, 'system', '在线用户', 2, 1, 'online', 'monitor/online/index', NULL, '1', '0', 'C', '0', '0', 'security:online:list', 'online', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system/超级管理员', '2023-12-27 14:15:05', '在线用户菜单');
INSERT INTO `menu` VALUES (500, 'system', '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', NULL, '1', '0', 'C', '0', '0', 'system:operLogs:list', 'form', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system/超级管理员', '2023-12-27 13:19:55', '操作日志菜单');
INSERT INTO `menu` VALUES (501, 'system', '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', NULL, '1', '0', 'C', '0', '0', 'system:loginLogs:list', 'logininfor', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system/超级管理员', '2023-12-27 13:18:42', '登录日志菜单');
INSERT INTO `menu` VALUES (1001, 'system', '用户查询', 100, 1, '', '', NULL, '1', '0', 'F', '0', '0', 'system:user:query', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system[超级管理员]', '2022-08-11 14:12:24', '');
INSERT INTO `menu` VALUES (1002, 'system', '用户新增', 100, 2, '', '', NULL, '1', '0', 'F', '0', '0', 'system:user:add', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1003, 'system', '用户修改', 100, 3, '', '', NULL, '1', '0', 'F', '0', '0', 'system:user:edit', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system[超级管理员]', '2022-08-11 14:12:31', '');
INSERT INTO `menu` VALUES (1004, 'system', '用户删除', 100, 4, '', '', NULL, '1', '0', 'F', '0', '0', 'system:user:remove', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1005, 'system', '用户导出', 100, 5, '', '', NULL, '1', '0', 'F', '0', '0', 'system:user:export', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system[超级管理员]', '2022-08-11 14:12:37', '');
INSERT INTO `menu` VALUES (1006, 'system', '用户导入', 100, 6, '', '', NULL, '1', '0', 'F', '0', '0', 'system:user:import', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system[超级管理员]', '2022-08-11 14:09:36', '');
INSERT INTO `menu` VALUES (1007, 'system', '重置密码', 100, 7, '', '', NULL, '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1008, 'system', '角色详情', 101, 1, '', '', NULL, '1', '0', 'F', '0', '0', 'system:role:query', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1009, 'system', '角色新增', 101, 2, '', '', NULL, '1', '0', 'F', '0', '0', 'system:role:add', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1010, 'system', '角色修改', 101, 3, '', '', NULL, '1', '0', 'F', '0', '0', 'system:role:edit', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1011, 'system', '角色删除', 101, 4, '', '', NULL, '1', '0', 'F', '0', '0', 'system:role:remove', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1012, 'system', '角色导出', 101, 5, '', '', NULL, '1', '0', 'F', '0', '0', 'system:role:export', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1013, 'system', '菜单查询', 102, 1, '', '', NULL, '1', '0', 'F', '0', '0', 'system:menu:query', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1014, 'system', '菜单新增', 102, 2, '', '', NULL, '1', '0', 'F', '0', '0', 'system:menu:add', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1015, 'system', '菜单修改', 102, 3, '', '', NULL, '1', '0', 'F', '0', '0', 'system:menu:edit', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1016, 'system', '菜单删除', 102, 4, '', '', NULL, '1', '0', 'F', '0', '0', 'system:menu:remove', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1017, 'system', '部门详情', 103, 1, '', '', NULL, '1', '0', 'F', '0', '0', 'system:dept:query', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1018, 'system', '部门新增', 103, 2, '', '', NULL, '1', '0', 'F', '0', '0', 'system:dept:add', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1019, 'system', '部门修改', 103, 3, '', '', NULL, '1', '0', 'F', '0', '0', 'system:dept:edit', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1020, 'system', '部门删除', 103, 4, '', '', NULL, '1', '0', 'F', '0', '0', 'system:dept:remove', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1021, 'system', '岗位详情', 104, 1, '', '', NULL, '1', '0', 'F', '0', '0', 'system:post:query', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1022, 'system', '岗位新增', 104, 2, '', '', NULL, '1', '0', 'F', '0', '0', 'system:post:add', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1023, 'system', '岗位修改', 104, 3, '', '', NULL, '1', '0', 'F', '0', '0', 'system:post:edit', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1024, 'system', '岗位删除', 104, 4, '', '', NULL, '1', '0', 'F', '0', '0', 'system:post:remove', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1025, 'system', '岗位导出', 104, 5, '', '', NULL, '1', '0', 'F', '0', '0', 'system:post:export', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1026, 'system', '字典详情', 105, 1, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:dict:query', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1027, 'system', '字典新增', 105, 2, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:dict:add', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1028, 'system', '字典修改', 105, 3, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:dict:edit', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1029, 'system', '字典删除', 105, 4, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:dict:remove', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1030, 'system', '字典导出', 105, 5, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:dict:export', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1031, 'system', '参数详情', 106, 1, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:config:query', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1032, 'system', '参数新增', 106, 2, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:config:add', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1033, 'system', '参数修改', 106, 3, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:config:edit', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1034, 'system', '参数删除', 106, 4, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:config:remove', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1035, 'system', '参数导出', 106, 5, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:config:export', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', '', NULL, '');
INSERT INTO `menu` VALUES (1037, 'system', '公告新增', 107, 2, '#', '', NULL, '1', '0', 'F', '0', '0', 'message:notice:add', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system[超级管理员]', '2022-10-26 15:58:46', '');
INSERT INTO `menu` VALUES (1038, 'system', '公告修改', 107, 3, '#', '', NULL, '1', '0', 'F', '0', '0', 'message:notice:edit', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system[超级管理员]', '2022-10-26 15:58:50', '');
INSERT INTO `menu` VALUES (1039, 'system', '公告删除', 107, 4, '#', '', NULL, '1', '0', 'F', '0', '0', 'message:notice:remove', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system[超级管理员]', '2022-10-26 15:58:54', '');
INSERT INTO `menu` VALUES (1040, 'system', '操作查询', 500, 1, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:operLogs:query', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system/超级管理员', '2023-12-27 13:17:41', '');
INSERT INTO `menu` VALUES (1041, 'system', '操作删除', 500, 2, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:operLogs:remove', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system/超级管理员', '2023-12-27 13:18:19', '');
INSERT INTO `menu` VALUES (1042, 'system', '日志导出', 500, 4, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:operLogs:export', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system/超级管理员', '2023-12-27 13:18:24', '');
INSERT INTO `menu` VALUES (1043, 'system', '登录列表', 501, 1, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:loginLogs:list', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system/超级管理员', '2023-12-27 13:18:47', '');
INSERT INTO `menu` VALUES (1044, 'system', '登录删除', 501, 2, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:loginLogs:remove', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system/超级管理员', '2023-12-27 13:18:52', '');
INSERT INTO `menu` VALUES (1045, 'system', '日志导出', 501, 3, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:loginLogs:export', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system/超级管理员', '2023-12-27 13:18:56', '');
INSERT INTO `menu` VALUES (1047, 'system', '强退登出', 109, 1, '#', '', NULL, '1', '0', 'F', '0', '0', 'security:online:remove', '#', NULL, NULL, 'admin', '2021-03-19 21:11:48', 'system/超级管理员', '2023-12-27 14:15:10', '');
INSERT INTO `menu` VALUES (2089, 'system', '刷新缓存', 105, 5, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:dict:refresh', '#', NULL, NULL, 'tony', '2022-05-30 16:05:10', '', NULL, '');
INSERT INTO `menu` VALUES (2090, 'system', '刷新缓存', 106, 5, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:config:refresh', '#', NULL, NULL, 'tony', '2022-05-30 16:10:26', '', NULL, '');
INSERT INTO `menu` VALUES (2127, 'system', '系统工具', 0, 12, 'tool', NULL, NULL, '1', '0', 'M', '0', '0', '', 'tool', NULL, NULL, 'admin', '2022-06-30 11:03:19', 'system', '2024-08-19 13:13:00', '');
INSERT INTO `menu` VALUES (2128, 'system', '表单构建', 2127, 1, 'build', 'tool/build/index', NULL, '1', '0', 'C', '0', '0', 'tool:build:list', 'build', NULL, NULL, 'admin', '2022-06-30 11:05:05', '', NULL, '');
INSERT INTO `menu` VALUES (2148, 'system', '项目信息配置', 2221, 6, 'configuration', 'system/configuration/pcConfig', '', '1', '0', 'C', '0', '0', 'system:project:list', 'form', NULL, NULL, 'admin', '2022-07-26 10:05:44', 'system/超级管理员', '2023-12-27 17:07:51', '');
INSERT INTO `menu` VALUES (2149, 'system', '项目新增', 2148, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:project:add', '#', NULL, NULL, 'admin', '2022-07-26 10:11:44', 'system[超级管理员]', '2022-11-30 14:40:09', '');
INSERT INTO `menu` VALUES (2150, 'system', '项目删除', 2148, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:project:remove', '#', NULL, NULL, 'admin', '2022-07-26 10:12:18', 'system[超级管理员]', '2022-11-30 14:40:46', '');
INSERT INTO `menu` VALUES (2151, 'system', '项目修改', 2148, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:project:edit', '#', NULL, NULL, 'admin', '2022-07-26 10:12:41', 'system[超级管理员]', '2022-11-30 14:40:56', '');
INSERT INTO `menu` VALUES (2152, 'system', '项目详情', 2148, 4, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:project:query', '#', NULL, NULL, 'admin', '2022-07-26 16:22:07', 'system[超级管理员]', '2022-11-30 14:41:03', '');
INSERT INTO `menu` VALUES (2216, 'system', '应用管理', 2221, 3, 'appManagement', 'system/appManagement/index', NULL, '1', '0', 'C', '0', '0', 'system:apply:list', 'phone', NULL, NULL, 'system[大老板]', '2022-08-12 10:36:04', 'system/超级管理员', '2023-12-27 17:07:30', '');
INSERT INTO `menu` VALUES (2217, 'system', '应用新增', 2216, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:apply:add', '#', NULL, NULL, 'system[大老板]', '2022-08-12 10:51:25', '', NULL, '');
INSERT INTO `menu` VALUES (2218, 'system', '应用编辑', 2216, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:apply:edit', '#', NULL, NULL, 'system[大老板]', '2022-08-12 10:51:45', 'system[大老板]', '2022-08-12 10:52:09', '');
INSERT INTO `menu` VALUES (2219, 'system', '应用详情', 2216, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:apply:query', '#', NULL, NULL, 'system[大老板]', '2022-08-12 10:52:38', '', NULL, '');
INSERT INTO `menu` VALUES (2220, 'system', '应用删除', 2216, 4, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:apply:remove', '#', NULL, NULL, 'system[大老板]', '2022-08-12 10:52:56', '', NULL, '');
INSERT INTO `menu` VALUES (2221, 'system', '系统内部配置', 0, 17, 'sysconfig', NULL, NULL, '1', '0', 'M', '0', '0', '', 'main', NULL, NULL, 'system[大Boss1]', '2022-08-15 16:40:42', 'system', '2024-09-09 19:13:34', '');
INSERT INTO `menu` VALUES (2222, 'system', '应用轮播图', 2221, 5, 'mobileConfig', 'system/configuration/mobileConfig', NULL, '1', '0', 'C', '0', '0', 'system:applyBanner:list', 'dict', NULL, NULL, 'system[大Boss1]', '2022-08-15 16:42:32', 'system/超级管理员', '2023-12-27 18:49:01', '');
INSERT INTO `menu` VALUES (2223, 'system', 'Banner新增', 2222, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:applyBanner:add', '#', NULL, NULL, 'system[大Boss1]', '2022-08-16 10:30:46', '', NULL, '');
INSERT INTO `menu` VALUES (2224, 'system', 'Banner修改', 2222, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:applyBanner:edit', '#', NULL, NULL, 'system[大Boss1]', '2022-08-16 10:31:23', 'system[大Boss1]', '2022-08-16 10:32:21', '');
INSERT INTO `menu` VALUES (2225, 'system', 'Banner删除', 2222, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:applyBanner:remove', '#', NULL, NULL, 'system[大Boss1]', '2022-08-16 10:32:36', 'system[大Boss1]', '2022-08-16 10:32:46', '');
INSERT INTO `menu` VALUES (2226, 'system', 'Banner详情', 2222, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:applyBanner:query', '#', NULL, NULL, 'system[大Boss1]', '2022-08-16 10:33:19', '', NULL, '');
INSERT INTO `menu` VALUES (2246, 'system', '接口文档', 2127, 2, 'http://192.168.0.250:9010/doc.html', NULL, NULL, '0', '0', 'M', '1', '1', '', 'swagger', NULL, NULL, 'system[超级管理员]', '2022-08-30 13:42:01', 'system[超级管理员]', '2023-06-28 10:25:33', '');
INSERT INTO `menu` VALUES (2247, 'system', '接口开发', 2127, 3, 'http://192.168.0.250:18084/magic/web/index.html', NULL, NULL, '0', '0', 'M', '1', '1', '', 'example', NULL, NULL, 'system[超级管理员]', '2022-08-30 13:45:17', 'system/超级管理员', '2023-12-27 13:52:32', '');
INSERT INTO `menu` VALUES (2251, 'system', '区域管理1', 1, 5, 'deptArea', 'system/deptArea/index', NULL, '1', '1', 'C', '1', '1', 'system:deptArea:list', 'international', NULL, NULL, 'system[超级管理员]', '2022-09-01 11:32:13', 'system/超级管理员', '2023-12-27 14:07:15', '');
INSERT INTO `menu` VALUES (2254, 'system', '区域详情', 2251, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:deptArea:query', '#', NULL, NULL, 'system[超级管理员]', '2022-09-01 11:40:13', 'system[超级管理员]', '2023-01-03 15:27:13', '');
INSERT INTO `menu` VALUES (2474, 'system', '公告详情', 107, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'message:notice:details', '#', NULL, NULL, 'system[超级管理员]', '2022-10-26 15:58:41', '', NULL, '');
INSERT INTO `menu` VALUES (2543, 'system', '我的信息', 1, 7, 'myInfo', 'system/myInfo/index', NULL, '1', '0', 'C', '0', '0', '', 'email', NULL, NULL, 'system[超级管理员]', '2023-01-05 11:17:37', 'lszh_admin/lszh_admin/丽水管理员', '2023-02-10 12:31:52', '');
INSERT INTO `menu` VALUES (2604, 'system', '下载配置', 2221, 7, 'projectAnnex', 'system/projectAnnex/attachConfig', NULL, '1', '0', 'C', '0', '0', 'system:projectAnnex:list', 'form', NULL, NULL, 'system', '2023-02-20 10:01:51', 'system', '2024-09-10 10:48:32', '项目附件配置菜单');
INSERT INTO `menu` VALUES (2605, 'system', '附件查询', 2604, 1, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:projectAnnex:query', '#', NULL, NULL, 'system', '2023-02-20 10:01:51', '', NULL, '');
INSERT INTO `menu` VALUES (2606, 'system', '附件新增', 2604, 2, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:projectAnnex:add', '#', NULL, NULL, 'system', '2023-02-20 10:01:51', '', NULL, '');
INSERT INTO `menu` VALUES (2607, 'system', '附件编辑', 2604, 3, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:projectAnnex:edit', '#', NULL, NULL, 'system', '2023-02-20 10:01:51', '', NULL, '');
INSERT INTO `menu` VALUES (2608, 'system', '附件删除', 2604, 4, '#', '', NULL, '1', '0', 'F', '0', '0', 'system:projectAnnex:remove', '#', NULL, NULL, 'system', '2023-02-20 10:01:51', '', NULL, '');
INSERT INTO `menu` VALUES (2623, 'system', '服务监控', 2, 3, 'server', 'monitor/server/index', NULL, '1', '1', 'C', '1', '1', '', 'dashboard', NULL, NULL, 'system[超级管理员]', '2023-06-28 10:17:28', 'system/超级管理员', '2023-12-27 13:22:22', '');
INSERT INTO `menu` VALUES (2624, 'system', '缓存监控', 2, 4, 'cache', 'monitor/cache/index', NULL, '1', '1', 'C', '1', '1', '', 'redis', NULL, NULL, 'system[超级管理员]', '2023-06-28 10:19:59', 'system/超级管理员', '2023-12-27 13:39:09', '');
INSERT INTO `menu` VALUES (2625, 'system', '代码构建', 2127, 4, 'gen', 'tool/gen/index', NULL, '1', '1', 'C', '0', '0', 'generator:tool:list', 'guide', NULL, NULL, 'system/超级管理员', '2023-12-27 16:00:47', 'system', '2024-02-23 10:47:37', '');
INSERT INTO `menu` VALUES (2626, 'system', '详情预览', 2625, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'generator:tool:query', '#', NULL, NULL, 'system/超级管理员', '2023-12-27 16:01:29', '', NULL, '');
INSERT INTO `menu` VALUES (2627, 'system', '构建修改', 2625, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'generator:tool:edit', '#', NULL, NULL, 'system/超级管理员', '2023-12-27 16:02:00', '', NULL, '');
INSERT INTO `menu` VALUES (2628, 'system', '构建删除', 2625, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'generator:tool:remove', '#', NULL, NULL, 'system/超级管理员', '2023-12-27 16:02:26', '', NULL, '');
INSERT INTO `menu` VALUES (2629, 'system', '构建导入', 2625, 5, '', NULL, NULL, '1', '0', 'F', '0', '0', 'generator:tool:import', '#', NULL, NULL, 'system/超级管理员', '2023-12-27 16:03:03', 'system', '2024-01-03 11:30:36', '');
INSERT INTO `menu` VALUES (2630, 'system', '构建下载', 2625, 6, '', NULL, NULL, '1', '0', 'F', '0', '0', 'generator:tool:batch', '#', NULL, NULL, 'system/超级管理员', '2023-12-27 16:04:37', 'system', '2024-01-03 11:30:41', '');
INSERT INTO `menu` VALUES (2780, 'system', '经纬度转换', 2127, 5, 'latLogConversion', 'tool/latLogConversion/latLogConversion', NULL, '1', '0', 'C', '0', '0', '', 'jingweidu', NULL, NULL, 'system', '2024-01-19 09:40:58', 'system', '2024-01-23 11:55:30', '');
INSERT INTO `menu` VALUES (2781, 'system', '用户权限', 100, 8, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:user:role', '#', NULL, NULL, 'system', '2024-01-22 16:34:36', '', NULL, '');
INSERT INTO `menu` VALUES (2782, 'system', '流程管理', 0, 13, 'process', NULL, NULL, '1', '0', 'M', '0', '1', NULL, 'skill', NULL, NULL, 'system', '2024-02-02 14:33:58', 'system', '2024-09-09 19:14:00', '');
INSERT INTO `menu` VALUES (2783, 'system', '流程分类', 2782, 1, 'category', 'workflow/category/index', NULL, '1', '1', 'C', '0', '0', 'flowable:category:list', 'nested', NULL, NULL, 'system', '2024-02-02 14:35:06', 'system', '2024-02-20 11:29:28', '');
INSERT INTO `menu` VALUES (2784, 'system', '表单配置', 2782, 2, 'form', 'workflow/form/index', NULL, '1', '1', 'C', '0', '0', 'flowable:form:list', 'form', NULL, NULL, 'system', '2024-02-02 14:35:23', 'system', '2024-02-20 11:29:31', '');
INSERT INTO `menu` VALUES (2785, 'system', '流程模型', 2782, 3, 'model', 'workflow/model/index', NULL, '1', '1', 'C', '0', '0', 'flowable:model:list', 'component', NULL, NULL, 'system', '2024-02-02 14:35:50', 'system', '2024-02-20 11:29:35', '');
INSERT INTO `menu` VALUES (2786, 'system', '部署管理', 2782, 4, 'deploy', 'workflow/deploy/index', NULL, '1', '1', 'C', '0', '0', 'flowable:deploy:list', 'example', NULL, NULL, 'system', '2024-02-02 14:36:04', 'system', '2024-02-20 11:29:38', '');
INSERT INTO `menu` VALUES (2787, 'system', '新增流程分类', 2783, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:category:add', '#', NULL, NULL, 'system', '2024-02-02 14:36:53', '', NULL, '');
INSERT INTO `menu` VALUES (2788, 'system', '修改流程分类', 2783, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:category:edit', '#', NULL, NULL, 'system', '2024-02-02 14:37:12', '', NULL, '');
INSERT INTO `menu` VALUES (2789, 'system', '流程分类详细信息', 2783, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:category:query', '#', NULL, NULL, 'system', '2024-02-02 14:37:30', '', NULL, '');
INSERT INTO `menu` VALUES (2790, 'system', '删除流程分类', 2783, 4, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:category:remove', '#', NULL, NULL, 'system', '2024-02-02 14:37:46', '', NULL, '');
INSERT INTO `menu` VALUES (2791, 'system', '导出流程分类列表', 2783, 5, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:category:export', '#', NULL, NULL, 'system', '2024-02-02 14:38:04', '', NULL, '');
INSERT INTO `menu` VALUES (2792, 'system', '表单配置详情', 2784, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:form:query', '#', NULL, NULL, 'system', '2024-02-02 14:39:12', '', NULL, '');
INSERT INTO `menu` VALUES (2793, 'system', '表单配置新增', 2784, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:form:add', '#', NULL, NULL, 'system', '2024-02-02 14:39:42', '', NULL, '');
INSERT INTO `menu` VALUES (2794, 'system', '表单配置修改', 2784, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:form:edit', '#', NULL, NULL, 'system', '2024-02-02 14:39:59', 'system', '2024-02-02 14:40:31', '');
INSERT INTO `menu` VALUES (2795, 'system', '表单配置删除', 2784, 4, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:form:remove', '#', NULL, NULL, 'system', '2024-02-02 14:40:12', '', NULL, '');
INSERT INTO `menu` VALUES (2796, 'system', '导出流程表单列表', 2784, 5, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:form:export', '#', NULL, NULL, 'system', '2024-02-02 14:40:50', '', NULL, '');
INSERT INTO `menu` VALUES (2797, 'system', '新增流程模型', 2785, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:model:add', '#', NULL, NULL, 'system', '2024-02-02 14:42:30', 'system', '2024-02-02 14:43:35', '');
INSERT INTO `menu` VALUES (2798, 'system', '获取流程模型详细信息', 2785, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:model:query', '#', NULL, NULL, 'system', '2024-02-02 14:42:57', '', NULL, '');
INSERT INTO `menu` VALUES (2799, 'system', '获取流程表单详细信息', 2785, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:model:query', '#', NULL, NULL, 'system', '2024-02-02 14:43:23', 'system', '2024-02-02 14:43:40', '');
INSERT INTO `menu` VALUES (2800, 'system', '修改流程模型', 2785, 4, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:model:edit', '#', NULL, NULL, 'system', '2024-02-02 14:44:02', '', NULL, '');
INSERT INTO `menu` VALUES (2801, 'system', '保存流程模型', 2785, 5, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:model:save', '#', NULL, NULL, 'system', '2024-02-02 14:44:17', '', NULL, '');
INSERT INTO `menu` VALUES (2802, 'system', '设为最新流程模型', 2785, 6, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:model:save', '#', NULL, NULL, 'system', '2024-02-02 14:44:34', '', NULL, '');
INSERT INTO `menu` VALUES (2803, 'system', '删除流程模型', 2785, 7, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:model:remove', '#', NULL, NULL, 'system', '2024-02-02 14:44:51', '', NULL, '');
INSERT INTO `menu` VALUES (2804, 'system', '部署流程模型', 2785, 8, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:model:deploy', '#', NULL, NULL, 'system', '2024-02-02 14:45:12', '', NULL, '');
INSERT INTO `menu` VALUES (2805, 'system', '导出流程模型数据', 2785, 9, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:model:export', '#', NULL, NULL, 'system', '2024-02-02 14:45:45', '', NULL, '');
INSERT INTO `menu` VALUES (2806, 'system', '激活或挂起流程', 2786, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:deploy:state', '#', NULL, NULL, 'system', '2024-02-02 14:48:49', '', NULL, '');
INSERT INTO `menu` VALUES (2807, 'system', '读取xml文件', 2786, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:deploy:query', '#', NULL, NULL, 'system', '2024-02-02 14:49:13', '', NULL, '');
INSERT INTO `menu` VALUES (2808, 'system', '删除流程部署', 2786, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:deploy:remove', '#', NULL, NULL, 'system', '2024-02-02 14:49:33', '', NULL, '');
INSERT INTO `menu` VALUES (2809, 'system', '办公管理', 0, 14, 'work', NULL, NULL, '1', '0', 'M', '0', '1', NULL, 'job', NULL, NULL, 'system', '2024-02-02 14:50:32', 'system', '2024-09-09 19:13:51', '');
INSERT INTO `menu` VALUES (2810, 'system', '新建流程', 2809, 1, 'create', 'workflow/work/index', NULL, '1', '1', 'C', '0', '0', 'flowable:process:startList', 'guide', NULL, NULL, 'system', '2024-02-02 14:50:54', 'system', '2024-02-20 11:30:11', '');
INSERT INTO `menu` VALUES (2811, 'system', '我的流程', 2809, 2, 'own', 'workflow/work/own', NULL, '1', '1', 'C', '0', '0', 'flowable:process:ownList', 'cascader', NULL, NULL, 'system', '2024-02-02 15:05:32', 'system', '2024-02-20 11:28:09', '');
INSERT INTO `menu` VALUES (2812, 'system', '待办任务', 2809, 3, 'todo', 'workflow/work/todo', NULL, '1', '1', 'C', '0', '0', 'flowable:process:todoList', 'time-range', NULL, NULL, 'system', '2024-02-02 15:05:58', 'system', '2024-02-20 11:28:13', '');
INSERT INTO `menu` VALUES (2813, 'system', '待签任务', 2809, 4, 'claim', 'workflow/work/claim', NULL, '1', '1', 'C', '0', '0', 'flowable:process:claimList', 'checkbox', NULL, NULL, 'system', '2024-02-02 15:06:41', 'system', '2024-02-20 11:27:44', '');
INSERT INTO `menu` VALUES (2814, 'system', '已办任务', 2809, 5, 'finished', 'workflow/work/finished', NULL, '1', '1', 'C', '0', '0', 'flowable:process:finishedList', 'checkbox', NULL, NULL, 'system', '2024-02-02 15:07:05', 'system', '2024-02-20 11:27:52', '');
INSERT INTO `menu` VALUES (2815, 'system', '抄送我的', 2809, 6, 'copy', 'workflow/work/copy', NULL, '1', '1', 'C', '0', '0', 'flowable:process:copyList', 'checkbox', NULL, NULL, 'system', '2024-02-02 15:07:27', 'system', '2024-02-20 11:27:58', '');
INSERT INTO `menu` VALUES (2816, 'system', '查询流程部署关联表单信息', 2810, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:start', '#', NULL, NULL, 'system', '2024-02-02 15:11:30', '', NULL, '');
INSERT INTO `menu` VALUES (2817, 'system', '导出新建流程', 2810, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:startExport', '#', NULL, NULL, 'system', '2024-02-02 15:12:16', '', NULL, '');
INSERT INTO `menu` VALUES (2818, 'system', '我的流程详情', 2811, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:detail', '#', NULL, NULL, 'system', '2024-02-02 15:16:26', '', NULL, '');
INSERT INTO `menu` VALUES (2819, 'system', '取消申请', 2811, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:cancel', '#', NULL, NULL, 'system', '2024-02-02 15:17:44', '', NULL, '');
INSERT INTO `menu` VALUES (2820, 'system', '重新发起', 2811, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:start', '#', NULL, NULL, 'system', '2024-02-02 15:21:25', '', NULL, '');
INSERT INTO `menu` VALUES (2821, 'system', '删除我的流程', 2811, 4, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:remove', '#', NULL, NULL, 'system', '2024-02-02 15:26:08', '', NULL, '');
INSERT INTO `menu` VALUES (2822, 'system', '导出', 2811, 5, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:ownExport', '#', NULL, NULL, 'system', '2024-02-02 15:26:41', '', NULL, '');
INSERT INTO `menu` VALUES (2823, 'system', '导出', 2812, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:todoExport', '#', NULL, NULL, 'system', '2024-02-02 15:28:16', '', NULL, '');
INSERT INTO `menu` VALUES (2824, 'system', '办理', 2812, 2, ' ', NULL, NULL, '1', '0', 'C', '0', '0', NULL, '#', NULL, NULL, 'system', '2024-02-02 15:28:34', '', NULL, '');
INSERT INTO `menu` VALUES (2825, 'system', '通过', 2824, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:approval', '#', NULL, NULL, 'system', '2024-02-02 15:29:49', '', NULL, '');
INSERT INTO `menu` VALUES (2826, 'system', '委派', 2824, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:delegate', '#', NULL, NULL, 'system', '2024-02-02 15:30:52', 'system', '2024-02-02 15:31:10', '');
INSERT INTO `menu` VALUES (2827, 'system', '转办', 2824, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:transfer', '#', NULL, NULL, 'system', '2024-02-02 15:31:43', '', NULL, '');
INSERT INTO `menu` VALUES (2828, 'system', '退回', 2824, 4, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:return', '#', NULL, NULL, 'system', '2024-02-02 15:32:23', 'system', '2024-02-02 15:32:29', '');
INSERT INTO `menu` VALUES (2829, 'system', '拒绝', 2824, 5, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:reject', '#', NULL, NULL, 'system', '2024-02-02 15:32:54', '', NULL, '');
INSERT INTO `menu` VALUES (2830, 'system', '详情', 2812, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:detail', '#', NULL, NULL, 'system', '2024-02-02 15:33:52', '', NULL, '');
INSERT INTO `menu` VALUES (2831, 'system', '签收', 2813, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:claim', '#', NULL, NULL, 'system', '2024-02-02 15:35:29', '', NULL, '');
INSERT INTO `menu` VALUES (2832, 'system', '导出', 2813, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:claimExport', '#', NULL, NULL, 'system', '2024-02-02 15:37:17', '', NULL, '');
INSERT INTO `menu` VALUES (2833, 'system', '撤回', 2814, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:revoke', '#', NULL, NULL, 'system', '2024-02-02 15:39:08', '', NULL, '');
INSERT INTO `menu` VALUES (2834, 'system', '流转记录', 2814, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:detail', '#', NULL, NULL, 'system', '2024-02-02 15:40:10', '', NULL, '');
INSERT INTO `menu` VALUES (2835, 'system', '导出', 2814, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:finishedExport', '#', NULL, NULL, 'system', '2024-02-02 15:40:52', '', NULL, '');
INSERT INTO `menu` VALUES (2836, 'system', '详情', 2815, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:detail', '#', NULL, NULL, 'system', '2024-02-02 15:42:35', '', NULL, '');
INSERT INTO `menu` VALUES (2837, 'system', '导出', 2815, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:process:copyExport', '#', NULL, NULL, 'system', '2024-02-02 15:43:19', '', NULL, '');
INSERT INTO `menu` VALUES (2838, 'system', '版本管理', 2786, 4, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:deploy:publishList', '#', NULL, NULL, 'system', '2024-02-02 15:53:29', '', NULL, '');
INSERT INTO `menu` VALUES (2839, 'system', '请假测试', 2809, 7, 'workdemo', 'workflow/workDemo/workDemo', '{\"processKey\": \"Process_1708505049374\",\"nodeKey\":\"Event_01vr76c\"}', '1', '1', 'C', '0', '0', 'flowable:formTest:list', 'user', NULL, NULL, 'system', '2024-02-26 14:38:58', 'system', '2024-02-26 16:30:30', '');
INSERT INTO `menu` VALUES (2840, 'system', '请假添加', 2839, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:formTest:add', '#', NULL, NULL, 'system', '2024-02-26 14:39:50', 'system', '2024-02-26 17:07:17', '');
INSERT INTO `menu` VALUES (2841, 'system', '请假删除', 2839, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'flowable:formTest:remove', '#', NULL, NULL, 'system', '2024-02-26 14:40:11', '', NULL, '');
INSERT INTO `menu` VALUES (2842, 'system', '基础信息管理', 0, 6, 'baseInfo', NULL, NULL, '1', '0', 'M', '1', '1', NULL, 'caidan-jichuxinxiguanli', NULL, NULL, 'system', '2024-08-15 09:49:50', 'system', '2024-09-11 10:58:44', '');
INSERT INTO `menu` VALUES (2843, 'system', '运输货源单位', 2842, 1, 'sourceUnit', 'baseInfoManage/sourceUnit/sourceUnit', NULL, '1', '0', 'C', '0', '0', 'engineering:sourceUnit:list', 'caidan-gongchengyunshuhuoyuandanwei', NULL, NULL, 'system', '2024-08-15 09:50:36', 'system', '2024-09-09 13:12:20', '');
INSERT INTO `menu` VALUES (2844, 'system', '工程运输企业', 2842, 2, 'compManage', 'baseInfoManage/compManage/compManage', NULL, '1', '0', 'C', '0', '0', 'engineering:enterprises:list', 'caidan-gongchengyunshuqiye', NULL, NULL, 'system', '2024-08-15 10:25:26', 'system', '2024-08-21 16:48:05', '');
INSERT INTO `menu` VALUES (2845, 'system', '工程运输车辆', 2842, 3, 'carManage', 'baseInfoManage/carManage/carManage', NULL, '1', '0', 'C', '0', '0', NULL, 'caidan-gongchengyunshucheliang', NULL, NULL, 'system', '2024-08-15 10:26:07', 'system', '2024-08-21 16:48:14', '');
INSERT INTO `menu` VALUES (2846, 'system', '工程运输人员', 2842, 4, 'personManage', 'baseInfoManage/personManage/personManage', NULL, '1', '0', 'C', '0', '0', NULL, 'caidan-gongchengyunshurenyuan', NULL, NULL, 'system', '2024-08-15 10:26:51', 'system', '2024-08-21 16:48:21', '');
INSERT INTO `menu` VALUES (2847, 'system', '运输重点线路', 2842, 5, 'keylineManage', 'baseInfoManage/keylineManage/keylineManage', NULL, '1', '0', 'C', '0', '0', NULL, 'caidan-gongchengyunshuzhongdianxianlu', NULL, NULL, 'system', '2024-08-15 10:27:40', 'system', '2024-09-09 13:12:30', '');
INSERT INTO `menu` VALUES (2848, 'system', '工程运输企业查询', 2844, 1, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:enterprises:query', '#', NULL, NULL, 'system', '2024-08-15 11:51:12', '', NULL, '');
INSERT INTO `menu` VALUES (2849, 'system', '工程运输企业新增', 2844, 2, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:enterprises:add', '#', NULL, NULL, 'system', '2024-08-15 11:51:12', '', NULL, '');
INSERT INTO `menu` VALUES (2850, 'system', '工程运输企业编辑', 2844, 3, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:enterprises:edit', '#', NULL, NULL, 'system', '2024-08-15 11:51:12', '', NULL, '');
INSERT INTO `menu` VALUES (2851, 'system', '工程运输企业删除', 2844, 4, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:enterprises:remove', '#', NULL, NULL, 'system', '2024-08-15 11:51:12', '', NULL, '');
INSERT INTO `menu` VALUES (2852, 'system', '工程运输企业导入', 2844, 5, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:enterprises:import', '#', NULL, NULL, 'system', '2024-08-15 11:51:12', '', NULL, '');
INSERT INTO `menu` VALUES (2853, 'system', '工程运输企业导出', 2844, 6, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:enterprises:export', '#', NULL, NULL, 'system', '2024-08-15 11:51:12', '', NULL, '');
INSERT INTO `menu` VALUES (2854, 'system', '工程运输货源单位查询', 2843, 1, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:sourceUnit:query', '#', NULL, NULL, 'system', '2024-08-15 11:52:24', '', NULL, '');
INSERT INTO `menu` VALUES (2855, 'system', '工程运输货源单位新增', 2843, 2, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:sourceUnit:add', '#', NULL, NULL, 'system', '2024-08-15 11:52:24', '', NULL, '');
INSERT INTO `menu` VALUES (2856, 'system', '工程运输货源单位编辑', 2843, 3, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:sourceUnit:edit', '#', NULL, NULL, 'system', '2024-08-15 11:52:24', '', NULL, '');
INSERT INTO `menu` VALUES (2857, 'system', '工程运输货源单位删除', 2843, 4, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:sourceUnit:remove', '#', NULL, NULL, 'system', '2024-08-15 11:52:24', '', NULL, '');
INSERT INTO `menu` VALUES (2858, 'system', '工程运输货源单位导入', 2843, 5, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:sourceUnit:import', '#', NULL, NULL, 'system', '2024-08-15 11:52:24', '', NULL, '');
INSERT INTO `menu` VALUES (2859, 'system', '工程运输货源单位导出', 2843, 6, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:sourceUnit:export', '#', NULL, NULL, 'system', '2024-08-15 11:52:24', '', NULL, '');
INSERT INTO `menu` VALUES (2860, 'system', '工程运输人员查询', 2846, 1, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:personnel:query', '#', NULL, NULL, 'system', '2024-08-15 11:53:01', '', NULL, '');
INSERT INTO `menu` VALUES (2861, 'system', '工程运输人员新增', 2846, 2, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:personnel:add', '#', NULL, NULL, 'system', '2024-08-15 11:53:01', '', NULL, '');
INSERT INTO `menu` VALUES (2862, 'system', '工程运输人员编辑', 2846, 3, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:personnel:edit', '#', NULL, NULL, 'system', '2024-08-15 11:53:01', '', NULL, '');
INSERT INTO `menu` VALUES (2863, 'system', '工程运输人员删除', 2846, 4, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:personnel:remove', '#', NULL, NULL, 'system', '2024-08-15 11:53:01', '', NULL, '');
INSERT INTO `menu` VALUES (2864, 'system', '工程运输人员导入', 2846, 5, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:personnel:import', '#', NULL, NULL, 'system', '2024-08-15 11:53:01', '', NULL, '');
INSERT INTO `menu` VALUES (2865, 'system', '工程运输人员导出', 2846, 6, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:personnel:export', '#', NULL, NULL, 'system', '2024-08-15 11:53:01', '', NULL, '');
INSERT INTO `menu` VALUES (2866, 'system', '工程运输车辆查询', 2845, 1, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:vehicles:query', '#', NULL, NULL, 'system', '2024-08-15 11:53:37', '', NULL, '');
INSERT INTO `menu` VALUES (2867, 'system', '工程运输车辆新增', 2845, 2, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:vehicles:add', '#', NULL, NULL, 'system', '2024-08-15 11:53:37', '', NULL, '');
INSERT INTO `menu` VALUES (2868, 'system', '工程运输车辆编辑', 2845, 3, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:vehicles:edit', '#', NULL, NULL, 'system', '2024-08-15 11:53:37', '', NULL, '');
INSERT INTO `menu` VALUES (2869, 'system', '工程运输车辆删除', 2845, 4, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:vehicles:remove', '#', NULL, NULL, 'system', '2024-08-15 11:53:37', '', NULL, '');
INSERT INTO `menu` VALUES (2870, 'system', '工程运输车辆导入', 2845, 5, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:vehicles:import', '#', NULL, NULL, 'system', '2024-08-15 11:53:37', '', NULL, '');
INSERT INTO `menu` VALUES (2871, 'system', '工程运输车辆导出', 2845, 6, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:vehicles:export', '#', NULL, NULL, 'system', '2024-08-15 11:53:37', '', NULL, '');
INSERT INTO `menu` VALUES (2872, 'system', '工程运输重点路段查询', 2847, 1, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:keyRoutes:query', '#', NULL, NULL, 'system', '2024-08-15 11:54:12', '', NULL, '');
INSERT INTO `menu` VALUES (2873, 'system', '工程运输重点路段新增', 2847, 2, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:keyRoutes:add', '#', NULL, NULL, 'system', '2024-08-15 11:54:12', '', NULL, '');
INSERT INTO `menu` VALUES (2874, 'system', '工程运输重点路段编辑', 2847, 3, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:keyRoutes:edit', '#', NULL, NULL, 'system', '2024-08-15 11:54:12', '', NULL, '');
INSERT INTO `menu` VALUES (2875, 'system', '工程运输重点路段删除', 2847, 4, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:keyRoutes:remove', '#', NULL, NULL, 'system', '2024-08-15 11:54:12', '', NULL, '');
INSERT INTO `menu` VALUES (2876, 'system', '工程运输重点路段导入', 2847, 5, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:keyRoutes:import', '#', NULL, NULL, 'system', '2024-08-15 11:54:12', '', NULL, '');
INSERT INTO `menu` VALUES (2877, 'system', '工程运输重点路段导出', 2847, 6, '#', '', NULL, '1', '0', 'F', '0', '0', 'engineering:keyRoutes:export', '#', NULL, NULL, 'system', '2024-08-15 11:54:12', '', NULL, '');
INSERT INTO `menu` VALUES (2878, 'system', '停车监测', 0, 2, 'parkingMonitoring', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'caidan-tingchejiance', NULL, NULL, 'system', '2024-08-15 13:22:34', 'system', '2024-09-11 09:57:30', '');
INSERT INTO `menu` VALUES (2879, 'system', '停车实时监测', 2878, 1, 'realTimeMonitoring', 'parkingMonitoring/realTimeMonitoring/realTimeMonitoring', NULL, '1', '0', 'C', '0', '0', NULL, 'caidan-shishijiance', NULL, NULL, 'system', '2024-08-15 13:23:13', 'system', '2024-08-21 16:43:06', '');
INSERT INTO `menu` VALUES (2880, 'system', '车辆停放记录', 2878, 2, 'parkRecord', 'parkingMonitoring/parkRecord/parkRecord', NULL, '1', '0', 'C', '0', '0', NULL, 'caidan-cheliangtingfangjilu', NULL, NULL, 'system', '2024-08-15 13:31:00', 'system', '2024-08-21 16:43:18', '');
INSERT INTO `menu` VALUES (2881, 'system', '车辆进出场记录', 2878, 3, 'entryExitRecord', 'parkingMonitoring/entryExitRecord/entryExitRecord', NULL, '1', '0', 'C', '0', '0', 'trafficRun:parkingRecord:list', 'caidan-cheliangjinchuchangjilu', NULL, NULL, 'system', '2024-08-15 13:31:40', 'system', '2024-08-30 15:08:39', '');
INSERT INTO `menu` VALUES (2882, 'system', '研判分析', 0, 3, 'judgmentAnalysis', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'caidan-yanpanfenxi', NULL, NULL, 'system', '2024-08-15 13:32:06', 'system', '2024-09-11 09:57:58', '');
INSERT INTO `menu` VALUES (2883, 'system', '停车热点分析', 2882, 1, 'hotspotAnalysis', 'judgmentAnalysis/hotspotAnalysis/hotspotAnalysis', NULL, '1', '0', 'C', '0', '0', 'trafficRun:analyze:getParkingHotPointList', 'caidan-tingcheredianfenxi', NULL, NULL, 'system', '2024-08-15 13:32:38', 'system', '2024-08-30 15:23:24', '');
INSERT INTO `menu` VALUES (2884, 'system', '泊位占有率分析', 2882, 2, 'berthOccupancyRate', 'judgmentAnalysis/berthOccupancyRate/berthOccupancyRate', NULL, '1', '0', 'C', '0', '0', 'trafficRun:analyze:getSaturationList', 'caidan-boweizhanyoushuaifenxi', NULL, NULL, 'system', '2024-08-15 13:33:20', 'system', '2024-08-30 15:24:01', '');
INSERT INTO `menu` VALUES (2885, 'system', '泊位周转率分析', 2882, 3, 'berthTurnoverRate', 'judgmentAnalysis/berthTurnoverRate/berthTurnoverRate', NULL, '1', '0', 'C', '0', '0', 'trafficRun:analyze:getTroList', 'caidan-boweizhouzhuanshuaifenxi', NULL, NULL, 'system', '2024-08-15 13:33:53', 'system', '2024-08-30 15:24:39', '');
INSERT INTO `menu` VALUES (2886, 'system', '停车峰值预测', 2882, 4, 'peakPrediction', 'judgmentAnalysis/peakPrediction/peakPrediction', NULL, '1', '0', 'C', '0', '0', 'trafficRun:analyze:getParkingPeak', 'caidan-tingchefengzhiyuce', NULL, NULL, 'system', '2024-08-15 13:34:20', 'system', '2024-08-30 15:26:36', '');
INSERT INTO `menu` VALUES (2887, 'system', '停车难度挖掘', 2882, 5, 'difficultyExcavation', 'judgmentAnalysis/difficultyExcavation/difficultyExcavation', NULL, '1', '0', 'C', '0', '0', 'trafficRun:analyze:getParkingDifficult', 'caidan-tingchenanduwajue', NULL, NULL, 'system', '2024-08-15 13:35:46', 'system', '2024-08-30 15:27:30', '');
INSERT INTO `menu` VALUES (2888, 'system', '异常车辆分析', 2882, 6, 'abnormalAnalysis', 'judgmentAnalysis/abnormalAnalysis/abnormalAnalysis', NULL, '1', '0', 'C', '0', '0', 'trafficRun:vehicleAbnormal:list', 'caidan-yichangcheliangfenxi', NULL, NULL, 'system', '2024-08-15 13:36:12', 'system', '2024-08-30 15:30:08', '');
INSERT INTO `menu` VALUES (2889, 'system', '预警阈值设置', 2882, 7, 'thresholdSetting', 'judgmentAnalysis/thresholdSetting/thresholdSetting', NULL, '1', '0', 'C', '0', '0', NULL, 'caidan-yuzhishezhi', NULL, NULL, 'system', '2024-08-15 13:36:41', 'system', '2024-08-21 16:47:11', '');
INSERT INTO `menu` VALUES (2890, 'system', '停车场档案', 2981, 6, 'resourceManage/parkingLotArchive', 'resourceManage/parkingLotArchive/parkingLotArchive', NULL, '1', '0', 'C', '0', '0', 'traffic_run:trafficParking:list', 'caidan-tingchechangdangan', NULL, NULL, 'system', '2024-08-15 13:38:14', 'system', '2024-09-10 10:20:44', '');
INSERT INTO `menu` VALUES (2891, 'system', '视频监控管理', 2981, 7, 'resourceManage/videoManage', 'resourceManage/videoManage/videoManage', NULL, '1', '0', 'C', '0', '0', NULL, 'shipinjiankong', NULL, NULL, 'system', '2024-08-15 13:39:20', 'system', '2024-09-10 10:20:53', '');
INSERT INTO `menu` VALUES (2892, 'system', '路段管理', 2981, 8, 'resourceManage/roadSectionManage', 'resourceManage/roadSectionManage/roadSectionManage', NULL, '1', '0', 'C', '0', '0', NULL, 'caidan-daoluguanli', NULL, NULL, 'system', '2024-08-15 13:39:52', 'system', '2024-09-11 10:00:30', '');
INSERT INTO `menu` VALUES (2893, 'system', '区域管理', 2981, 9, 'resourceManage/areaManage', 'resourceManage/areaManage/areaManage', NULL, '1', '0', 'C', '0', '0', NULL, 'caidan-quyuguanli', NULL, NULL, 'system', '2024-08-15 13:40:17', 'system', '2024-09-11 10:01:54', '');
INSERT INTO `menu` VALUES (2894, 'system', '潮汐规律分析', 2882, 0, 'judgmentAnalysis/tidalPatterns', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'caidan-chaoxiguilvfenxi', NULL, NULL, 'system', '2024-08-15 13:42:02', 'system', '2024-08-21 16:45:51', '');
INSERT INTO `menu` VALUES (2895, 'system', '潮汐失衡排名', 2894, 1, 'unbalancedRank', 'judgmentAnalysis/tidalPatterns/unbalancedRank/unbalancedRank', NULL, '1', '0', 'C', '0', '0', 'trafficRun:analyze:getTideUnbalance', 'none', NULL, NULL, 'system', '2024-08-15 13:42:43', 'system', '2024-08-30 15:37:58', '');
INSERT INTO `menu` VALUES (2896, 'system', '进出流量排名', 2894, 2, 'inOutTraffic', 'judgmentAnalysis/tidalPatterns/inOutTraffic/inOutTraffic', NULL, '1', '0', 'C', '0', '0', 'trafficRun:analyze:getInOutFlowRank', 'none', NULL, NULL, 'system', '2024-08-15 13:43:57', 'system', '2024-08-30 15:38:33', '');
INSERT INTO `menu` VALUES (2897, 'system', '停车峰值监控', 2894, 3, 'peakParkingMonitor', 'judgmentAnalysis/tidalPatterns/peakParkingMonitor/peakParkingMonitor', NULL, '1', '0', 'C', '0', '0', 'trafficRun:analyze:getParkingPeak', 'none', NULL, NULL, 'system', '2024-08-15 13:44:37', 'system', '2024-08-30 15:39:16', '');
INSERT INTO `menu` VALUES (2898, 'system', '涌入道路分析', 2894, 4, 'inflowRoadAnalysis', 'judgmentAnalysis/tidalPatterns/inflowRoadAnalysis/inflowRoadAnalysis', NULL, '1', '0', 'C', '0', '0', 'trafficRun:analyze:getParkingRoad', 'none', NULL, NULL, 'system', '2024-08-15 13:46:48', 'system', '2024-08-30 15:39:48', '');
INSERT INTO `menu` VALUES (2899, 'system', '工程运输企业通行证', 2844, 7, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:passCheckEnterprises:list', '#', NULL, NULL, 'system', '2024-08-16 13:13:36', '', NULL, '');
INSERT INTO `menu` VALUES (2900, 'system', '通行证新增', 2899, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:passCheckEnterprises:add', '#', NULL, NULL, 'system', '2024-08-16 13:13:58', '', NULL, '');
INSERT INTO `menu` VALUES (2901, 'system', '通行证修改', 2899, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:passCheckEnterprises:edit', '#', NULL, NULL, 'system', '2024-08-16 13:14:19', '', NULL, '');
INSERT INTO `menu` VALUES (2902, 'system', '通行证详情', 2899, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:passCheckEnterprises:query', '#', NULL, NULL, 'system', '2024-08-16 13:14:38', '', NULL, '');
INSERT INTO `menu` VALUES (2903, 'system', '通行证删除', 2899, 4, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:passCheckEnterprises:remove', '#', NULL, NULL, 'system', '2024-08-16 13:15:10', '', NULL, '');
INSERT INTO `menu` VALUES (2904, 'system', '工程运输车辆通行证', 2845, 7, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:passCheckVehicles:list', '#', NULL, NULL, 'system', '2024-08-16 13:16:02', '', NULL, '');
INSERT INTO `menu` VALUES (2905, 'system', '通行证新增', 2904, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:passCheckVehicles:add', '#', NULL, NULL, 'system', '2024-08-16 13:16:26', '', NULL, '');
INSERT INTO `menu` VALUES (2906, 'system', '通行证修改', 2904, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:passCheckVehicles:edit', '#', NULL, NULL, 'system', '2024-08-16 13:16:43', '', NULL, '');
INSERT INTO `menu` VALUES (2907, 'system', '通行证详情', 2904, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:passCheckVehicles:query', '#', NULL, NULL, 'system', '2024-08-16 13:17:02', '', NULL, '');
INSERT INTO `menu` VALUES (2908, 'system', '通行证删除', 2904, 4, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:passCheckVehicles:remove', '#', NULL, NULL, 'system', '2024-08-16 13:17:19', '', NULL, '');
INSERT INTO `menu` VALUES (2909, 'system', '工程运输企业-视频监控', 2844, 8, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:enterprises:video', '#', NULL, NULL, 'system', '2024-08-19 11:05:11', 'system', '2024-08-19 11:05:19', '');
INSERT INTO `menu` VALUES (2910, 'system', '工程运输车辆-视频监控', 2845, 8, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:vehicles:video', '#', NULL, NULL, 'system', '2024-08-19 11:07:35', '', NULL, '');
INSERT INTO `menu` VALUES (2911, 'system', '工程运输货源单位-视频监控', 2843, 7, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:sourceUnit:video', '#', NULL, NULL, 'system', '2024-08-19 11:08:01', '', NULL, '');
INSERT INTO `menu` VALUES (2912, 'system', '车辆实时监测', 0, 7, 'carRealMonitor', 'carRealMonitor/carRealMonitor', NULL, '1', '0', 'C', '1', '1', 'engineering:vehiclesDate:list', 'caidan-cheliangshishijiance', NULL, NULL, 'system', '2024-08-19 11:52:35', 'system', '2024-09-11 10:58:50', '');
INSERT INTO `menu` VALUES (2913, 'system', '通行管控', 0, 8, 'trafficControl', NULL, NULL, '1', '0', 'M', '1', '1', NULL, 'caidan-tonghangguankong', NULL, NULL, 'system', '2024-08-19 13:12:22', 'system', '2024-09-11 10:58:57', '');
INSERT INTO `menu` VALUES (2914, 'system', '车辆违法管理', 2913, 1, 'carIllegalManage', 'trafficControl/carIllegalManage/carIllegalManage', NULL, '1', '0', 'C', '0', '0', 'engineering:violationVehicle:list', 'caidan-cheliangweifaguanli', NULL, NULL, 'system', '2024-08-19 13:15:11', 'system', '2024-08-26 17:27:39', '');
INSERT INTO `menu` VALUES (2915, 'system', '企业违规管理', 2913, 2, 'compIllegalManage', 'trafficControl/compIllegalManage/compIllegalManage', NULL, '1', '0', 'C', '0', '0', 'engineering:violationEnterprises:list', 'caidan-qiyeweifaguanli', NULL, NULL, 'system', '2024-08-19 13:15:46', 'system', '2024-08-26 17:29:09', '');
INSERT INTO `menu` VALUES (2916, 'system', '违法阈值设置', 2913, 3, 'illegalSetting', 'trafficControl/illegalSetting/illegalSetting', NULL, '1', '0', 'C', '0', '0', '', 'caidan-yuzhishezhi', NULL, NULL, 'system', '2024-08-19 13:16:21', 'system', '2024-08-29 17:51:16', '');
INSERT INTO `menu` VALUES (2917, 'system', '统计分析', 0, 9, 'engineeStaticAnalysis', NULL, NULL, '1', '0', 'M', '1', '1', NULL, 'caidan-tongjifenxi1', NULL, NULL, 'system', '2024-08-19 13:24:30', 'system', '2024-09-11 10:59:02', '');
INSERT INTO `menu` VALUES (2918, 'system', '违法违规查询', 2925, 1, 'IllegalCheck', 'engineeStaticAnalysis/IllegalCheck/IllegalCheck', NULL, '1', '0', 'C', '0', '0', 'engineering:illegal:list', '#', NULL, NULL, 'system', '2024-08-19 13:25:23', 'system', '2024-08-22 16:01:37', '');
INSERT INTO `menu` VALUES (2919, 'system', '无牌行驶查询', 2925, 2, 'unlicenseDriving', 'engineeStaticAnalysis/unlicenseDriving/unlicenseDriving', NULL, '1', '0', 'C', '0', '0', 'engineering:unlicensedDriving:list', '#', NULL, NULL, 'system', '2024-08-19 13:26:22', 'system', '2024-08-22 17:15:13', '');
INSERT INTO `menu` VALUES (2920, 'system', '重点车辆违法查询', 2925, 3, 'keyCarIllegalCheck', 'engineeStaticAnalysis/keyCarIllegalCheck/keyCarIllegalCheck', NULL, '1', '0', 'C', '0', '0', 'engineering:keyVehicles:list', '#', NULL, NULL, 'system', '2024-08-19 13:26:54', 'system', '2024-08-22 16:03:11', '');
INSERT INTO `menu` VALUES (2921, 'system', '重点驾驶人违法查询', 2925, 4, 'keyPersonIllegalCheck', 'engineeStaticAnalysis/keyPersonIllegalCheck/keyPersonIllegalCheck', NULL, '1', '0', 'C', '0', '0', 'engineering:keyDrivers:list', '#', NULL, NULL, 'system', '2024-08-19 13:27:38', 'system', '2024-08-22 16:04:16', '');
INSERT INTO `menu` VALUES (2922, 'system', '三率分析', 2917, 5, 'threeRateAnalysis', 'engineeStaticAnalysis/threeRateAnalysis/threeRateAnalysis', NULL, '1', '0', 'C', '0', '0', 'engineering:rateAnalysis:list', 'caidan-sanshuaifenxi', NULL, NULL, 'system', '2024-08-19 13:28:14', 'system', '2024-08-28 17:46:08', '');
INSERT INTO `menu` VALUES (2923, 'system', '通行分析', 2917, 6, 'trafficAnalysis', 'engineeStaticAnalysis/trafficAnalysis/trafficAnalysis', NULL, '1', '0', 'C', '0', '0', 'engineering:trafficAnalysis:list', 'caidan-tonghangfenxi', NULL, NULL, 'system', '2024-08-19 13:28:46', 'system', '2024-08-28 17:45:58', '');
INSERT INTO `menu` VALUES (2924, 'system', '聚集地分析', 2917, 7, 'gatherSiteAnalysis', 'engineeStaticAnalysis/gatherSiteAnalysis/gatherSiteAnalysis', NULL, '1', '0', 'C', '0', '0', 'engineering:gatheringPlace:list', 'caidan-jujidifenxi', NULL, NULL, 'system', '2024-08-19 13:29:22', 'system', '2024-08-30 12:02:38', '');
INSERT INTO `menu` VALUES (2925, 'system', '综合统计分析', 2917, 1, 'syntheticalStatistics', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'caidan-zonghechaxuntongji', NULL, NULL, 'system', '2024-08-19 13:40:31', 'system', '2024-08-21 16:52:31', '');
INSERT INTO `menu` VALUES (2926, 'system', '车辆轨迹', 2845, 9, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:vehicles:trajectory', '#', NULL, NULL, 'system', '2024-08-19 17:24:18', 'system', '2024-08-19 17:24:26', '');
INSERT INTO `menu` VALUES (2927, 'system', '违法违规详情', 2918, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:illegal:query', '#', NULL, NULL, 'system', '2024-08-22 16:01:27', '', NULL, '');
INSERT INTO `menu` VALUES (2928, 'system', '违法违规导出', 2918, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:illegal:export', '#', NULL, NULL, 'system', '2024-08-22 16:01:57', '', NULL, '');
INSERT INTO `menu` VALUES (2929, 'system', '违法违规 处理', 2918, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:illegal:dispose', '#', NULL, NULL, 'system', '2024-08-22 16:02:11', '', NULL, '');
INSERT INTO `menu` VALUES (2930, 'system', '无牌驾驶详情', 2919, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:unlicensedDriving:query', '#', NULL, NULL, 'system', '2024-08-22 16:02:41', '', NULL, '');
INSERT INTO `menu` VALUES (2931, 'system', '无牌驾驶导出', 2919, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:unlicensedDriving:export', '#', NULL, NULL, 'system', '2024-08-22 16:02:52', '', NULL, '');
INSERT INTO `menu` VALUES (2932, 'system', '重点车辆违规详情', 2920, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:keyVehicles:query', '#', NULL, NULL, 'system', '2024-08-22 16:03:26', '', NULL, '');
INSERT INTO `menu` VALUES (2933, 'system', '重点车辆违规导出', 2920, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:keyVehicles:export', '#', NULL, NULL, 'system', '2024-08-22 16:03:45', '', NULL, '');
INSERT INTO `menu` VALUES (2934, 'system', '重点车辆违规 处理', 2920, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:keyVehicles:dispose', '#', NULL, NULL, 'system', '2024-08-22 16:04:00', '', NULL, '');
INSERT INTO `menu` VALUES (2935, 'system', '重点驾驶员违法详情', 2921, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:keyDrivers:query', '#', NULL, NULL, 'system', '2024-08-22 16:04:30', '', NULL, '');
INSERT INTO `menu` VALUES (2936, 'system', '重点驾驶员违法导出', 2921, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:keyDrivers:export', '#', NULL, NULL, 'system', '2024-08-22 16:04:45', '', NULL, '');
INSERT INTO `menu` VALUES (2937, 'system', '重点驾驶员违法 处理', 2921, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:keyDrivers:dispose', '#', NULL, NULL, 'system', '2024-08-22 16:05:02', '', NULL, '');
INSERT INTO `menu` VALUES (2938, 'system', '签到记录', 1, 9, 'signInRecord', 'system/signInRecord/signInRecord.vue', NULL, '1', '0', 'C', '0', '0', NULL, 'build', NULL, NULL, 'system', '2024-08-23 09:36:40', 'system', '2024-08-23 09:37:24', '');
INSERT INTO `menu` VALUES (2939, 'system', '车辆驾驶舱', 0, 5, '/carCockpit', 'engineerCarScreen/engineerCarScreen', NULL, '1', '0', 'C', '1', '1', 'engineering:cockpit:list', 'caidan-jiashicang', NULL, NULL, 'system', '2024-08-23 10:42:07', 'system', '2024-09-11 10:58:36', '');
INSERT INTO `menu` VALUES (2940, 'system', '授权绑定', 100, 7, '', NULL, NULL, '1', '0', 'F', '0', '0', 'system:auth:list', '#', NULL, NULL, 'system', '2024-08-23 17:14:10', 'system', '2024-09-11 13:48:45', '');
INSERT INTO `menu` VALUES (2941, 'system', '车辆违法导出', 2914, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:violationVehicle:export', '#', NULL, NULL, 'system', '2024-08-26 17:27:57', '', NULL, '');
INSERT INTO `menu` VALUES (2942, 'system', '车辆违法-违规记录', 2914, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:violationVehicle:violationRecord', '#', NULL, NULL, 'system', '2024-08-26 17:28:20', '', NULL, '');
INSERT INTO `menu` VALUES (2943, 'system', '车辆违法 锁定', 2914, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:violationVehicle:lock', '#', NULL, NULL, 'system', '2024-08-26 17:28:37', '', NULL, '');
INSERT INTO `menu` VALUES (2944, 'system', '车辆违法解锁', 2914, 4, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:violationVehicle:unlock', '#', NULL, NULL, 'system', '2024-08-26 17:28:56', '', NULL, '');
INSERT INTO `menu` VALUES (2945, 'system', '企业违规导出', 2915, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:violationEnterprises:export', '#', NULL, NULL, 'system', '2024-08-26 17:29:23', '', NULL, '');
INSERT INTO `menu` VALUES (2946, 'system', '企业违规记录', 2915, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:violationEnterprises:violationRecord', '#', NULL, NULL, 'system', '2024-08-26 17:29:37', '', NULL, '');
INSERT INTO `menu` VALUES (2947, 'system', '企业违规锁定', 2915, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:violationEnterprises:lock', '#', NULL, NULL, 'system', '2024-08-26 17:29:52', '', NULL, '');
INSERT INTO `menu` VALUES (2948, 'system', '企业违规解锁', 2915, 4, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:violationEnterprises:unlock', '#', NULL, NULL, 'system', '2024-08-26 17:30:06', '', NULL, '');
INSERT INTO `menu` VALUES (2949, 'system', '驾驶舱', 0, 1, 'parkingCockpit', 'parkingCockpit/parkingCockpit', NULL, '1', '0', 'C', '0', '0', NULL, 'ls-cockpit', NULL, NULL, 'system', '2024-08-27 16:08:15', 'system', '2024-09-10 18:42:11', '');
INSERT INTO `menu` VALUES (2950, 'system', '三率分析导出', 2922, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:rateAnalysis:export', '#', NULL, NULL, 'system', '2024-08-28 17:46:23', '', NULL, '');
INSERT INTO `menu` VALUES (2951, 'system', '通行分析', 2923, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'engineering:trafficAnalysis:export', '#', NULL, NULL, 'system', '2024-08-29 17:51:09', '', NULL, '');
INSERT INTO `menu` VALUES (2952, 'system', '新增', 2890, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'traffic_run:trafficParking:add', '#', NULL, NULL, 'system', '2024-08-30 10:37:17', '', NULL, '');
INSERT INTO `menu` VALUES (2953, 'system', '路段管理查询', 2892, 1, '#', '', NULL, '1', '0', 'F', '0', '0', 'trafficRun:road:query', '#', NULL, NULL, 'system', '2024-08-30 10:41:52', '', NULL, '');
INSERT INTO `menu` VALUES (2954, 'system', '路段管理新增', 2892, 2, '#', '', NULL, '1', '0', 'F', '0', '0', 'trafficRun:road:add', '#', NULL, NULL, 'system', '2024-08-30 10:41:52', '', NULL, '');
INSERT INTO `menu` VALUES (2955, 'system', '路段管理编辑', 2892, 3, '#', '', NULL, '1', '0', 'F', '0', '0', 'trafficRun:road:edit', '#', NULL, NULL, 'system', '2024-08-30 10:41:52', '', NULL, '');
INSERT INTO `menu` VALUES (2956, 'system', '路段管理删除', 2892, 4, '#', '', NULL, '1', '0', 'F', '0', '0', 'trafficRun:road:remove', '#', NULL, NULL, 'system', '2024-08-30 10:41:52', '', NULL, '');
INSERT INTO `menu` VALUES (2957, 'system', '路段管理导入', 2892, 5, '#', '', NULL, '1', '0', 'F', '0', '0', 'trafficRun:road:import', '#', NULL, NULL, 'system', '2024-08-30 10:41:52', '', NULL, '');
INSERT INTO `menu` VALUES (2958, 'system', '路段管理导出', 2892, 6, '#', '', NULL, '1', '0', 'F', '0', '0', 'trafficRun:road:export', '#', NULL, NULL, 'system', '2024-08-30 10:41:52', '', NULL, '');
INSERT INTO `menu` VALUES (2959, 'system', '查询', 2890, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'traffic_run:trafficParking:query', '#', NULL, NULL, 'system', '2024-08-30 10:58:57', '', NULL, '');
INSERT INTO `menu` VALUES (2960, 'system', '修改', 2890, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'traffic_run:trafficParking:edit', '#', NULL, NULL, 'system', '2024-08-30 10:59:26', '', NULL, '');
INSERT INTO `menu` VALUES (2961, 'system', '删除', 2890, 5, '', NULL, NULL, '1', '0', 'F', '0', '0', 'traffic_run:trafficParking:remove', '#', NULL, NULL, 'system', '2024-08-30 11:00:05', '', NULL, '');
INSERT INTO `menu` VALUES (2962, 'system', '导入', 2890, 6, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:trafficParking:import', '#', NULL, NULL, 'system', '2024-08-30 11:06:48', '', NULL, '');
INSERT INTO `menu` VALUES (2963, 'system', '导出', 2890, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:trafficParking:export', '#', NULL, NULL, 'system', '2024-08-30 11:07:16', '', NULL, '');
INSERT INTO `menu` VALUES (2964, 'system', '区域管理查询', 2893, 1, '#', '', NULL, '1', '0', 'F', '0', '0', 'trafficRun:area:query', '#', NULL, NULL, 'system', '2024-08-30 11:21:29', '', NULL, '');
INSERT INTO `menu` VALUES (2965, 'system', '区域管理新增', 2893, 2, '#', '', NULL, '1', '0', 'F', '0', '0', 'trafficRun:area:add', '#', NULL, NULL, 'system', '2024-08-30 11:21:29', '', NULL, '');
INSERT INTO `menu` VALUES (2966, 'system', '区域管理编辑', 2893, 3, '#', '', NULL, '1', '0', 'F', '0', '0', 'trafficRun:area:edit', '#', NULL, NULL, 'system', '2024-08-30 11:21:29', '', NULL, '');
INSERT INTO `menu` VALUES (2967, 'system', '区域管理删除', 2893, 4, '#', '', NULL, '1', '0', 'F', '0', '0', 'trafficRun:area:remove', '#', NULL, NULL, 'system', '2024-08-30 11:21:29', '', NULL, '');
INSERT INTO `menu` VALUES (2968, 'system', '区域管理导入', 2893, 5, '#', '', NULL, '1', '0', 'F', '0', '0', 'trafficRun:area:import', '#', NULL, NULL, 'system', '2024-08-30 11:21:29', '', NULL, '');
INSERT INTO `menu` VALUES (2969, 'system', '区域管理导出', 2893, 6, '#', '', NULL, '1', '0', 'F', '0', '0', 'trafficRun:area:export', '#', NULL, NULL, 'system', '2024-08-30 11:21:29', '', NULL, '');
INSERT INTO `menu` VALUES (2970, 'system', '车辆进出场记录导出', 2881, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:parkingRecord:export', '#', NULL, NULL, 'system', '2024-08-30 15:09:42', '', NULL, '');
INSERT INTO `menu` VALUES (2971, 'system', '详情', 2881, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:parkingRecord:query', '#', NULL, NULL, 'system', '2024-08-30 15:10:13', '', NULL, '');
INSERT INTO `menu` VALUES (2972, 'system', '导出泊位占有率', 2884, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:analyze:exportSaturationExcel', '#', NULL, NULL, 'system', '2024-08-30 15:24:28', '', NULL, '');
INSERT INTO `menu` VALUES (2973, 'system', '导出泊位周转率', 2885, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:analyze:exportTroExcel', '#', NULL, NULL, 'system', '2024-08-30 15:24:59', '', NULL, '');
INSERT INTO `menu` VALUES (2974, 'system', '导出停车峰值预测', 2886, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:analyze:exportParkingPeak', '#', NULL, NULL, 'system', '2024-08-30 15:27:11', '', NULL, '');
INSERT INTO `menu` VALUES (2975, 'system', '导出停车难度挖掘', 2887, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:analyze:exportParkingDifficult', '#', NULL, NULL, 'system', '2024-08-30 15:27:52', '', NULL, '');
INSERT INTO `menu` VALUES (2976, 'system', '异常车辆记录表导出', 2888, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:vehicleAbnormal:export', '#', NULL, NULL, 'system', '2024-08-30 15:37:14', '', NULL, '');
INSERT INTO `menu` VALUES (2977, 'system', '导出潮汐失衡排名', 2895, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:analyze:exportTideUnbalance', '#', NULL, NULL, 'system', '2024-08-30 15:38:17', '', NULL, '');
INSERT INTO `menu` VALUES (2978, 'system', '导出进出流量排名', 2896, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:analyze:exportInOutFlowRank', '#', NULL, NULL, 'system', '2024-08-30 15:39:01', '', NULL, '');
INSERT INTO `menu` VALUES (2979, 'system', '导出停车峰值监控', 2897, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:analyze:exportParkingPeak', '#', NULL, NULL, 'system', '2024-08-30 15:39:31', '', NULL, '');
INSERT INTO `menu` VALUES (2980, 'system', '导出涌入道路分析', 2898, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:analyze:exportParkingRoad', '#', NULL, NULL, 'system', '2024-08-30 15:40:48', '', NULL, '');
INSERT INTO `menu` VALUES (2981, 'system', '系统配置', 0, 10, 'sysSetting', NULL, NULL, '1', '0', 'M', '0', '0', NULL, 'caidan-yuzhishezhi', NULL, NULL, 'system', '2024-09-10 10:13:04', '', NULL, '');
INSERT INTO `menu` VALUES (2982, 'system', '视频-新增按钮', 2891, 1, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:device:add', '#', NULL, NULL, 'system', '2024-09-10 10:17:38', 'system', '2024-09-10 10:17:51', '');
INSERT INTO `menu` VALUES (2983, 'system', '视频-导入按钮', 2891, 2, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:device:import', '#', NULL, NULL, 'system', '2024-09-10 10:18:12', 'system', '2024-09-10 10:18:19', '');
INSERT INTO `menu` VALUES (2984, 'system', '视频-导出按钮', 2891, 3, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:device:export', '#', NULL, NULL, 'system', '2024-09-10 10:18:41', '', NULL, '');
INSERT INTO `menu` VALUES (2985, 'system', '视频-同步按钮', 2891, 4, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:device:sync', '#', NULL, NULL, 'system', '2024-09-10 10:19:05', '', NULL, '');
INSERT INTO `menu` VALUES (2986, 'system', '视频-删除按钮', 2891, 5, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:device:remove', '#', NULL, NULL, 'system', '2024-09-10 10:19:23', '', NULL, '');
INSERT INTO `menu` VALUES (2987, 'system', '视频-修改按钮', 2891, 6, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:device:edit', '#', NULL, NULL, 'system', '2024-09-10 10:19:48', '', NULL, '');
INSERT INTO `menu` VALUES (2988, 'system', '视频-详情按钮', 2891, 7, '', NULL, NULL, '1', '0', 'F', '0', '0', 'trafficRun:device:query', '#', NULL, NULL, 'system', '2024-09-10 10:20:04', '', NULL, '');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` int NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, 'sys', '系统', 1, 0, 'admin', '2021-03-19 21:11:48', 'system', '2024-06-28 15:48:42', '1');
INSERT INTO `post` VALUES (2, 'cz', '处长', 2, 0, 'admin', '2021-03-19 21:11:48', 'lszh_admin[丽水指挥管理员]', '2022-12-09 16:50:30', '');
INSERT INTO `post` VALUES (4, 'zgcs', '总工程师', 4, 0, 'admin', '2021-03-19 21:11:48', 'lszh_admin[丽水管理员]', '2023-01-11 13:49:24', '');
INSERT INTO `post` VALUES (6, 'ky', '科员', 6, 0, 'lszh_admin[丽水指挥管理员]', '2022-12-09 16:51:39', '', NULL, NULL);
INSERT INTO `post` VALUES (7, 'zr', '主任', 7, 0, 'lszh_admin[丽水指挥管理员]', '2022-12-09 16:52:01', 'lszh_admin[丽水指挥管理员]', '2022-12-09 16:54:22', NULL);
INSERT INTO `post` VALUES (11, 'dz', '队长', 9, 0, 'lszh_admin[丽水指挥管理员]', '2022-12-12 13:35:59', '', NULL, NULL);
INSERT INTO `post` VALUES (12, 'fzr', '副主任', 8, 0, 'lszh_admin[丽水管理员]', '2023-01-11 13:47:58', '', NULL, NULL);
INSERT INTO `post` VALUES (13, 'kz', '科长', 9, 0, 'lszh_admin[丽水管理员]', '2023-01-11 13:48:34', '', NULL, NULL);
INSERT INTO `post` VALUES (14, 'fkz', '副科长', 9, 0, 'lszh_admin[丽水管理员]', '2023-01-11 13:48:52', '', NULL, NULL);
INSERT INTO `post` VALUES (15, 'fcz', '副处长', 9, 0, 'lszh_admin[丽水管理员]', '2023-01-11 13:50:08', '', NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户状态（0正常 1停用）',
  `posts` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '岗位信息',
  `depts` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '部门信息',
  `menus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '菜单信息',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (100, 'admin', 'password123', '管理员', 'admin@example.com', '13800138000', '0', '[{\"post_id\": 100, \"post_code\": \"POST001\", \"post_name\": \"项目经理\", \"post_sort\": 1, \"status\": 0}]', '[{\"dept_id\": 1, \"parent_id\": 0, \"ancestors\": \"0\", \"dept_name\": \"总公司\", \"order_num\": 1, \"leader_id\": 1001, \"status\": \"0\", \"is_area\": \"0\", \"is_branch\": \"0\", \"is_lowest\": \"0\", \"area_name\": null, \"node_type\": \"2\"}]', '[{\"menu_id\": 1, \"sys_code\": null, \"menu_name\": \"菜单1\", \"parent_id\": 0, \"order_num\": 1, \"path\": \"/menu1\", \"component\": \"Menu1\", \"query\": null, \"is_frame\": \"1\", \"is_cache\": \"0\", \"menu_type\": \"M\", \"visible\": \"0\", \"status\": \"0\", \"perms\": \"menu1:view\", \"icon\": \"#\", \"report_id\": null, \"button_type\": null}]', 'admin', '2025-02-06 18:31:31', 'admin', '2025-02-06 18:31:31', '系统管理员');
INSERT INTO `user` VALUES (101, 'user1', 'password123', '用户1', 'user1@example.com', '13800138001', '0', '[{\"post_id\": 101, \"post_code\": \"POST002\", \"post_name\": \"前端开发工程师\", \"post_sort\": 2, \"status\": 0}, {\"post_id\": 102, \"post_code\": \"POST003\", \"post_name\": \"后端开发工程师\", \"post_sort\": 3, \"status\": 0}]', '[{\"dept_id\": 2, \"parent_id\": 1, \"ancestors\": \"0,1\", \"dept_name\": \"研发部\", \"order_num\": 1, \"leader_id\": 1002, \"status\": \"0\", \"is_area\": \"0\", \"is_branch\": \"0\", \"is_lowest\": \"1\", \"area_name\": null, \"node_type\": \"2\"}, {\"dept_id\": 8, \"parent_id\": 0, \"ancestors\": \"0\", \"dept_name\": \"分公司\", \"order_num\": 2, \"leader_id\": 1008, \"status\": \"0\", \"is_area\": \"1\", \"is_branch\": \"0\", \"is_lowest\": \"0\", \"area_name\": \"北京\", \"node_type\": \"1\"}]', '[{\"menu_id\": 3, \"sys_code\": null, \"menu_name\": \"菜单3\", \"parent_id\": 1, \"order_num\": 1, \"path\": \"/menu1/menu3\", \"component\": \"Menu3\", \"query\": null, \"is_frame\": \"1\", \"is_cache\": \"0\", \"menu_type\": \"C\", \"visible\": \"0\", \"status\": \"0\", \"perms\": \"menu3:view\", \"icon\": \"#\", \"report_id\": null, \"button_type\": null}, {\"menu_id\": 4, \"sys_code\": null, \"menu_name\": \"菜单4\", \"parent_id\": 1, \"order_num\": 2, \"path\": \"/menu1/menu4\", \"component\": \"Menu4\", \"query\": null, \"is_frame\": \"1\", \"is_cache\": \"0\", \"menu_type\": \"C\", \"visible\": \"0\", \"status\": \"0\", \"perms\": \"menu4:view\", \"icon\": \"#\", \"report_id\": null, \"button_type\": null}]', 'admin', '2025-02-06 18:31:31', 'admin', '2025-02-06 18:31:31', '普通用户');
INSERT INTO `user` VALUES (102, 'user2', 'password123', '用户2', 'user2@example.com', '13800138002', '0', '[{\"post_id\": 103, \"post_code\": \"POST004\", \"post_name\": \"UI设计师\", \"post_sort\": 4, \"status\": 0}]', '[{\"dept_id\": 3, \"parent_id\": 1, \"ancestors\": \"0,1\", \"dept_name\": \"市场部\", \"order_num\": 2, \"leader_id\": 1003, \"status\": \"0\", \"is_area\": \"0\", \"is_branch\": \"0\", \"is_lowest\": \"1\", \"area_name\": null, \"node_type\": \"2\"}]', '[{\"menu_id\": 5, \"sys_code\": null, \"menu_name\": \"菜单5\", \"parent_id\": 0, \"order_num\": 1, \"path\": \"/menu5\", \"component\": \"Menu5\", \"query\": null, \"is_frame\": \"1\", \"is_cache\": \"0\", \"menu_type\": \"M\", \"visible\": \"0\", \"status\": \"0\", \"perms\": \"menu5:view\", \"icon\": \"#\", \"report_id\": null, \"button_type\": null}]', 'admin', '2025-02-06 18:31:31', 'admin', '2025-02-06 18:31:31', '普通用户');

SET FOREIGN_KEY_CHECKS = 1;
