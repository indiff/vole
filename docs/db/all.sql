/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : vole

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 13/09/2019 18:51:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for job_execution_log
-- ----------------------------
DROP TABLE IF EXISTS `job_execution_log`;
CREATE TABLE `job_execution_log`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `task_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sharding_item` int(11) NOT NULL,
  `execution_source` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `failure_cause` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `is_success` int(11) NOT NULL,
  `start_time` timestamp(0) NULL DEFAULT NULL,
  `complete_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for job_status_trace_log
-- ----------------------------
DROP TABLE IF EXISTS `job_status_trace_log`;
CREATE TABLE `job_status_trace_log`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `job_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `original_task_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `task_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `slave_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `execution_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sharding_item` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `message` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `creation_time` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `TASK_ID_STATE_INDEX`(`task_id`, `state`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_0
-- ----------------------------
DROP TABLE IF EXISTS `member_0`;
CREATE TABLE `member_0`  (
  `member_id` bigint(64) NOT NULL COMMENT '主键ID',
  `membername` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '简介',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`member_id`) USING BTREE,
  UNIQUE INDEX `member_idx1_membername`(`membername`) USING BTREE,
  UNIQUE INDEX `member_idx2_phone`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_0
-- ----------------------------
INSERT INTO `member_0` VALUES (1067629916525072386, 'vole', '{bcrypt}$2a$10$YCnmdlVnNsXdxR8t7glNeO5lPlDpbEijuFHrkcT13KcbqXsEVUqAC', '18512582267', NULL, '2018-11-28 12:02:52', NULL, '0');

-- ----------------------------
-- Table structure for member_1
-- ----------------------------
DROP TABLE IF EXISTS `member_1`;
CREATE TABLE `member_1`  (
  `member_id` bigint(64) NOT NULL COMMENT '主键ID',
  `membername` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '简介',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '0-正常，1-删除',
  PRIMARY KEY (`member_id`) USING BTREE,
  UNIQUE INDEX `member_idx1_membername`(`membername`) USING BTREE,
  UNIQUE INDEX `member_idx2_membername`(`phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_role_0
