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

 Date: 06/01/2021 15:22:06
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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (1, 0, '总部', 1, '1', '0', '2020-11-25 15:49:13', 'admin', NULL, NULL);
INSERT INTO `departments` VALUES (2, 1, '技术部', 1, '1', '0', '2020-11-25 15:49:13', 'admin', NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict_datas
-- ----------------------------
INSERT INTO `dict_datas` VALUES (1, 1, '正常', '1', 'sys_show_hide', NULL, NULL, 'Y', '1', '正常', '2020-11-25 15:49:13', 'admin', '2021-01-05 15:07:27', 'admin');
INSERT INTO `dict_datas` VALUES (2, 2, '停用', '0', 'sys_show_hide', NULL, NULL, 'Y', '1', '停用', '2020-11-25 15:49:13', 'admin', '2021-01-05 15:07:29', 'admin');
INSERT INTO `dict_datas` VALUES (3, 1, '正常', '1', 'sys_normal_disable', NULL, NULL, 'Y', '1', '正常', '2020-11-25 15:49:13', 'admin', '2021-01-05 15:07:36', 'admin');
INSERT INTO `dict_datas` VALUES (4, 2, '停用', '0', 'sys_normal_disable', NULL, NULL, 'Y', '1', '停用', '2020-11-25 15:49:13', 'admin', '2021-01-05 15:07:39', 'admin');
INSERT INTO `dict_datas` VALUES (5, 2, '男', '1', 'sys_user_sex', NULL, NULL, 'Y', '1', '男', '2020-11-25 15:49:13', 'admin', '2021-01-05 15:07:46', 'admin');
INSERT INTO `dict_datas` VALUES (6, 1, '女', '0', 'sys_user_sex', NULL, NULL, 'Y', '1', '女', '2020-11-25 15:49:13', 'admin', '2021-01-05 15:07:44', 'admin');
INSERT INTO `dict_datas` VALUES (7, 1, '公告', '1', 'sys_notice_type', NULL, NULL, 'Y', '1', '公告', '2021-01-05 13:49:04', 'admin', '2021-01-05 15:07:17', 'admin');
INSERT INTO `dict_datas` VALUES (8, 2, '通知', '2', 'sys_notice_type', NULL, NULL, 'Y', '1', '通知', '2021-01-05 13:49:18', 'admin', '2021-01-05 15:07:20', 'admin');
INSERT INTO `dict_datas` VALUES (13, 1, '审核通过', '1', 'sys_article_status', NULL, NULL, 'Y', '1', '审核通过', '2021-01-05 14:41:47', 'admin', '2021-01-05 15:06:57', 'admin');
INSERT INTO `dict_datas` VALUES (14, 2, '待审核', '2', 'sys_article_status', NULL, NULL, 'Y', '1', '待审核', '2021-01-05 14:42:18', 'admin', '2021-01-05 15:07:00', 'admin');
INSERT INTO `dict_datas` VALUES (15, 3, '审核不通过', '3', 'sys_article_status', NULL, NULL, 'Y', '1', '审核不通过', '2021-01-05 14:42:44', 'admin', '2021-01-05 15:07:03', 'admin');
INSERT INTO `dict_datas` VALUES (16, 1, '启用', '1', 'sys_notice_status', NULL, NULL, 'Y', '1', '启用', '2021-01-05 14:43:51', 'admin', '2021-01-05 15:07:09', 'admin');
INSERT INTO `dict_datas` VALUES (17, 2, '停用', '2', 'sys_notice_status', NULL, NULL, 'Y', '1', '停用', '2021-01-05 14:44:07', 'admin', '2021-01-05 15:07:12', 'admin');

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict_types
-- ----------------------------
INSERT INTO `dict_types` VALUES (1, '显示状态', 'sys_show_hide', '1', '显示状态', '2020-11-25 15:49:13', 'admin', '2021-01-05 15:06:44', 'admin');
INSERT INTO `dict_types` VALUES (2, '状态数据', 'sys_normal_disable', '1', '状态数据', '2020-11-25 15:49:13', 'admin', '2021-01-05 15:06:47', 'admin');
INSERT INTO `dict_types` VALUES (3, '性别', 'sys_user_sex', '1', '性别', '2020-11-25 15:49:13', 'admin', '2021-01-05 15:06:49', 'admin');
INSERT INTO `dict_types` VALUES (4, '公告类型', 'sys_notice_type', '1', '公告类型', '2021-01-05 13:47:27', 'admin', '2021-01-05 15:06:41', 'admin');
INSERT INTO `dict_types` VALUES (5, '公告状态', 'sys_notice_status', '1', '公告状态', '2021-01-05 13:48:00', 'admin', '2021-01-05 15:06:37', 'admin');
INSERT INTO `dict_types` VALUES (8, '文章状态', 'sys_article_status', '1', '文章状态', '2021-01-05 14:40:58', 'admin', '2021-01-05 15:06:34', 'admin');

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
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 0, '首页', '/layout/home', 'Home', 'Home', '1', 'C', '1', 1, '1', '', 'nav-home', '0', NULL, '2020-11-25 15:49:13', 'admin', '2021-01-05 16:09:57', 'admin');
INSERT INTO `menus` VALUES (2, 0, '系统管理', '/system', 'Layout', 'Layout', '1', 'M', '1', 20, '1', '', 'system', '0', NULL, '2020-11-25 15:49:13', 'admin', '2021-01-05 15:08:36', 'admin');
INSERT INTO `menus` VALUES (3, 2, '用户中心', 'user', 'User', 'User', '1', 'C', '1', 1, '1', '', '#', '0', NULL, '2020-11-25 15:49:13', 'admin', '2021-01-05 15:10:51', 'admin');
INSERT INTO `menus` VALUES (4, 2, '角色管理', 'role', 'Role', 'Role', '1', 'C', '1', 2, '1', '', '#', '0', NULL, '2020-11-25 15:49:13', 'admin', '2021-01-05 15:11:01', 'admin');
INSERT INTO `menus` VALUES (5, 2, '菜单管理', 'menu', 'Menu', 'Menu', '1', 'C', '1', 3, '1', '', '#', '0', NULL, '2020-11-25 15:49:13', 'admin', '2021-01-05 15:10:57', 'admin');
INSERT INTO `menus` VALUES (6, 2, '部门管理', 'dept', 'Dept', 'Dept', '1', 'C', '1', 4, '1', '', '#', '0', NULL, '2020-11-25 15:49:13', 'admin', '2021-01-05 15:11:06', 'admin');
INSERT INTO `menus` VALUES (7, 2, '字典管理', 'dict', 'Dict', 'Dict', '1', 'C', '1', 6, '1', '', '#', '0', NULL, '2020-11-25 15:49:13', 'admin', '2021-01-05 15:11:11', 'admin');
INSERT INTO `menus` VALUES (8, 0, '博客管理', '/article', 'Layout', 'Layout', '1', 'M', '1', 10, '1', NULL, 'article', '0', NULL, '2021-01-04 15:52:39', 'admin', '2021-01-06 14:57:16', 'admin');
INSERT INTO `menus` VALUES (9, 8, '文章列表', 'articleList', 'ArticleList', 'ArticleList', '1', 'C', '1', 1, '1', NULL, '#', '0', NULL, '2021-01-04 16:09:36', 'admin', '2021-01-05 15:10:38', 'admin');
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
INSERT INTO `menus` VALUES (37, 2, '通知公告', 'notice', 'Notice', 'Notice', '1', 'C', '1', 10, '1', NULL, '#', '0', NULL, '2021-01-05 13:43:26', 'admin', '2021-01-05 15:11:15', 'admin');
INSERT INTO `menus` VALUES (38, 37, '查询', NULL, NULL, NULL, '1', 'F', '0', 1, '0', 'system:notice:list', '#', '0', NULL, '2021-01-05 14:06:12', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (39, 37, '新增', NULL, NULL, NULL, '1', 'F', '0', 2, '0', 'system:notice:add', '#', '0', NULL, '2021-01-05 14:06:51', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (40, 37, '修改', NULL, NULL, NULL, '1', 'F', '0', 3, '0', 'system:notice:update', '#', '0', NULL, '2021-01-05 14:07:10', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (41, 37, '删除', NULL, NULL, NULL, '1', 'F', '0', 4, '0', 'system:notice:delete', '#', '0', NULL, '2021-01-05 14:07:28', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (42, 8, '文章类型', 'articleType', 'ArticleType', 'ArticleType', '1', 'C', '1', 3, '1', NULL, '#', '0', NULL, '2021-01-06 15:05:31', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noticeTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `noticeType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `noticeContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '公告内容',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1停用）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_menus
-- ----------------------------
DROP TABLE IF EXISTS `role_menus`;
CREATE TABLE `role_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL COMMENT '角色roleId',
  `menuId` int(11) NOT NULL COMMENT '菜单menuId',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 352 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menus
-- ----------------------------
INSERT INTO `role_menus` VALUES (291, 7, 1);
INSERT INTO `role_menus` VALUES (292, 7, 3);
INSERT INTO `role_menus` VALUES (293, 7, 13);
INSERT INTO `role_menus` VALUES (294, 7, 14);
INSERT INTO `role_menus` VALUES (295, 7, 15);
INSERT INTO `role_menus` VALUES (296, 7, 16);
INSERT INTO `role_menus` VALUES (297, 7, 4);
INSERT INTO `role_menus` VALUES (298, 7, 17);
INSERT INTO `role_menus` VALUES (299, 7, 18);
INSERT INTO `role_menus` VALUES (300, 7, 19);
INSERT INTO `role_menus` VALUES (301, 7, 20);
INSERT INTO `role_menus` VALUES (302, 7, 21);
INSERT INTO `role_menus` VALUES (303, 7, 6);
INSERT INTO `role_menus` VALUES (304, 7, 25);
INSERT INTO `role_menus` VALUES (305, 7, 26);
INSERT INTO `role_menus` VALUES (306, 7, 27);
INSERT INTO `role_menus` VALUES (307, 7, 28);
INSERT INTO `role_menus` VALUES (308, 7, 29);
INSERT INTO `role_menus` VALUES (309, 7, 33);
INSERT INTO `role_menus` VALUES (310, 7, 2);
INSERT INTO `role_menus` VALUES (311, 7, 5);
INSERT INTO `role_menus` VALUES (312, 7, 7);
INSERT INTO `role_menus` VALUES (313, 1, 1);
INSERT INTO `role_menus` VALUES (314, 1, 8);
INSERT INTO `role_menus` VALUES (315, 1, 9);
INSERT INTO `role_menus` VALUES (316, 1, 42);
INSERT INTO `role_menus` VALUES (317, 1, 2);
INSERT INTO `role_menus` VALUES (318, 1, 3);
INSERT INTO `role_menus` VALUES (319, 1, 13);
INSERT INTO `role_menus` VALUES (320, 1, 14);
INSERT INTO `role_menus` VALUES (321, 1, 15);
INSERT INTO `role_menus` VALUES (322, 1, 16);
INSERT INTO `role_menus` VALUES (323, 1, 4);
INSERT INTO `role_menus` VALUES (324, 1, 17);
INSERT INTO `role_menus` VALUES (325, 1, 18);
INSERT INTO `role_menus` VALUES (326, 1, 19);
INSERT INTO `role_menus` VALUES (327, 1, 20);
INSERT INTO `role_menus` VALUES (328, 1, 5);
INSERT INTO `role_menus` VALUES (329, 1, 21);
INSERT INTO `role_menus` VALUES (330, 1, 22);
INSERT INTO `role_menus` VALUES (331, 1, 23);
INSERT INTO `role_menus` VALUES (332, 1, 24);
INSERT INTO `role_menus` VALUES (333, 1, 6);
INSERT INTO `role_menus` VALUES (334, 1, 25);
INSERT INTO `role_menus` VALUES (335, 1, 26);
INSERT INTO `role_menus` VALUES (336, 1, 27);
INSERT INTO `role_menus` VALUES (337, 1, 28);
INSERT INTO `role_menus` VALUES (338, 1, 7);
INSERT INTO `role_menus` VALUES (339, 1, 29);
INSERT INTO `role_menus` VALUES (340, 1, 30);
INSERT INTO `role_menus` VALUES (341, 1, 31);
INSERT INTO `role_menus` VALUES (342, 1, 32);
INSERT INTO `role_menus` VALUES (343, 1, 33);
INSERT INTO `role_menus` VALUES (344, 1, 34);
INSERT INTO `role_menus` VALUES (345, 1, 35);
INSERT INTO `role_menus` VALUES (346, 1, 36);
INSERT INTO `role_menus` VALUES (347, 1, 37);
INSERT INTO `role_menus` VALUES (348, 1, 38);
INSERT INTO `role_menus` VALUES (349, 1, 39);
INSERT INTO `role_menus` VALUES (350, 1, 40);
INSERT INTO `role_menus` VALUES (351, 1, 41);

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
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '超级管理员', 'admin', 1, '1', '1', '0', NULL, '2020-11-25 15:49:13', 'admin', '2021-01-06 15:06:49', 'admin');
INSERT INTO `roles` VALUES (7, 'ces', 'ces', 2, '1', '1', '0', NULL, '2021-01-04 17:16:55', 'admin', '2021-01-05 15:50:49', 'admin');

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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (14, 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, 'admin', 'admin', '0', '$2a$10$DASIjFwPy4yRRcPnWtx0/OT.t9M6ZF8zt963vnPgDdhiCtjEuSqee', '/public/uploads/YLW_1607507275266_6511.jpg_wh860.jpg', '1670341607@qq.com', '13711031120', '0', '1', '', '2020-11-25 15:49:13', 'admin', '2021-01-05 15:50:04', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
