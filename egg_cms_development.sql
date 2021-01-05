/*
 Navicat Premium Data Transfer

 Source Server         : cai
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : egg_cms_development

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 05/01/2021 14:19:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `deptId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL COMMENT '父Id',
  `deptName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `orderNum` int(11) NOT NULL COMMENT '显示顺序',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `isDelete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`deptId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (1, 0, '总部', 1, '0', '0', '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `departments` VALUES (2, 1, '技术部', 1, '0', '0', '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `departments` VALUES (3, 1, '测试', 2, '0', '0', '2021-01-04 17:18:43', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for dict_datas
-- ----------------------------
DROP TABLE IF EXISTS `dict_datas`;
CREATE TABLE `dict_datas`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dictSort` int(11) NOT NULL COMMENT '字典排序',
  `dictLabel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典标签',
  `dictValue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典键值',
  `dictType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型',
  `cssClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `listClass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `isDefault` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '是否默认（Y是 N否）',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict_datas
-- ----------------------------
INSERT INTO `dict_datas` VALUES (1, 1, '正常', '0', 'sys_show_hide', NULL, NULL, 'Y', '0', '正常', '2020-11-25 15:49:13', 'admin', '2021-01-05 11:26:25', 'admin');
INSERT INTO `dict_datas` VALUES (2, 2, '停用', '1', 'sys_show_hide', NULL, NULL, 'Y', '0', '停用', '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (3, 1, '正常', '0', 'sys_normal_disable', NULL, NULL, 'Y', '0', '正常', '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (4, 2, '停用', '1', 'sys_normal_disable', NULL, NULL, 'Y', '0', '停用', '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (5, 2, '男', '1', 'sys_user_sex', NULL, NULL, 'Y', '0', '男', '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (6, 1, '女', '0', 'sys_user_sex', NULL, NULL, 'Y', '0', '女', '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `dict_datas` VALUES (7, 1, '公告', '1', 'sys_notice_type', NULL, NULL, 'Y', '0', '公告', '2021-01-05 13:49:04', 'admin', '2021-01-05 13:50:24', 'admin');
INSERT INTO `dict_datas` VALUES (8, 2, '通知', '2', 'sys_notice_type', NULL, NULL, 'Y', '0', '通知', '2021-01-05 13:49:18', 'admin', '2021-01-05 13:51:49', 'admin');
INSERT INTO `dict_datas` VALUES (9, 1, '启用', '0', 'sys_notice_status', NULL, NULL, 'Y', '0', '启用', '2021-01-05 13:52:16', 'admin', '2021-01-05 14:03:56', 'admin');
INSERT INTO `dict_datas` VALUES (10, 2, '停用', '1', 'sys_notice_status', NULL, NULL, 'Y', '0', '停用', '2021-01-05 13:52:33', 'admin', '2021-01-05 14:04:00', 'admin');

-- ----------------------------
-- Table structure for dict_types
-- ----------------------------
DROP TABLE IF EXISTS `dict_types`;
CREATE TABLE `dict_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dictName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `dictType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典类型',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict_types
-- ----------------------------
INSERT INTO `dict_types` VALUES (1, '显示状态', 'sys_show_hide', '0', '显示状态', '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `dict_types` VALUES (2, '状态数据', 'sys_normal_disable', '0', '状态数据', '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `dict_types` VALUES (3, '性别', 'sys_user_sex', '0', '性别', '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `dict_types` VALUES (4, '公告类型', 'sys_notice_type', '0', '公告类型', '2021-01-05 13:47:27', 'admin', '2021-01-05 13:47:37', 'admin');
INSERT INTO `dict_types` VALUES (5, '公告状态', 'sys_notice_status', '0', '公告状态', '2021-01-05 13:48:00', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL COMMENT '父Id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `isFrame` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `menuType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'M' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单显示状态（0显示 1隐藏）',
  `orderNum` int(11) NOT NULL COMMENT '显示顺序',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '图标',
  `isDelete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 0, '首页', '/layout/home', 'Home', 'Home', '1', 'C', '0', 1, '0', '', 'nav-home', '0', NULL, '2020-11-25 15:49:13', 'admin', '2021-01-04 16:45:54', 'admin');
INSERT INTO `menus` VALUES (2, 0, '系统管理', '/system', 'Layout', 'Layout', '1', 'M', '0', 20, '0', '', 'system', '0', NULL, '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (3, 2, '用户中心', 'user', 'User', 'User', '1', 'C', '0', 1, '0', '', '#', '0', NULL, '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (4, 2, '角色管理', 'role', 'Role', 'Role', '1', 'C', '0', 2, '0', '', '#', '0', NULL, '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (5, 2, '菜单管理', 'menu', 'Menu', 'Menu', '1', 'C', '0', 3, '0', '', '#', '0', NULL, '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (6, 2, '部门管理', 'dept', 'Dept', 'Dept', '1', 'C', '0', 4, '0', '', '#', '0', NULL, '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (7, 2, '字典管理', 'dict', 'Dict', 'Dict', '1', 'C', '0', 6, '0', '', '#', '0', NULL, '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (8, 0, '文章管理', '/article', 'Layout', 'Layout', '1', 'M', '0', 10, '0', NULL, 'article', '0', NULL, '2021-01-04 15:52:39', 'admin', '2021-01-04 16:26:12', 'admin');
INSERT INTO `menus` VALUES (9, 8, '文章列表', 'articleList', 'ArticleList', 'ArticleList', '1', 'C', '0', 1, '0', NULL, '#', '0', NULL, '2021-01-04 16:09:36', 'admin', '2021-01-04 16:26:17', 'admin');
INSERT INTO `menus` VALUES (12, 8, '类型管理', 'articleType', 'ArticleType', 'ArticleType', '1', 'C', '0', 2, '0', NULL, '#', '0', NULL, '2021-01-04 16:43:50', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (13, 3, '查询', NULL, NULL, NULL, '1', 'F', '0', 1, '0', 'system:user:list', '#', '0', NULL, '2021-01-04 16:46:28', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (14, 3, '新增', NULL, NULL, NULL, '1', 'F', '0', 2, '0', 'system:user:add', '#', '0', NULL, '2021-01-04 16:47:31', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (15, 3, '修改', NULL, NULL, NULL, '1', 'F', '0', 3, '0', 'system:user:update', '#', '0', NULL, '2021-01-04 16:47:51', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (16, 3, '删除', NULL, NULL, NULL, '1', 'F', '0', 4, '0', 'system:user:delete', '#', '0', NULL, '2021-01-04 16:48:37', 'admin', '2021-01-04 16:49:35', 'admin');
INSERT INTO `menus` VALUES (17, 4, '查询', NULL, NULL, NULL, '1', 'F', '0', 1, '0', 'system:role:list', '#', '0', NULL, '2021-01-04 18:05:57', 'admin', '2021-01-04 18:06:15', 'admin');
INSERT INTO `menus` VALUES (18, 4, '新增', NULL, NULL, NULL, '1', 'F', '0', 2, '0', 'system:role:add', '#', '0', NULL, '2021-01-04 18:06:38', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (19, 4, '修改', NULL, NULL, NULL, '1', 'F', '0', 3, '0', 'system:role:update', '#', '0', NULL, '2021-01-04 18:07:04', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (20, 4, '删除', NULL, NULL, NULL, '1', 'F', '0', 4, '0', 'system:role:delete', '#', '0', NULL, '2021-01-04 18:07:21', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (21, 5, '查询', NULL, NULL, NULL, '1', 'F', '0', 1, '0', 'system:menu:list', '#', '0', NULL, '2021-01-04 18:08:20', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (22, 5, '新增', NULL, NULL, NULL, '1', 'F', '0', 2, '0', 'system:menu:add', '#', '0', NULL, '2021-01-04 18:08:37', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (23, 5, '修改', NULL, NULL, NULL, '1', 'F', '0', 3, '0', 'system:menu:update', '#', '0', NULL, '2021-01-04 18:08:55', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (24, 5, '删除', NULL, NULL, NULL, '1', 'F', '0', 4, '0', 'system:menu:delete', '#', '0', NULL, '2021-01-04 18:09:12', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (25, 6, '查询', NULL, NULL, NULL, '1', 'F', '0', 1, '0', 'system:dept:list', '#', '0', NULL, '2021-01-04 18:09:31', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (26, 6, '新增', NULL, NULL, NULL, '1', 'F', '0', 2, '0', 'system:dept:add', '#', '0', NULL, '2021-01-04 18:10:12', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (27, 6, '修改', NULL, NULL, NULL, '1', 'F', '0', 3, '0', 'system:dept:update', '#', '0', NULL, '2021-01-04 18:10:27', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (28, 6, '删除', NULL, NULL, NULL, '1', 'F', '0', 4, '0', 'system:dept:delete', '#', '0', NULL, '2021-01-04 18:10:42', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (29, 7, '查询字典类型', NULL, NULL, NULL, '1', 'F', '0', 1, '0', 'system:dictType:list', '#', '0', NULL, '2021-01-04 18:14:06', 'admin', '2021-01-04 18:14:35', 'admin');
INSERT INTO `menus` VALUES (30, 7, '新增字典类型', NULL, NULL, NULL, '1', 'F', '0', 2, '0', 'system:dictType:add', '#', '0', NULL, '2021-01-04 18:14:52', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (31, 7, '修改字典类型', NULL, NULL, NULL, '1', 'F', '0', 3, '0', 'system:dictType:update', '#', '0', NULL, '2021-01-04 18:15:34', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (32, 7, '删除字典类型', NULL, NULL, NULL, '1', 'F', '0', 4, '0', 'system:dictType:delete', '#', '0', NULL, '2021-01-04 18:15:49', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (33, 7, '查询字典数据', NULL, NULL, NULL, '1', 'F', '0', 5, '0', 'system:dictData:list', '#', '0', NULL, '2021-01-04 18:16:33', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (34, 7, '新增字典数据', NULL, NULL, NULL, '1', 'F', '0', 6, '0', 'system:dictData:add', '#', '0', NULL, '2021-01-04 18:16:52', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (35, 7, '修改字典数据', NULL, NULL, NULL, '1', 'F', '0', 7, '0', 'system:dictData:update', '#', '0', NULL, '2021-01-04 18:17:10', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (36, 7, '删除字典数据', NULL, NULL, NULL, '1', 'F', '0', 8, '0', 'system:dictData:delete', '#', '0', NULL, '2021-01-04 18:17:24', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (37, 2, '通知公告', 'notice', 'Notice', 'Notice', '1', 'C', '0', 10, '0', NULL, '#', '0', NULL, '2021-01-05 13:43:26', 'admin', '2021-01-05 14:05:47', 'admin');
INSERT INTO `menus` VALUES (38, 37, '查询', NULL, NULL, NULL, '1', 'F', '0', 1, '0', 'system:notice:list', '#', '0', NULL, '2021-01-05 14:06:12', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (39, 37, '新增', NULL, NULL, NULL, '1', 'F', '0', 2, '0', 'system:notice:add', '#', '0', NULL, '2021-01-05 14:06:51', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (40, 37, '修改', NULL, NULL, NULL, '1', 'F', '0', 3, '0', 'system:notice:update', '#', '0', NULL, '2021-01-05 14:07:10', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (41, 37, '删除', NULL, NULL, NULL, '1', 'F', '0', 4, '0', 'system:notice:delete', '#', '0', NULL, '2021-01-05 14:07:28', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noticeTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `noticeType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型',
  `noticeContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '公告类型（1通知 2公告）',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES (2, 'fdksljds', '2', '<p>发多少发多少</p>', '0', NULL, '2021-01-05 14:09:28', 'admin', NULL, NULL);
INSERT INTO `notices` VALUES (3, '发广告', '1', '<p>皇贵妃和贵妃</p>', '0', NULL, '2021-01-05 14:09:36', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for role_menus
-- ----------------------------
DROP TABLE IF EXISTS `role_menus`;
CREATE TABLE `role_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL COMMENT '角色roleId',
  `menuId` int(11) NOT NULL COMMENT '菜单menuId',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menus
-- ----------------------------
INSERT INTO `role_menus` VALUES (195, 7, 1);
INSERT INTO `role_menus` VALUES (196, 7, 3);
INSERT INTO `role_menus` VALUES (197, 7, 13);
INSERT INTO `role_menus` VALUES (198, 7, 14);
INSERT INTO `role_menus` VALUES (199, 7, 15);
INSERT INTO `role_menus` VALUES (200, 7, 16);
INSERT INTO `role_menus` VALUES (201, 7, 4);
INSERT INTO `role_menus` VALUES (202, 7, 17);
INSERT INTO `role_menus` VALUES (203, 7, 18);
INSERT INTO `role_menus` VALUES (204, 7, 19);
INSERT INTO `role_menus` VALUES (205, 7, 20);
INSERT INTO `role_menus` VALUES (206, 7, 21);
INSERT INTO `role_menus` VALUES (207, 7, 6);
INSERT INTO `role_menus` VALUES (208, 7, 25);
INSERT INTO `role_menus` VALUES (209, 7, 26);
INSERT INTO `role_menus` VALUES (210, 7, 27);
INSERT INTO `role_menus` VALUES (211, 7, 28);
INSERT INTO `role_menus` VALUES (212, 7, 29);
INSERT INTO `role_menus` VALUES (213, 7, 33);
INSERT INTO `role_menus` VALUES (214, 7, 2);
INSERT INTO `role_menus` VALUES (215, 7, 5);
INSERT INTO `role_menus` VALUES (216, 7, 7);
INSERT INTO `role_menus` VALUES (217, 1, 1);
INSERT INTO `role_menus` VALUES (218, 1, 8);
INSERT INTO `role_menus` VALUES (219, 1, 9);
INSERT INTO `role_menus` VALUES (220, 1, 12);
INSERT INTO `role_menus` VALUES (221, 1, 2);
INSERT INTO `role_menus` VALUES (222, 1, 3);
INSERT INTO `role_menus` VALUES (223, 1, 13);
INSERT INTO `role_menus` VALUES (224, 1, 14);
INSERT INTO `role_menus` VALUES (225, 1, 15);
INSERT INTO `role_menus` VALUES (226, 1, 16);
INSERT INTO `role_menus` VALUES (227, 1, 4);
INSERT INTO `role_menus` VALUES (228, 1, 17);
INSERT INTO `role_menus` VALUES (229, 1, 18);
INSERT INTO `role_menus` VALUES (230, 1, 19);
INSERT INTO `role_menus` VALUES (231, 1, 20);
INSERT INTO `role_menus` VALUES (232, 1, 5);
INSERT INTO `role_menus` VALUES (233, 1, 21);
INSERT INTO `role_menus` VALUES (234, 1, 22);
INSERT INTO `role_menus` VALUES (235, 1, 23);
INSERT INTO `role_menus` VALUES (236, 1, 24);
INSERT INTO `role_menus` VALUES (237, 1, 6);
INSERT INTO `role_menus` VALUES (238, 1, 25);
INSERT INTO `role_menus` VALUES (239, 1, 26);
INSERT INTO `role_menus` VALUES (240, 1, 27);
INSERT INTO `role_menus` VALUES (241, 1, 28);
INSERT INTO `role_menus` VALUES (242, 1, 7);
INSERT INTO `role_menus` VALUES (243, 1, 29);
INSERT INTO `role_menus` VALUES (244, 1, 30);
INSERT INTO `role_menus` VALUES (245, 1, 31);
INSERT INTO `role_menus` VALUES (246, 1, 32);
INSERT INTO `role_menus` VALUES (247, 1, 33);
INSERT INTO `role_menus` VALUES (248, 1, 34);
INSERT INTO `role_menus` VALUES (249, 1, 35);
INSERT INTO `role_menus` VALUES (250, 1, 36);
INSERT INTO `role_menus` VALUES (251, 1, 37);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `roleKey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `roleSort` int(11) NOT NULL COMMENT '显示顺序',
  `dataScope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：本部门及以下数据权限 2：本部门数据权限 3：仅本人权限）',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '角色状态（0正常 1停用）',
  `isDelete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', NULL, '2020-11-25 15:49:13', 'admin', '2021-01-05 13:43:50', 'admin');
INSERT INTO `roles` VALUES (7, 'ces', 'ces', 2, '1', '0', '0', NULL, '2021-01-04 17:16:55', 'admin', '2021-01-05 10:29:57', 'admin');

-- ----------------------------
-- Table structure for sequelizemeta
-- ----------------------------
DROP TABLE IF EXISTS `sequelizemeta`;
CREATE TABLE `sequelizemeta`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sequelizemeta
-- ----------------------------
INSERT INTO `sequelizemeta` VALUES ('20200831061523-create-notices.js');
INSERT INTO `sequelizemeta` VALUES ('20200831061523-create-roles.js');
INSERT INTO `sequelizemeta` VALUES ('20200831061618-create-departments.js');
INSERT INTO `sequelizemeta` VALUES ('20200831061653-create-menus.js');
INSERT INTO `sequelizemeta` VALUES ('20200831061739-create-dict-data.js');
INSERT INTO `sequelizemeta` VALUES ('20200831061747-create-dict-type.js');
INSERT INTO `sequelizemeta` VALUES ('20200831061953-create-role-menu.js');
INSERT INTO `sequelizemeta` VALUES ('20200831062016-create-user-role.js');
INSERT INTO `sequelizemeta` VALUES ('20201113071642-init-users.js');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `roleId` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (3, 2, 7);
INSERT INTO `user_roles` VALUES (5, 1, 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptId` int(11) NOT NULL COMMENT '部门deptId',
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `nickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '性别（0代表女 1代表男）',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `isDelete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `userName`(`userName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, 'admin', 'admin', '0', '$2a$10$DASIjFwPy4yRRcPnWtx0/OT.t9M6ZF8zt963vnPgDdhiCtjEuSqee', '/public/uploads/YLW_1607507275266_6511.jpg_wh860.jpg', '1670341607@qq.com', '13711031120', '0', '0', '', '2020-11-25 15:49:13', 'admin', '2021-01-05 11:28:12', 'admin');
INSERT INTO `users` VALUES (2, 3, 'ces', 'ces', '1', '$2a$10$lt7XTMXeAXfyh02xk3VJ9.x.fcK5s6uoPXVOLKUpV/ns6YoHNHguy', NULL, NULL, NULL, '0', '0', NULL, '2021-01-04 17:19:53', 'admin', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