-- ----------------------------
DROP TABLE IF EXISTS `member_role_0`;
CREATE TABLE `member_role_0`  (
  `id` bigint(64) NOT NULL COMMENT 'Id',
  `member_id` bigint(64) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `member_role_idx1`(`member_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for member_role_1
-- ----------------------------
DROP TABLE IF EXISTS `member_role_1`;
CREATE TABLE `member_role_1`  (
  `id` bigint(64) NOT NULL COMMENT 'Id',
  `member_id` bigint(64) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `member_role_idx1`(`member_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_role_1
-- ----------------------------
INSERT INTO `member_role_1` VALUES (1067723141915058177, 1067629916525072386, 1);

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `resource_ids` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `client_secret` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `scope` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `authorized_grant_types` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `authorities` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `autoapprove` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `oauth_client_idx1`(`client_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES (1, 'vole', NULL, '{bcrypt}$2a$10$zqgaMTf2VSHXjIV28CrID.fgN1bGd73VTwLqvmTqHNak79nrRNz7W', 'server', 'client,password', NULL, NULL, NULL, NULL, NULL, 'true');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `permission_id` int(11) NOT NULL COMMENT '权限ID',
  `permission` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限标识',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求链接',
  `method` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (3, 'DEMO_ADMIN', '/demo/**', '*', 'demo所有权限', '2017-11-08 09:57:27', '2018-12-03 15:20:52');
INSERT INTO `permission` VALUES (4, 'MPS_ADMIN', '/mps/**', '*', 'mps系统所有权限', '2017-11-08 10:13:37', '2018-12-03 15:21:41');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_idx1_role_code`(`role_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', 'ROLE_ADMIN', '超级管理员', '2017-10-29 15:45:51', '2018-04-22 11:40:29', '0');
INSERT INTO `role` VALUES (14, 'user', 'ROLE_USER', '普通用户', '2018-04-20 07:14:32', '2018-04-21 23:35:22', '0');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `permission_id` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_permission_idx1`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES (2, 1, 3);
INSERT INTO `role_permission` VALUES (3, 1, 4);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dept_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '部门名称',
  `dept_desc` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '架构部', 'JGDept', '2017-12-21 11:06:45', '2018-11-20 11:20:48');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户',
  `title` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志',
  `url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '参数',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log_0
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_0`;
CREATE TABLE `sys_log_0`  (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `service_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remote_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求URI',
  `method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作方式',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作提交的数据',
  `time` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `exception` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_create_by`(`create_by`) USING BTREE,
  INDEX `sys_log_request_uri`(`request_uri`) USING BTREE,
  INDEX `sys_log_type`(`type`) USING BTREE,
  INDEX `sys_log_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log_1
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_1`;
CREATE TABLE `sys_log_1`  (
  `id` bigint(64) NOT NULL COMMENT '编号',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `service_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务ID',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remote_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求URI',
  `method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作方式',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作提交的数据',
  `time` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '执行时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标记',
  `exception` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_create_by`(`create_by`) USING BTREE,
  INDEX `sys_log_request_uri`(`request_uri`) USING BTREE,
  INDEX `sys_log_type`(`type`) USING BTREE,
  INDEX `sys_log_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` int(20) NOT NULL COMMENT '父级菜单ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '连接地址',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `deep` int(11) NULL DEFAULT NULL COMMENT '深度',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  `resource` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '0--正常 1--删除',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '菜单管理', 0, NULL, 'fa-folder', 1, 1, '01', NULL, 0, '2018-11-11 20:38:42', NULL);
INSERT INTO `sys_menu` VALUES (2, '菜单列表', 1, '/admin/menu/list/1', 'fa-file', 1, 2, '0101', NULL, 0, '2018-11-11 20:39:20', NULL);
INSERT INTO `sys_menu` VALUES (4, '部门管理', 0, NULL, 'fa-folder', 1, 1, '02', NULL, 0, '2018-11-16 16:18:51', NULL);
INSERT INTO `sys_menu` VALUES (5, '部门列表', 4, '/admin/dept/list/1', 'fa-file', 1, 2, '0201', NULL, 0, '2018-11-16 16:20:01', NULL);
INSERT INTO `sys_menu` VALUES (6, '角色管理', 0, NULL, 'fa-folder', 1, 1, '03', NULL, 0, '2018-11-16 16:21:33', NULL);
INSERT INTO `sys_menu` VALUES (7, '角色列表', 6, '/admin/role/list/1', 'fa-file', 1, 2, '0301', NULL, 0, '2018-11-16 16:22:56', NULL);
INSERT INTO `sys_menu` VALUES (8, '系统信息管理', 0, NULL, 'fa-folder', 1, 1, '04', NULL, 0, '2018-11-16 16:24:24', NULL);
INSERT INTO `sys_menu` VALUES (9, '系统信息列表', 8, '/admin/setting/list/1', 'fa-file', 1, 2, '0401', NULL, 0, '2018-11-16 16:25:18', NULL);
INSERT INTO `sys_menu` VALUES (10, '用户管理', 0, NULL, 'fa-folder', 1, 1, '05', NULL, 0, '2018-11-16 16:31:37', NULL);
INSERT INTO `sys_menu` VALUES (11, '用户列表', 10, '/admin/user/list/1', 'fa-file', 1, 2, '0501', NULL, 0, '2018-11-16 16:32:51', NULL);
INSERT INTO `sys_menu` VALUES (12, '会员管理', 0, NULL, 'fa-folder', 1, 1, '06', NULL, 0, '2018-11-22 16:55:43', NULL);
INSERT INTO `sys_menu` VALUES (13, '会员列表', 12, '/mps/member/list/1', 'fa-file', 1, 2, '0601', NULL, 0, '2018-11-22 16:56:34', NULL);
INSERT INTO `sys_menu` VALUES (14, '会员角色管理', 0, NULL, 'fa-folder', 1, 1, '07', NULL, 0, '2018-11-22 16:57:11', NULL);
INSERT INTO `sys_menu` VALUES (16, '会员权限管理', 0, NULL, 'fa-folder', 1, 1, '08', NULL, 0, '2018-11-22 16:58:56', NULL);
INSERT INTO `sys_menu` VALUES (17, '会员权限列表', 16, '/mps/permission/list/1', 'fa-file', 1, 2, '0801', NULL, 0, '2018-11-22 16:59:41', NULL);
INSERT INTO `sys_menu` VALUES (18, '会员客户端管理', 0, NULL, 'fa-folder', 1, 1, '09', NULL, 0, '2018-11-22 17:00:30', NULL);
INSERT INTO `sys_menu` VALUES (19, '会员客户端列表', 18, '/mps/client/list/1', 'fa-file', 1, 2, '0901', NULL, 0, '2018-11-22 17:02:47', NULL);
INSERT INTO `sys_menu` VALUES (20, '会员角色列表', 14, '/mps/role/list/1', 'fa-file', 1, 2, '0701', NULL, 0, '2018-11-22 17:14:18', NULL);
INSERT INTO `sys_menu` VALUES (22, '菜单所有权限', 2, NULL, NULL, 1, 3, '010101', '/admin/menu/**', 0, '2018-11-23 17:33:49', '2018-11-23 18:01:49');
INSERT INTO `sys_menu` VALUES (23, '部门所有权限', 5, NULL, NULL, 1, 3, '020101', '/admin/dept/**', 0, '2018-11-23 17:39:53', '2018-11-23 18:01:56');
INSERT INTO `sys_menu` VALUES (24, '角色所有权限', 7, NULL, NULL, 1, 3, '030101', '/admin/role/**', 0, '2018-11-23 17:42:20', '2018-11-23 18:05:14');
INSERT INTO `sys_menu` VALUES (25, '系统管理所有权限', 9, NULL, NULL, 1, 3, '040101', '/admin/setting/**', 0, '2018-11-23 17:43:29', '2018-11-23 18:02:03');
INSERT INTO `sys_menu` VALUES (26, '用户管理所有权限', 11, NULL, NULL, 1, 3, '050101', '/admin/user/**', 0, '2018-11-23 17:44:15', '2018-11-23 18:02:17');
INSERT INTO `sys_menu` VALUES (27, '会员管理所有权限', 13, NULL, NULL, 1, 3, '060101', '/mps/member/**', 0, '2018-11-23 17:46:17', '2018-11-23 18:02:28');
INSERT INTO `sys_menu` VALUES (28, '会员角色管理所有权限', 20, NULL, NULL, 1, 3, '070101', '/mps/role/**', 0, '2018-11-23 17:47:21', '2018-11-23 18:02:34');
INSERT INTO `sys_menu` VALUES (29, '会员权限管理所有权限', 17, NULL, NULL, 1, 3, '080101', '/mps/permission/**', 0, '2018-11-23 17:48:19', '2018-11-23 18:02:40');
INSERT INTO `sys_menu` VALUES (30, '会员客户端管理所有权限', 19, NULL, NULL, 1, 3, '090101', '/mps/client/**', 0, '2018-11-23 17:49:08', '2018-11-23 18:02:48');
INSERT INTO `sys_menu` VALUES (31, '路由管理', 0, NULL, 'fa-folder', 1, 1, '10', NULL, 0, '2018-11-27 17:25:55', NULL);
INSERT INTO `sys_menu` VALUES (32, '路由列表', 31, '/mps/route/list/1', 'fa-file', 1, 2, '1001', NULL, 0, '2018-11-27 17:26:57', NULL);
INSERT INTO `sys_menu` VALUES (33, '路由管理所有权限', 32, NULL, NULL, 1, 3, '100101', '/mps/route/**', 0, '2018-11-27 17:27:52', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标识（0-正常,1-删除）',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `role_idx1_role_code`(`role_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (15, '菜单管理', 'MENU_ADMIN', '菜单管理所有权限', 0, '2018-11-11 20:41:53', '2018-11-16 16:27:25');
INSERT INTO `sys_role` VALUES (16, '部门管理', 'DEPT_ADMIN', '部门管理所有权限', 0, '2018-11-16 16:26:26', NULL);
INSERT INTO `sys_role` VALUES (17, '角色管理', 'ROLE_ADMIN', '角色管理所有权限', 0, '2018-11-16 16:27:13', NULL);
INSERT INTO `sys_role` VALUES (18, '用户管理', 'USER_ADMIN', '用户管理所有权限', 0, '2018-11-16 16:28:00', NULL);
INSERT INTO `sys_role` VALUES (19, '系统管理', 'SYS_ADMIN', '系统信息管理所有权限', 0, '2018-11-16 16:28:41', NULL);
INSERT INTO `sys_role` VALUES (20, '会员系统管理', 'MPS_ADMIN', '会员系统管理所有权限', 0, '2018-11-22 17:11:58', NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(20) NOT NULL COMMENT '角色主键',
  `menu_id` int(20) NOT NULL COMMENT '菜单主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (37, 19, 8);
INSERT INTO `sys_role_menu` VALUES (38, 19, 9);
INSERT INTO `sys_role_menu` VALUES (39, 19, 25);
INSERT INTO `sys_role_menu` VALUES (40, 18, 10);
INSERT INTO `sys_role_menu` VALUES (41, 18, 11);
INSERT INTO `sys_role_menu` VALUES (42, 18, 26);
INSERT INTO `sys_role_menu` VALUES (43, 17, 6);
INSERT INTO `sys_role_menu` VALUES (44, 17, 7);
INSERT INTO `sys_role_menu` VALUES (45, 17, 24);
INSERT INTO `sys_role_menu` VALUES (46, 16, 4);
INSERT INTO `sys_role_menu` VALUES (47, 16, 5);
INSERT INTO `sys_role_menu` VALUES (48, 16, 23);
INSERT INTO `sys_role_menu` VALUES (49, 15, 1);
INSERT INTO `sys_role_menu` VALUES (50, 15, 2);
INSERT INTO `sys_role_menu` VALUES (51, 15, 22);
INSERT INTO `sys_role_menu` VALUES (52, 20, 12);
INSERT INTO `sys_role_menu` VALUES (53, 20, 13);
INSERT INTO `sys_role_menu` VALUES (54, 20, 27);
INSERT INTO `sys_role_menu` VALUES (55, 20, 14);
INSERT INTO `sys_role_menu` VALUES (56, 20, 20);
INSERT INTO `sys_role_menu` VALUES (57, 20, 28);
INSERT INTO `sys_role_menu` VALUES (58, 20, 16);
INSERT INTO `sys_role_menu` VALUES (59, 20, 17);
INSERT INTO `sys_role_menu` VALUES (60, 20, 29);
INSERT INTO `sys_role_menu` VALUES (61, 20, 18);
INSERT INTO `sys_role_menu` VALUES (62, 20, 19);
INSERT INTO `sys_role_menu` VALUES (63, 20, 30);
INSERT INTO `sys_role_menu` VALUES (64, 20, 31);
INSERT INTO `sys_role_menu` VALUES (65, 20, 32);
INSERT INTO `sys_role_menu` VALUES (66, 20, 33);

-- ----------------------------
-- Table structure for sys_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_setting`;
CREATE TABLE `sys_setting`  (
  `sys_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sys_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sys_sub_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简称',
  `sys_global_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '全局系统主键',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`sys_id`) USING BTREE,
  UNIQUE INDEX `sys_idx1_global`(`sys_global_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_setting
-- ----------------------------
INSERT INTO `sys_setting` VALUES (1, '统一用户管理平台', 'PT', 'vole-portal', 1, '2017-12-21 11:06:45', '2018-11-16 16:34:58');
INSERT INTO `sys_setting` VALUES (2, '抢购系统', 'QG', 'vole-qianggou', 0, '2018-11-16 12:45:04', NULL);
INSERT INTO `sys_setting` VALUES (3, '验证码中心', 'IDC', 'vole-identity', 0, '2018-11-16 12:47:03', NULL);
INSERT INTO `sys_setting` VALUES (4, '会员管理平台', 'MPS', 'vole-mps', 0, '2018-11-20 16:35:35', '2018-11-27 17:22:48');

-- ----------------------------
-- Table structure for sys_setting_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_setting_menu`;
CREATE TABLE `sys_setting_menu`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sys_id` int(20) NOT NULL COMMENT '系统主键',
  `menu_id` int(20) NOT NULL COMMENT '菜单主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_setting_menu
-- ----------------------------
INSERT INTO `sys_setting_menu` VALUES (1, 1, 1);
INSERT INTO `sys_setting_menu` VALUES (2, 1, 2);
INSERT INTO `sys_setting_menu` VALUES (3, 1, 4);
INSERT INTO `sys_setting_menu` VALUES (4, 1, 5);
INSERT INTO `sys_setting_menu` VALUES (5, 1, 6);
INSERT INTO `sys_setting_menu` VALUES (6, 1, 7);
INSERT INTO `sys_setting_menu` VALUES (7, 1, 8);
INSERT INTO `sys_setting_menu` VALUES (8, 1, 9);
INSERT INTO `sys_setting_menu` VALUES (9, 1, 10);
INSERT INTO `sys_setting_menu` VALUES (10, 1, 11);
INSERT INTO `sys_setting_menu` VALUES (15, 4, 12);
INSERT INTO `sys_setting_menu` VALUES (16, 4, 14);
INSERT INTO `sys_setting_menu` VALUES (17, 4, 16);
INSERT INTO `sys_setting_menu` VALUES (18, 4, 18);
INSERT INTO `sys_setting_menu` VALUES (19, 4, 31);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `loginname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登陆名',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简介',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `dept_id` int(20) NULL DEFAULT NULL COMMENT '部门主键',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '0-正常，1-删除',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_idx1_loginname`(`loginname`) USING BTREE,
  UNIQUE INDEX `user_idx3_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (5, 'qwop', '管理员', '{bcrypt}$2a$10$DPoi6hKJ/OiKuLnCzL1zWuHeGXaThdmlHLjC02ByEN7oILGE165rS', '18888888888', NULL, 1, 0, '2018-11-12 11:11:17', '2019-09-12 18:15:16');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_Id` int(20) NOT NULL COMMENT '用户主键',
  `role_Id` int(20) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (7, 5, 15);
INSERT INTO `sys_user_role` VALUES (8, 5, 16);
INSERT INTO `sys_user_role` VALUES (9, 5, 17);
INSERT INTO `sys_user_role` VALUES (10, 5, 18);
INSERT INTO `sys_user_role` VALUES (11, 5, 19);
INSERT INTO `sys_user_role` VALUES (12, 5, 20);

-- ----------------------------
-- Table structure for sys_zuul_route
-- ----------------------------
DROP TABLE IF EXISTS `sys_zuul_route`;
CREATE TABLE `sys_zuul_route`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'router Id',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '路由路径',
  `service_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '服务名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT 'url代理',
  `strip_prefix` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '转发去掉前缀',
  `retryable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否重试',
  `enabled` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '1' COMMENT '是否启用',
  `sensitiveHeaders_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '敏感请求头',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '动态路由配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_zuul_route
-- ----------------------------
INSERT INTO `sys_zuul_route` VALUES (3, '/demo/**', 'vole-demo', '', '1', '1', '1', '', '2018-05-17 14:09:06', '2018-12-03 15:15:59', '0');
INSERT INTO `sys_zuul_route` VALUES (4, '/mps/**', 'vole-mps', '', '1', '1', '1', '', '2018-05-21 11:40:38', '2018-12-03 15:16:16', '0');
INSERT INTO `sys_zuul_route` VALUES (5, '/auth/**', 'vole-auth', '', '1', '1', '1', '', '2018-05-21 11:41:08', '2018-10-29 21:25:46', '0');

-- ----------------------------
-- Table structure for zipkin_annotations
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_annotations`;
CREATE TABLE `zipkin_annotations`  (
  `trace_id_high` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
  `trace_id` bigint(20) NOT NULL COMMENT 'coincides with zipkin_spans.trace_id',
  `span_id` bigint(20) NOT NULL COMMENT 'coincides with zipkin_spans.id',
  `a_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'BinaryAnnotation.key or Annotation.value if type == -1',
  `a_value` blob NULL COMMENT 'BinaryAnnotation.value(), which must be smaller than 64KB',
  `a_type` int(11) NOT NULL COMMENT 'BinaryAnnotation.type() or -1 if Annotation',
  `a_timestamp` bigint(20) NULL DEFAULT NULL COMMENT 'Used to implement TTL; Annotation.timestamp or zipkin_spans.timestamp',
  `endpoint_ipv4` int(11) NULL DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  `endpoint_ipv6` binary(16) NULL DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null, or no IPv6 address',
  `endpoint_port` smallint(6) NULL DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  `endpoint_service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  UNIQUE INDEX `trace_id_high`(`trace_id_high`, `trace_id`, `span_id`, `a_key`, `a_timestamp`) USING BTREE COMMENT 'Ignore insert on duplicate',
  UNIQUE INDEX `trace_id_high_4`(`trace_id_high`, `trace_id`, `span_id`, `a_key`, `a_timestamp`) USING BTREE COMMENT 'Ignore insert on duplicate',
  INDEX `trace_id_high_2`(`trace_id_high`, `trace_id`, `span_id`) USING BTREE COMMENT 'for joining with zipkin_spans',
  INDEX `trace_id_high_3`(`trace_id_high`, `trace_id`) USING BTREE COMMENT 'for getTraces/ByIds',
  INDEX `endpoint_service_name`(`endpoint_service_name`) USING BTREE COMMENT 'for getTraces and getServiceNames',
  INDEX `a_type`(`a_type`) USING BTREE COMMENT 'for getTraces',
  INDEX `a_key`(`a_key`) USING BTREE COMMENT 'for getTraces',
  INDEX `trace_id`(`trace_id`, `span_id`, `a_key`) USING BTREE COMMENT 'for dependencies job',
  INDEX `trace_id_high_5`(`trace_id_high`, `trace_id`, `span_id`) USING BTREE COMMENT 'for joining with zipkin_spans',
  INDEX `trace_id_high_6`(`trace_id_high`, `trace_id`) USING BTREE COMMENT 'for getTraces/ByIds',
  INDEX `endpoint_service_name_2`(`endpoint_service_name`) USING BTREE COMMENT 'for getTraces and getServiceNames',
  INDEX `a_type_2`(`a_type`) USING BTREE COMMENT 'for getTraces',
  INDEX `a_key_2`(`a_key`) USING BTREE COMMENT 'for getTraces',
  INDEX `trace_id_2`(`trace_id`, `span_id`, `a_key`) USING BTREE COMMENT 'for dependencies job'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for zipkin_dependencies
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_dependencies`;
CREATE TABLE `zipkin_dependencies`  (
  `day` date NOT NULL,
  `parent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `child` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `call_count` bigint(20) NULL DEFAULT NULL,
  UNIQUE INDEX `day`(`day`, `parent`, `child`) USING BTREE,
  UNIQUE INDEX `day_2`(`day`, `parent`, `child`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compressed;

-- ----------------------------
-- Table structure for zipkin_spans
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_spans`;
CREATE TABLE `zipkin_spans`  (
  `trace_id_high` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
  `trace_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `debug` bit(1) NULL DEFAULT NULL,
  `start_ts` bigint(20) NULL DEFAULT NULL COMMENT 'Span.timestamp(): epoch micros used for endTs query and to implement TTL',
  `duration` bigint(20) NULL DEFAULT NULL COMMENT 'Span.duration(): micros used for minDuration and maxDuration query',
  UNIQUE INDEX `trace_id_high`(`trace_id_high`, `trace_id`, `id`) USING BTREE COMMENT 'ignore insert on duplicate',
  UNIQUE INDEX `trace_id_high_4`(`trace_id_high`, `trace_id`, `id`) USING BTREE COMMENT 'ignore insert on duplicate',
  INDEX `trace_id_high_2`(`trace_id_high`, `trace_id`, `id`) USING BTREE COMMENT 'for joining with zipkin_annotations',
  INDEX `trace_id_high_3`(`trace_id_high`, `trace_id`) USING BTREE COMMENT 'for getTracesByIds',
  INDEX `name`(`name`) USING BTREE COMMENT 'for getTraces and getSpanNames',
  INDEX `start_ts`(`start_ts`) USING BTREE COMMENT 'for getTraces ordering and range',
  INDEX `trace_id_high_5`(`trace_id_high`, `trace_id`, `id`) USING BTREE COMMENT 'for joining with zipkin_annotations',
  INDEX `trace_id_high_6`(`trace_id_high`, `trace_id`) USING BTREE COMMENT 'for getTracesByIds',
  INDEX `name_2`(`name`) USING BTREE COMMENT 'for getTraces and getSpanNames',
  INDEX `start_ts_2`(`start_ts`) USING BTREE COMMENT 'for getTraces ordering and range'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compressed;

SET FOREIGN_KEY_CHECKS = 1;
