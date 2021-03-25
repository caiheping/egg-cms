/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 127.0.0.1:3306
 Source Schema         : egg_cms_development

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 25/03/2021 10:38:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article_types
-- ----------------------------
DROP TABLE IF EXISTS `article_types`;
CREATE TABLE `article_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orderNum` int(11) NOT NULL COMMENT '显示排序',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_types
-- ----------------------------
INSERT INTO `article_types` VALUES (2, 1, 'linux', 'linux', 1, 'centos', '2021-01-22 15:38:00', 'admin', '2021-01-22 16:52:38', 'admin');
INSERT INTO `article_types` VALUES (3, 1, 'javascript', 'javascript', 2, 'javascript', '2021-01-22 16:52:31', 'admin', NULL, NULL);
INSERT INTO `article_types` VALUES (4, 1, 'react native', 'reactNative', 3, 'react native', '2021-01-23 09:33:16', 'admin', '2021-02-26 10:30:47', 'admin');
INSERT INTO `article_types` VALUES (6, 2, 'test', 'test', 1, NULL, '2021-03-02 11:11:41', 'test', NULL, NULL);

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `subTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '副标题',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `hot` int(11) NULL DEFAULT 0 COMMENT '热度',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES (2, 1, 'docker安装好mysql', 'docker安装好mysql，Navicat连接报2059错误，解决方法', 'linux', 0, '# docker安装好mysql，Navicat连接报2059错误，解决方法\n\ndocker成功安装了mysql，也正常启动了。\n\n启动命名如下：\n\n> docker run -itd --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql\n\n用docker ps -a 也可以查到容器中mysql也在运行中，\n\n但是在本地用Navicat登录的时候，发现报错了。报错信息\n\n连接Docker启动的mysql出现：**ERROR 2059 (HY000): Authentication plugin \'caching_sha2_password\' cannot be loaded**\n\n解决方案：\n1.进入mysql容器\n\n> docker exec -it mysql /bin/bash\n\n2.进入mysql\n\n> mysql -uroot -p\n\n3.修改密码\n\n> ALTER USER \'root\'@\'%\' IDENTIFIED WITH mysql_native_password BY \'123456\';\n\n修改好了之后，再用Navicat登录就可以了。', '2021-01-22 15:39:16', 'admin', '2021-01-23 11:29:48', 'admin');
INSERT INTO `articles` VALUES (3, 1, 'centos安装配置', 'centos安装配置', 'linux', 0, '# centos安装配置\n\n## 安装docker\n\n**设置仓库**\n\n安装所需的软件包。yum-utils 提供了 yum-config-manager ，并且 device mapper 存储驱动程序需要 device-mapper-persistent-data 和 lvm2。\n\n> sudo yum install -y yum-utils \\\n> device-mapper-persistent-data \\\n> lvm2\n\n使用以下命令来设置稳定的仓库。(清华大学源)\n\n> sudo yum-config-manager \\\n>     --add-repo \\\n>     http:**//**mirrors.aliyun.com**/**docker-ce**/**linux**/**centos**/**docker-ce.repo\n\n安装最新版本的 Docker Engine-Community 和 containerd，或者转到下一步安装特定版本：\n\n> sudo yum install docker-ce docker-ce-cli containerd.io\n\n#### 启动 Docker。\n\n> sudo systemctl start docker\n\n#### 开机自启动docker\n\n> su root   #切换用户\n>\n> systemctl enable docker   #开机自启动docker\n>\n> systemctl start docker   #启动docker\n>\n> systemctl restart docker  #重启docker\n\n### Ubuntu16.04+、Debian8+、CentOS7\n\n对于使用 systemd 的系统，请在 /etc/docker/daemon.conf中写入如下内容（如果文件不存在请新建该文件）：\n\n> {\"registry-mirrors\":[\"https://reg-mirror.qiniu.com/\"]}\n\n之后重新启动服务：\n\n> sudo systemctl daemon-reload\n>\n> sudo systemctl restart docker\n\n## Docker Compose 安装\n\n运行以下命令以下载 Docker Compose 的当前稳定版本：\n\n> sudo curl -L \"https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose\n\n要安装其他版本的 Compose，请替换 1.24.1。\n\n将可执行权限应用于二进制文件：\n\n> sudo chmod +x /usr/local/bin/docker-compose\n\n创建软链：\n\n> sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose\n\n测试是否安装成功：\n\n> docker-compose --version\n\n## Docker 安装 MySQL\n\nhttps://www.runoob.com/docker/docker-install-mysql.html\n\n\n\n', '2021-01-22 16:20:09', 'admin', '2021-01-23 11:29:24', 'admin');
INSERT INTO `articles` VALUES (4, 1, '安装DOClever', '安装DOClever', 'linux', 0, '# 安装DOClever\n\n> mkdir DOClever\n>\n> cd DOClever\n>\n> vim docker-compose.yml\n\ndocker-compose.yml配置：\n\n```\nversion: \"2\"\nservices:\n  DOClever:\n    image: lw96/doclever\n    restart: always\n    container_name: \"DOClever\"\n    ports:\n    - 10000:10000\n    volumes:\n    - ./file:/root/DOClever/data/file\n    - ./img:/root/DOClever/data/img\n    - ./tmp:/root/DOClever/data/tmp\n    environment:\n    - DB_HOST=mongodb://mongo:27017/DOClever\n    - PORT=10000\n    links:\n    - mongo:mongo\n\n  mongo:\n    image: mongo:latest\n    restart: always\n    container_name: \"mongodb\"\n    volumes:\n    - /my/own/datadir:/data/db\n```\n\n启动容器\n\n> docker-compose up -d\n\n访问\n\nhttp://你的ip:10000/\n\n管理员账号：\n\n> DOClever: DOClerve\n\n```\n- /my/own/datadir:/data/db\n```', '2021-01-23 11:30:04', 'admin', NULL, NULL);
INSERT INTO `articles` VALUES (5, 1, 'centos 安装node', 'centos 安装node', 'linux', 0, '# centos 安装node\n\n```\n// 下载node v14.12.0包，放到/var/local下\ncd /var/local\n// 解压\ntar -xvf node-v14.12.0-linux-x64.tar.xz\n// 进入/usr/local目录\ncd /usr/local/\n// 后面的.表示移动到当前目录\nmv /var/local/node-v14.12.0-linux-x64 .\n// 重命名\nmv node-v14.12.0-linux-x64/ nodejs\n\n// 让npm和node命令全局生效 - 软链接方式\nln -s /usr/local/nodejs/bin/npm /usr/local/bin/\nln -s /usr/local/nodejs/bin/node /usr/local/bin/\n\n// 查看\nnode -v\nnpm -v\n```\n\n', '2021-01-23 11:30:24', 'admin', '2021-02-26 10:28:14', 'admin');
INSERT INTO `articles` VALUES (6, 1, '在docker 运行node项目', '在docker 运行node项目', 'javascript', 0, '# 在docker 运行node项目\n\n拉取node镜像\n\n```bash\n# 最新版\ndocker pull node:latest\n# 固定版\ndocker pull node:12.13.0\n```\n\n运行镜像并复制当前路径项目到容器/home/www里面\n\n```bash\ndocker run -itd -p 7001:7001 --name node node:12.13.0 && docker cp . node:/home/www/\n```\n\n进入容器\n\n```bash\ndocker exec -it node bash\n// 进入项目\ncd /home/www/cms-api\nnpm install\n// 安装配置其他环境之后，如mysql，redis\nnpm run dev\n```\n\n', '2021-01-23 11:30:45', 'admin', NULL, NULL);
INSERT INTO `articles` VALUES (7, 1, 'React Native搭配夜神模拟器调试(windows)', 'React Native搭配夜神模拟器调试(windows)', 'reactNative', 0, '# React Native搭配夜神模拟器调试(windows)\n\n### React Native 搭配夜神模拟器进行调试 (windows)\n\n在学习 **React Native** 的过程中，我选择使用了夜神模拟器进行项目调试，接下来就来记录一下在使用模拟器之前的一些准备工作。\n\n首先你得先确保以下几个东西你都安装完成并且环境变量配置完成：\n\n1. Java 8\n2. Python 2.x\n3. node\n4. Android Studio\n5. adb\n\n接下去，win + R 打开命令行，进入到你的夜神安装目录bin文件夹，例如我的安装目录是 **D:\\Program Files\\Nox**，那我就输入如下指令\n\n```command\ncd D:\\Program Files\\Nox\\bin\n```\n\n进入到该目录后， 查询夜神模拟器的端口号，输入以下指令\n\n```command\nnox_adb devices\n```\n\n按回车，得到结果：\n![img](https://img-blog.csdnimg.cn/20190716144132960.jpg)\n红框中就是夜神模拟器的运行端口号，之后我们将adb与模拟器连接在一起\n\n进入android安装目录下的 Sdk\\platform-tools文件夹，默认应该在 **C:\\Users\\你的用户名\\AppData\\Local\\Android\\Sdk\\platform-tools** （此路径根据你自己的android安装路径）\n\n```command\ncd D:\\Android\\SDK\\platform-tools\nadb.exe connect 127.0.0.1:62001\n```\n\n出现 *successfully* 字样代表链接成功\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20190716145355647.jpg)\n接下去，你就可以执行 **react-native run-android** 在模拟器上进行调试了。', '2021-02-26 10:31:12', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `deptId` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) NOT NULL COMMENT '父Id',
  `deptName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `orderNum` int(11) NOT NULL COMMENT '显示顺序',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '部门状态（1正常 0停用）',
  `isDelete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`deptId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (1, 0, '总部', 1, '1', '0', '2021-01-08 12:04:02', 'admin', NULL, NULL);
INSERT INTO `departments` VALUES (2, 1, '测试部门', 1, '1', '0', '2021-01-08 12:04:02', 'admin', NULL, NULL);
INSERT INTO `departments` VALUES (5, 2, '测试一部', 2, '1', '0', '2021-02-02 17:41:01', 'test', NULL, NULL);

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
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '菜单状态（1正常 0停用）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '菜单状态（1正常 2停用）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict_types
-- ----------------------------
INSERT INTO `dict_types` VALUES (1, '显示状态', 'sys_show_hide', '1', '显示状态', '2020-11-25 15:49:13', 'admin', '2021-01-05 15:06:44', 'admin');
INSERT INTO `dict_types` VALUES (2, '状态数据', 'sys_normal_disable', '1', '状态数据', '2020-11-25 15:49:13', 'admin', '2021-01-05 15:06:47', 'admin');
INSERT INTO `dict_types` VALUES (3, '性别', 'sys_user_sex', '1', '性别', '2020-11-25 15:49:13', 'admin', '2021-01-05 15:06:49', 'admin');
INSERT INTO `dict_types` VALUES (4, '公告类型', 'sys_notice_type', '1', '公告类型', '2021-01-05 13:47:27', 'admin', '2021-01-05 15:06:41', 'admin');
INSERT INTO `dict_types` VALUES (5, '公告状态', 'sys_notice_status', '1', '公告状态', '2021-01-05 13:48:00', 'admin', '2021-01-05 15:06:37', 'admin');

-- ----------------------------
-- Table structure for friendly_links
-- ----------------------------
DROP TABLE IF EXISTS `friendly_links`;
CREATE TABLE `friendly_links`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT '用户id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of friendly_links
-- ----------------------------
INSERT INTO `friendly_links` VALUES (3, 1, 'baidu', 'https://www.baidu.com/?tn=78000241_22_hao_pg', 'baidu', '2021-01-23 13:35:18', 'admin', '2021-01-23 14:08:40', 'admin');

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
  `isFrame` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否为外链（1是 0否）',
  `menuType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'M' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '菜单显示状态（1显示 0隐藏）',
  `orderNum` int(11) NOT NULL COMMENT '显示顺序',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '菜单状态（1正常 0停用）',
  `perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '图标',
  `isDelete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `menus` VALUES (9, 8, '文章列表', 'articleList', 'ArticleList', 'ArticleList', '1', 'C', '1', 2, '1', NULL, '#', '0', NULL, '2021-01-04 16:09:36', 'admin', '2021-01-25 14:07:08', 'admin');
