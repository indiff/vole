-- 创建数据库
DROP database IF EXISTS `portal`;
create database `portal` default character set utf8mb4 collate utf8mb4_general_ci;
-- 切换到 portal 数据库
use portal;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '架构部', 'qwop', '2019-09-11 10:33:45', '2019-09-11 10:33:45');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '菜单管理', 0, NULL, 'fa-folder', 1, 1, '01', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (2, '菜单列表', 1, '/admin/menu/list/1', 'fa-file', 1, 2, '0101', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (4, '部门管理', 0, NULL, 'fa-folder', 1, 1, '02', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (5, '部门列表', 4, '/admin/dept/list/1', 'fa-file', 1, 2, '0201', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (6, '角色管理', 0, NULL, 'fa-folder', 1, 1, '03', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (7, '角色列表', 6, '/admin/role/list/1', 'fa-file', 1, 2, '0301', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (8, '系统信息管理', 0, NULL, 'fa-folder', 1, 1, '04', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (9, '系统信息列表', 8, '/admin/setting/list/1', 'fa-file', 1, 2, '0401', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (10, '用户管理', 0, NULL, 'fa-folder', 1, 1, '05', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (11, '用户列表', 10, '/admin/user/list/1', 'fa-file', 1, 2, '0501', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (12, '监测管理', 0, NULL, 'fa-folder', 1, 1, '06', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (13, '监测用户列表', 12, '/mps/member/list/1', 'fa-file', 1, 2, '0601', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (14, '监测角色管理', 0, NULL, 'fa-folder', 1, 1, '07', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (16, '监测权限管理', 0, NULL, 'fa-folder', 1, 1, '08', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (17, '监测权限列表', 16, '/mps/permission/list/1', 'fa-file', 1, 2, '0801', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (18, '监测客户端管理', 0, NULL, 'fa-folder', 1, 1, '09', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (19, '监测客户端列表', 18, '/mps/client/list/1', 'fa-file', 1, 2, '0901', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:36');
INSERT INTO `sys_menu` VALUES (20, '监测角色列表', 14, '/mps/role/list/1', 'fa-file', 1, 2, '0701', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:37');
INSERT INTO `sys_menu` VALUES (22, '菜单所有权限', 2, NULL, NULL, 1, 3, '010101', '/admin/menu/**', 0, '2019-09-15 16:56:29', '2019-09-15 16:56:37');
INSERT INTO `sys_menu` VALUES (23, '部门所有权限', 5, NULL, NULL, 1, 3, '020101', '/admin/dept/**', 0, '2019-09-15 16:56:29', '2019-09-15 16:56:37');
INSERT INTO `sys_menu` VALUES (24, '角色所有权限', 7, NULL, NULL, 1, 3, '030101', '/admin/role/**', 0, '2019-09-15 16:56:29', '2019-09-15 16:56:37');
INSERT INTO `sys_menu` VALUES (25, '系统管理所有权限', 9, NULL, NULL, 1, 3, '040101', '/admin/setting/**', 0, '2019-09-15 16:56:29', '2019-09-15 16:56:37');
INSERT INTO `sys_menu` VALUES (26, '用户管理所有权限', 11, NULL, NULL, 1, 3, '050101', '/admin/user/**', 0, '2019-09-15 16:56:29', '2019-09-15 16:56:37');
INSERT INTO `sys_menu` VALUES (27, '监测管理所有权限', 13, NULL, NULL, 1, 3, '060101', '/mps/member/**', 0, '2019-09-15 16:56:29', '2019-09-15 16:56:37');
INSERT INTO `sys_menu` VALUES (28, '监测角色管理所有权限', 20, NULL, NULL, 1, 3, '070101', '/mps/role/**', 0, '2019-09-15 16:56:29', '2019-09-15 16:56:37');
INSERT INTO `sys_menu` VALUES (29, '监测权限管理所有权限', 17, NULL, NULL, 1, 3, '080101', '/mps/permission/**', 0, '2019-09-15 16:56:29', '2019-09-15 16:56:37');
INSERT INTO `sys_menu` VALUES (30, '监测客户端管理所有权限', 19, NULL, NULL, 1, 3, '090101', '/mps/client/**', 0, '2019-09-15 16:56:29', '2019-09-15 16:56:37');
INSERT INTO `sys_menu` VALUES (31, '路由管理', 0, NULL, 'fa-folder', 1, 1, '10', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:37');
INSERT INTO `sys_menu` VALUES (32, '路由列表', 31, '/mps/route/list/1', 'fa-file', 1, 2, '1001', NULL, 0, '2019-09-15 16:56:29', '2019-09-15 16:56:37');
INSERT INTO `sys_menu` VALUES (33, '路由管理所有权限', 32, NULL, NULL, 1, 3, '100101', '/mps/route/**', 0, '2019-09-15 16:56:29', '2019-09-15 16:56:37');

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (15, '菜单管理', 'MENU_ADMIN', '菜单管理所有权限', 0, '2019-09-11 20:41:53', '2019-09-11 16:27:25');
INSERT INTO `sys_role` VALUES (16, '部门管理', 'DEPT_ADMIN', '部门管理所有权限', 0, '2019-09-11 16:26:26', NULL);
INSERT INTO `sys_role` VALUES (17, '角色管理', 'ROLE_ADMIN', '角色管理所有权限', 0, '2019-09-11 16:27:13', NULL);
INSERT INTO `sys_role` VALUES (18, '用户管理', 'USER_ADMIN', '用户管理所有权限', 0, '2019-09-11 16:28:00', NULL);
INSERT INTO `sys_role` VALUES (19, '系统管理', 'SYS_ADMIN', '系统信息管理所有权限', 0, '2019-09-11 16:28:41', NULL);
INSERT INTO `sys_role` VALUES (20, '监测系统管理', 'MPS_ADMIN', '监测系统管理所有权限', 0, '2019-09-11 17:11:58', '2019-09-15 16:57:03');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(20) NOT NULL COMMENT '角色主键',
  `menu_id` int(20) NOT NULL COMMENT '菜单主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_setting
-- ----------------------------
INSERT INTO `sys_setting` VALUES (1, '统一用户管理平台', 'PT', 'app-portal', 1, '2019-09-11 11:06:45', '2019-09-15 16:53:43');
INSERT INTO `sys_setting` VALUES (2, '测试系统1', 'TS1', 'app-ts1', 0, '2019-09-11 12:45:04', '2019-09-15 16:54:13');
INSERT INTO `sys_setting` VALUES (3, '验证码中心', 'IDC', 'app-identity', 0, '2019-09-11 12:47:03', '2019-09-15 16:54:21');
INSERT INTO `sys_setting` VALUES (4, '监控平台', 'MPS', 'app-mps', 0, '2019-09-11 16:35:35', '2019-09-15 16:54:40');

-- ----------------------------
-- Table structure for sys_setting_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_setting_menu`;
CREATE TABLE `sys_setting_menu`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sys_id` int(20) NOT NULL COMMENT '系统主键',
  `menu_id` int(20) NOT NULL COMMENT '菜单主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单关联表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (5, 'qwop', '系统管理员', '{bcrypt}$2a$10$DPoi6hKJ/OiKuLnCzL1zWuHeGXaThdmlHLjC02ByEN7oILGE165rS', '18888888888', NULL, 1, 0, '2019-09-11 11:11:17', NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_Id` int(20) NOT NULL COMMENT '用户主键',
  `role_Id` int(20) NOT NULL COMMENT '角色主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (7, 5, 15);
INSERT INTO `sys_user_role` VALUES (8, 5, 16);
INSERT INTO `sys_user_role` VALUES (9, 5, 17);
INSERT INTO `sys_user_role` VALUES (10, 5, 18);
INSERT INTO `sys_user_role` VALUES (11, 5, 19);
INSERT INTO `sys_user_role` VALUES (12, 5, 20);

SET FOREIGN_KEY_CHECKS = 1;