INSERT INTO `menus` VALUES (13, 3, '查询', NULL, NULL, NULL, '1', 'F', '0', 1, '1', 'system:user:list', '#', '0', NULL, '2021-01-04 16:46:28', 'admin', '2021-01-23 09:58:27', 'admin');
INSERT INTO `menus` VALUES (14, 3, '新增', NULL, NULL, NULL, '1', 'F', '0', 2, '1', 'system:user:add', '#', '0', NULL, '2021-01-04 16:47:31', 'admin', '2021-01-23 09:58:36', 'admin');
INSERT INTO `menus` VALUES (15, 3, '修改', NULL, NULL, NULL, '1', 'F', '0', 3, '1', 'system:user:update', '#', '0', NULL, '2021-01-04 16:47:51', 'admin', '2021-01-23 09:58:40', 'admin');
INSERT INTO `menus` VALUES (16, 3, '删除', NULL, NULL, NULL, '1', 'F', '0', 4, '1', 'system:user:delete', '#', '0', NULL, '2021-01-04 16:48:37', 'admin', '2021-01-23 09:58:48', 'admin');
INSERT INTO `menus` VALUES (17, 4, '查询', NULL, NULL, NULL, '1', 'F', '0', 1, '1', 'system:role:list', '#', '0', NULL, '2021-01-04 18:05:57', 'admin', '2021-01-23 09:58:54', 'admin');
INSERT INTO `menus` VALUES (18, 4, '新增', NULL, NULL, NULL, '1', 'F', '0', 2, '1', 'system:role:add', '#', '0', NULL, '2021-01-04 18:06:38', 'admin', '2021-01-23 09:58:58', 'admin');
INSERT INTO `menus` VALUES (19, 4, '修改', NULL, NULL, NULL, '1', 'F', '0', 3, '1', 'system:role:update', '#', '0', NULL, '2021-01-04 18:07:04', 'admin', '2021-01-23 09:59:01', 'admin');
INSERT INTO `menus` VALUES (20, 4, '删除', NULL, NULL, NULL, '1', 'F', '0', 4, '1', 'system:role:delete', '#', '0', NULL, '2021-01-04 18:07:21', 'admin', '2021-01-23 09:59:05', 'admin');
INSERT INTO `menus` VALUES (21, 5, '查询', NULL, NULL, NULL, '1', 'F', '0', 1, '1', 'system:menu:list', '#', '0', NULL, '2021-01-04 18:08:20', 'admin', '2021-01-23 09:59:30', 'admin');
INSERT INTO `menus` VALUES (22, 5, '新增', NULL, NULL, NULL, '1', 'F', '0', 2, '1', 'system:menu:add', '#', '0', NULL, '2021-01-04 18:08:37', 'admin', '2021-01-23 09:59:33', 'admin');
INSERT INTO `menus` VALUES (23, 5, '修改', NULL, NULL, NULL, '1', 'F', '0', 3, '1', 'system:menu:update', '#', '0', NULL, '2021-01-04 18:08:55', 'admin', '2021-01-23 09:59:37', 'admin');
INSERT INTO `menus` VALUES (24, 5, '删除', NULL, NULL, NULL, '1', 'F', '0', 4, '1', 'system:menu:delete', '#', '0', NULL, '2021-01-04 18:09:12', 'admin', '2021-01-23 09:59:40', 'admin');
INSERT INTO `menus` VALUES (25, 6, '查询', NULL, NULL, NULL, '1', 'F', '0', 1, '1', 'system:department:list', '#', '0', NULL, '2021-01-04 18:09:31', 'admin', '2021-02-02 14:19:13', 'admin');
INSERT INTO `menus` VALUES (26, 6, '新增', NULL, NULL, NULL, '1', 'F', '0', 2, '1', 'system:department:add', '#', '0', NULL, '2021-01-04 18:10:12', 'admin', '2021-02-02 14:19:20', 'admin');
INSERT INTO `menus` VALUES (27, 6, '修改', NULL, NULL, NULL, '1', 'F', '0', 3, '1', 'system:department:update', '#', '0', NULL, '2021-01-04 18:10:27', 'admin', '2021-02-02 14:19:28', 'admin');
INSERT INTO `menus` VALUES (28, 6, '删除', NULL, NULL, NULL, '1', 'F', '0', 4, '1', 'system:department:delete', '#', '0', NULL, '2021-01-04 18:10:42', 'admin', '2021-02-02 14:19:33', 'admin');
INSERT INTO `menus` VALUES (29, 7, '查询字典类型', NULL, NULL, NULL, '1', 'F', '0', 1, '1', 'system:dictType:list', '#', '0', NULL, '2021-01-04 18:14:06', 'admin', '2021-01-23 10:00:04', 'admin');
INSERT INTO `menus` VALUES (30, 7, '新增字典类型', NULL, NULL, NULL, '1', 'F', '0', 2, '1', 'system:dictType:add', '#', '0', NULL, '2021-01-04 18:14:52', 'admin', '2021-01-23 10:00:07', 'admin');
INSERT INTO `menus` VALUES (31, 7, '修改字典类型', NULL, NULL, NULL, '1', 'F', '0', 3, '1', 'system:dictType:update', '#', '0', NULL, '2021-01-04 18:15:34', 'admin', '2021-01-23 10:00:11', 'admin');
INSERT INTO `menus` VALUES (32, 7, '删除字典类型', NULL, NULL, NULL, '1', 'F', '0', 4, '1', 'system:dictType:delete', '#', '0', NULL, '2021-01-04 18:15:49', 'admin', '2021-01-23 10:00:14', 'admin');
INSERT INTO `menus` VALUES (33, 7, '查询字典数据', NULL, NULL, NULL, '1', 'F', '0', 5, '1', 'system:dictData:list', '#', '0', NULL, '2021-01-04 18:16:33', 'admin', '2021-01-23 10:00:20', 'admin');
INSERT INTO `menus` VALUES (34, 7, '新增字典数据', NULL, NULL, NULL, '1', 'F', '0', 6, '1', 'system:dictData:add', '#', '0', NULL, '2021-01-04 18:16:52', 'admin', '2021-01-23 10:00:24', 'admin');
INSERT INTO `menus` VALUES (35, 7, '修改字典数据', NULL, NULL, NULL, '1', 'F', '0', 7, '1', 'system:dictData:update', '#', '0', NULL, '2021-01-04 18:17:10', 'admin', '2021-01-23 10:00:27', 'admin');
INSERT INTO `menus` VALUES (36, 7, '删除字典数据', NULL, NULL, NULL, '1', 'F', '0', 8, '1', 'system:dictData:delete', '#', '0', NULL, '2021-01-04 18:17:24', 'admin', '2021-01-23 10:00:34', 'admin');
INSERT INTO `menus` VALUES (37, 2, '通知公告', 'notice', 'Notice', 'Notice', '1', 'C', '1', 10, '1', NULL, '#', '0', NULL, '2021-01-05 13:43:26', 'admin', '2021-01-05 15:11:15', 'admin');
INSERT INTO `menus` VALUES (38, 37, '查询', NULL, NULL, NULL, '1', 'F', '0', 1, '1', 'system:notice:list', '#', '0', NULL, '2021-01-05 14:06:12', 'admin', '2021-01-23 10:00:40', 'admin');
INSERT INTO `menus` VALUES (39, 37, '新增', NULL, NULL, NULL, '1', 'F', '0', 2, '1', 'system:notice:add', '#', '0', NULL, '2021-01-05 14:06:51', 'admin', '2021-01-23 10:00:43', 'admin');
INSERT INTO `menus` VALUES (40, 37, '修改', NULL, NULL, NULL, '1', 'F', '0', 3, '1', 'system:notice:update', '#', '0', NULL, '2021-01-05 14:07:10', 'admin', '2021-01-23 10:00:47', 'admin');
INSERT INTO `menus` VALUES (41, 37, '删除', NULL, NULL, NULL, '1', 'F', '0', 4, '1', 'system:notice:delete', '#', '0', NULL, '2021-01-05 14:07:28', 'admin', '2021-01-23 10:00:51', 'admin');
INSERT INTO `menus` VALUES (42, 8, '文章类型', 'articleType', 'ArticleType', 'ArticleType', '1', 'C', '1', 3, '1', NULL, '#', '0', NULL, '2021-01-06 15:05:31', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (43, 9, '新增', NULL, NULL, NULL, '1', 'F', '1', 2, '1', 'blog:article:add', '#', '0', NULL, '2021-01-23 10:04:07', 'test', '2021-01-23 10:08:56', 'test');
INSERT INTO `menus` VALUES (44, 9, '修改', NULL, NULL, NULL, '1', 'F', '1', 3, '1', 'blog:article:update', '#', '0', NULL, '2021-01-23 10:07:04', 'test', '2021-01-23 10:09:03', 'test');
INSERT INTO `menus` VALUES (45, 9, '查询', NULL, NULL, NULL, '1', 'F', '1', 1, '1', 'blog:article:list', '#', '0', NULL, '2021-01-23 10:07:34', 'test', '2021-01-23 10:08:50', 'test');
INSERT INTO `menus` VALUES (46, 9, '删除', NULL, NULL, NULL, '1', 'F', '1', 4, '1', 'blog:article:delete', '#', '0', NULL, '2021-01-23 10:08:13', 'test', '2021-01-23 10:09:11', 'test');
INSERT INTO `menus` VALUES (47, 42, '查询', NULL, NULL, NULL, '1', 'F', '1', 1, '1', 'blog:articleType:list', '#', '0', NULL, '2021-01-23 10:09:33', 'test', NULL, NULL);
INSERT INTO `menus` VALUES (48, 42, '新增', NULL, NULL, NULL, '1', 'F', '1', 2, '1', 'blog:articleType:add', '#', '0', NULL, '2021-01-23 10:09:46', 'test', NULL, NULL);
INSERT INTO `menus` VALUES (49, 42, '修改', NULL, NULL, NULL, '1', 'F', '1', 3, '1', 'blog:articleType:update', '#', '0', NULL, '2021-01-23 10:10:00', 'test', NULL, NULL);
INSERT INTO `menus` VALUES (50, 42, '删除', NULL, NULL, NULL, '1', 'F', '1', 4, '1', 'blog:articleType:delete', '#', '0', NULL, '2021-01-23 10:10:16', 'test', NULL, NULL);
INSERT INTO `menus` VALUES (51, 8, '友情链接', 'friendlyLink', 'FriendlyLink', 'FriendlyLink', '1', 'C', '1', 10, '1', NULL, '#', '0', NULL, '2021-01-23 10:21:00', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (53, 3, '状态显示', NULL, NULL, NULL, '1', 'F', '1', 10, '1', 'system:user:showStatus', '#', '0', NULL, '2021-01-29 14:02:59', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (54, 4, '状态显示', NULL, NULL, NULL, '1', 'F', '1', 10, '1', 'system:role:showStatus', '#', '0', NULL, '2021-01-29 14:03:47', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (55, 3, '修改头像', NULL, NULL, NULL, '1', 'F', '1', 11, '1', 'system:user:updateUserImg', '#', '0', NULL, '2021-02-02 14:53:56', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (56, 3, '重置密码', NULL, NULL, NULL, '1', 'F', '1', 12, '1', 'system:user:resetPwd', '#', '0', NULL, '2021-02-02 14:54:23', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (57, 3, '修改密码', NULL, NULL, NULL, '1', 'F', '1', 13, '1', 'system:user:updateUserPwd', '#', '0', NULL, '2021-02-02 14:54:55', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (58, 3, '修改角色状态', NULL, NULL, NULL, '1', 'F', '1', 14, '1', 'system:role:changeRoleStatus', '#', '0', NULL, '2021-02-02 14:55:27', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (59, 51, '查询', NULL, NULL, NULL, '1', 'F', '1', 1, '1', 'blog:friendlyLink:list', '#', '0', NULL, '2021-02-02 17:47:55', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (60, 51, '新增', NULL, NULL, NULL, '1', 'F', '1', 2, '1', 'blog:friendlyLink:add', '#', '0', NULL, '2021-02-02 17:48:12', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (61, 51, '修改', NULL, NULL, NULL, '1', 'F', '1', 3, '1', 'blog:friendlyLink:update', '#', '0', NULL, '2021-02-02 17:48:26', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (62, 51, '删除', NULL, NULL, NULL, '1', 'F', '1', 4, '1', 'blog:friendlyLink:delete', '#', '0', NULL, '2021-02-02 17:48:39', 'admin', NULL, NULL);
INSERT INTO `menus` VALUES (63, 42, '查询全部类型', NULL, NULL, NULL, '1', 'F', '1', 5, '1', 'blog:articleType:getAllType', '#', '0', NULL, '2021-03-02 11:18:10', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for notices
-- ----------------------------
DROP TABLE IF EXISTS `notices`;
CREATE TABLE `notices`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `noticeTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `noticeType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '公告类型（1通知 2公告）',
  `noticeContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '公告状态（1正常 0停用）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notices
-- ----------------------------
INSERT INTO `notices` VALUES (3, '公告', '1', '只是一个公告', '1', NULL, '2021-01-29 14:49:56', 'admin', NULL, NULL);

-- ----------------------------
-- Table structure for role_menus
-- ----------------------------
DROP TABLE IF EXISTS `role_menus`;
CREATE TABLE `role_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL COMMENT '角色roleId',
  `menuId` int(11) NOT NULL COMMENT '菜单menuId',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1765 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menus
-- ----------------------------
INSERT INTO `role_menus` VALUES (1546, 1, 1);
INSERT INTO `role_menus` VALUES (1547, 1, 8);
INSERT INTO `role_menus` VALUES (1548, 1, 9);
INSERT INTO `role_menus` VALUES (1549, 1, 45);
INSERT INTO `role_menus` VALUES (1550, 1, 43);
INSERT INTO `role_menus` VALUES (1551, 1, 44);
INSERT INTO `role_menus` VALUES (1552, 1, 46);
INSERT INTO `role_menus` VALUES (1553, 1, 42);
INSERT INTO `role_menus` VALUES (1554, 1, 47);
INSERT INTO `role_menus` VALUES (1555, 1, 48);
INSERT INTO `role_menus` VALUES (1556, 1, 49);
INSERT INTO `role_menus` VALUES (1557, 1, 50);
INSERT INTO `role_menus` VALUES (1558, 1, 51);
INSERT INTO `role_menus` VALUES (1559, 1, 59);
INSERT INTO `role_menus` VALUES (1560, 1, 60);
INSERT INTO `role_menus` VALUES (1561, 1, 61);
INSERT INTO `role_menus` VALUES (1562, 1, 62);
INSERT INTO `role_menus` VALUES (1563, 1, 2);
INSERT INTO `role_menus` VALUES (1564, 1, 3);
INSERT INTO `role_menus` VALUES (1565, 1, 13);
INSERT INTO `role_menus` VALUES (1566, 1, 14);
INSERT INTO `role_menus` VALUES (1567, 1, 15);
INSERT INTO `role_menus` VALUES (1568, 1, 16);
INSERT INTO `role_menus` VALUES (1569, 1, 53);
INSERT INTO `role_menus` VALUES (1570, 1, 55);
INSERT INTO `role_menus` VALUES (1571, 1, 56);
INSERT INTO `role_menus` VALUES (1572, 1, 57);
INSERT INTO `role_menus` VALUES (1573, 1, 58);
INSERT INTO `role_menus` VALUES (1574, 1, 4);
INSERT INTO `role_menus` VALUES (1575, 1, 17);
INSERT INTO `role_menus` VALUES (1576, 1, 18);
INSERT INTO `role_menus` VALUES (1577, 1, 19);
INSERT INTO `role_menus` VALUES (1578, 1, 20);
INSERT INTO `role_menus` VALUES (1579, 1, 54);
INSERT INTO `role_menus` VALUES (1580, 1, 5);
INSERT INTO `role_menus` VALUES (1581, 1, 21);
INSERT INTO `role_menus` VALUES (1582, 1, 22);
INSERT INTO `role_menus` VALUES (1583, 1, 23);
INSERT INTO `role_menus` VALUES (1584, 1, 24);
INSERT INTO `role_menus` VALUES (1585, 1, 6);
INSERT INTO `role_menus` VALUES (1586, 1, 25);
INSERT INTO `role_menus` VALUES (1587, 1, 26);
INSERT INTO `role_menus` VALUES (1588, 1, 27);
INSERT INTO `role_menus` VALUES (1589, 1, 28);
INSERT INTO `role_menus` VALUES (1590, 1, 7);
INSERT INTO `role_menus` VALUES (1591, 1, 29);
INSERT INTO `role_menus` VALUES (1592, 1, 30);
INSERT INTO `role_menus` VALUES (1593, 1, 31);
INSERT INTO `role_menus` VALUES (1594, 1, 32);
INSERT INTO `role_menus` VALUES (1595, 1, 33);
INSERT INTO `role_menus` VALUES (1596, 1, 34);
INSERT INTO `role_menus` VALUES (1597, 1, 35);
INSERT INTO `role_menus` VALUES (1598, 1, 36);
INSERT INTO `role_menus` VALUES (1599, 1, 37);
INSERT INTO `role_menus` VALUES (1600, 1, 38);
INSERT INTO `role_menus` VALUES (1601, 1, 39);
INSERT INTO `role_menus` VALUES (1602, 1, 40);
INSERT INTO `role_menus` VALUES (1603, 1, 41);
INSERT INTO `role_menus` VALUES (1650, 4, 1);
INSERT INTO `role_menus` VALUES (1651, 4, 8);
INSERT INTO `role_menus` VALUES (1652, 4, 9);
INSERT INTO `role_menus` VALUES (1653, 4, 45);
INSERT INTO `role_menus` VALUES (1654, 4, 43);
INSERT INTO `role_menus` VALUES (1655, 4, 44);
INSERT INTO `role_menus` VALUES (1656, 4, 46);
INSERT INTO `role_menus` VALUES (1657, 4, 42);
INSERT INTO `role_menus` VALUES (1658, 4, 47);
INSERT INTO `role_menus` VALUES (1659, 4, 48);
INSERT INTO `role_menus` VALUES (1660, 4, 49);
INSERT INTO `role_menus` VALUES (1661, 4, 50);
INSERT INTO `role_menus` VALUES (1662, 4, 51);
INSERT INTO `role_menus` VALUES (1663, 4, 59);
INSERT INTO `role_menus` VALUES (1664, 4, 60);
INSERT INTO `role_menus` VALUES (1665, 4, 61);
INSERT INTO `role_menus` VALUES (1666, 4, 62);
INSERT INTO `role_menus` VALUES (1667, 4, 3);
INSERT INTO `role_menus` VALUES (1668, 4, 13);
INSERT INTO `role_menus` VALUES (1669, 4, 14);
INSERT INTO `role_menus` VALUES (1670, 4, 15);
INSERT INTO `role_menus` VALUES (1671, 4, 16);
INSERT INTO `role_menus` VALUES (1672, 4, 53);
INSERT INTO `role_menus` VALUES (1673, 4, 55);
INSERT INTO `role_menus` VALUES (1674, 4, 56);
INSERT INTO `role_menus` VALUES (1675, 4, 57);
INSERT INTO `role_menus` VALUES (1676, 4, 58);
INSERT INTO `role_menus` VALUES (1677, 4, 4);
INSERT INTO `role_menus` VALUES (1678, 4, 17);
INSERT INTO `role_menus` VALUES (1679, 4, 18);
INSERT INTO `role_menus` VALUES (1680, 4, 19);
INSERT INTO `role_menus` VALUES (1681, 4, 20);
INSERT INTO `role_menus` VALUES (1682, 4, 54);
INSERT INTO `role_menus` VALUES (1683, 4, 21);
INSERT INTO `role_menus` VALUES (1684, 4, 6);
INSERT INTO `role_menus` VALUES (1685, 4, 25);
INSERT INTO `role_menus` VALUES (1686, 4, 26);
INSERT INTO `role_menus` VALUES (1687, 4, 27);
INSERT INTO `role_menus` VALUES (1688, 4, 28);
INSERT INTO `role_menus` VALUES (1689, 4, 37);
INSERT INTO `role_menus` VALUES (1690, 4, 38);
INSERT INTO `role_menus` VALUES (1691, 4, 39);
INSERT INTO `role_menus` VALUES (1692, 4, 40);
INSERT INTO `role_menus` VALUES (1693, 4, 41);
INSERT INTO `role_menus` VALUES (1694, 4, 2);
INSERT INTO `role_menus` VALUES (1695, 4, 5);
INSERT INTO `role_menus` VALUES (1730, 2, 1);
INSERT INTO `role_menus` VALUES (1731, 2, 8);
INSERT INTO `role_menus` VALUES (1732, 2, 9);
INSERT INTO `role_menus` VALUES (1733, 2, 45);
INSERT INTO `role_menus` VALUES (1734, 2, 43);
INSERT INTO `role_menus` VALUES (1735, 2, 44);
INSERT INTO `role_menus` VALUES (1736, 2, 46);
INSERT INTO `role_menus` VALUES (1737, 2, 42);
INSERT INTO `role_menus` VALUES (1738, 2, 47);
INSERT INTO `role_menus` VALUES (1739, 2, 48);
INSERT INTO `role_menus` VALUES (1740, 2, 49);
INSERT INTO `role_menus` VALUES (1741, 2, 50);
INSERT INTO `role_menus` VALUES (1742, 2, 63);
INSERT INTO `role_menus` VALUES (1743, 2, 51);
INSERT INTO `role_menus` VALUES (1744, 2, 59);
INSERT INTO `role_menus` VALUES (1745, 2, 60);
INSERT INTO `role_menus` VALUES (1746, 2, 61);
INSERT INTO `role_menus` VALUES (1747, 2, 62);
INSERT INTO `role_menus` VALUES (1748, 2, 13);
INSERT INTO `role_menus` VALUES (1749, 2, 53);
INSERT INTO `role_menus` VALUES (1750, 2, 55);
INSERT INTO `role_menus` VALUES (1751, 2, 17);
INSERT INTO `role_menus` VALUES (1752, 2, 54);
INSERT INTO `role_menus` VALUES (1753, 2, 21);
INSERT INTO `role_menus` VALUES (1754, 2, 25);
INSERT INTO `role_menus` VALUES (1755, 2, 29);
INSERT INTO `role_menus` VALUES (1756, 2, 33);
INSERT INTO `role_menus` VALUES (1757, 2, 38);
INSERT INTO `role_menus` VALUES (1758, 2, 2);
INSERT INTO `role_menus` VALUES (1759, 2, 3);
INSERT INTO `role_menus` VALUES (1760, 2, 4);
INSERT INTO `role_menus` VALUES (1761, 2, 5);
INSERT INTO `role_menus` VALUES (1762, 2, 6);
INSERT INTO `role_menus` VALUES (1763, 2, 7);
INSERT INTO `role_menus` VALUES (1764, 2, 37);

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
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '角色状态（1正常 0停用）',
  `isDelete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createdAt` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `createdBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updatedAt` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `updatedBy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '超级管理员', 'admin', 1, '1', '1', '0', NULL, '2021-01-08 12:04:02', 'admin', '2021-02-02 17:50:52', 'admin');
INSERT INTO `roles` VALUES (2, '测试', 'test', 2, '1', '1', '0', NULL, '2021-01-23 09:40:29', 'admin', '2021-03-02 11:18:25', 'admin');
INSERT INTO `roles` VALUES (4, 'gfdgf', 'fgfd', 2, '1', '1', '0', 'gfdg', '2021-02-02 17:26:32', 'test', '2021-02-02 17:51:01', 'admin');

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
INSERT INTO `sequelizemeta` VALUES ('20200831061523-create-article-type.js');
INSERT INTO `sequelizemeta` VALUES ('20200831061523-create-articles.js');
INSERT INTO `sequelizemeta` VALUES ('20200831061523-create-friendlyLink.js');
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
INSERT INTO `user_roles` VALUES (1, 1, 1);
INSERT INTO `user_roles` VALUES (18, 2, 2);

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
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '帐号状态（1正常 0停用）',
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
INSERT INTO `users` VALUES (1, 1, 'admin', 'admin', '1', '$2a$10$DASIjFwPy4yRRcPnWtx0/OT.t9M6ZF8zt963vnPgDdhiCtjEuSqee', NULL, NULL, NULL, '0', '1', '', '2021-01-08 12:04:02', 'admin', NULL, NULL);
INSERT INTO `users` VALUES (2, 2, 'test', 'test', '0', '$2a$10$eV0xA14rp33w5Ai0HEzn..7eG6GY7Bq9iFvRRqVivZ50CVYXUMXXK', '/uploads/2/CHP_1612249060086_16f194d7b8580d2950c33ab2c9e549d2.jpg', NULL, NULL, '0', '1', NULL, '2021-01-23 09:36:27', 'admin', '2021-02-02 17:10:14', 'test');

SET FOREIGN_KEY_CHECKS = 1;
