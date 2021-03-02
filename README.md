# cms-api

## 描述

cms-api 为前后端分离的博客管理系统。

## 技术栈

后端技术栈：egg.js + mysql + sequelize + jwt 等

前端技术栈：vue全家桶 + axios + elementUI + markdown编辑器等

前端项目地址：https://github.com/caiheping/vue-cms

### 环境

node版本8以上

MySQL数据库

### 项目运行

```bash
git clone https://github.com/caiheping/egg-cms.git
cd egg-cms
npm install
```

然后修改config/config.default.js和database/config.json（这个改不改都行）下自己的数据库用户名和密码

创建数据库egg_cms_development

在egg_cms_development数据库下导入项目根目录下egg_cms_development.sql文件

运行项目

> npm run dev

浏览器打开 http://127.0.0.1:7001/web/index.html

admin登录账号：admin，密码： 123456
普通用户账号密码自己用admin去用户管理创建

### 项目功能
- [x] 登录 -- 完成
- [x] 首页 -- 去我的博客
- [x] 文章列表 -- 增删改查
- [x] 文章类型 -- 增删改查
- [x] 用户中心 -- 增删改查
- [x] 角色管理 -- 增删改查
- [x] 菜单管理 -- 增删改查
- [x] 部门管理 -- 增删改查
- [x] 通知公告 -- 增删改查
- [x] 头像上传 -- 完成
- [x] 我的博客前端界面（知道地址后无需登录就可以进入）



### 目录结构

```bash
cms-api
├─ app
|	├─ controller			// 用于解析用户的输入，处理后返回相应的结果
|	├─ extend				// 用于框架的扩展
|	├─ middleware			// 用于编写中间件
|	├─ model				// 用于放置领域模型
|	├─ public				// 用于放置静态资源
|	├─ rules				// 参数校验文件
|	├─ schedule				// 用于定时任务，可选，具体参见定时任务
|	├─ service				// 用于编写业务逻辑层，可选，建议使用
|	├─ utils				// 工具文件
|	├─ router.js				// 用于配置 URL 路由规则
├─ config
|	├─ config.default.js	// 用于编写配置文件
|	├─ plugin.js			// 用于配置需要加载的插件
├─ database
|	├─ migrations			// 数据库迁移文件
|	├─ seeders				// 种子文件
|	├─ config.json				// sequelize 配置文件
├─ logs						// 日志文件
├─ run
├─ test
├─ typings
├─ www						// 前端打包文件
...
```

演示地址：http://blog.caihp.top/ （自己服务器只开发部分功能，想要查看全部功能，请copy代码在自己的电脑上看）

用户名： test

密码：123456

## 界面截图

**登录页**

![](http://cdn.caihp.top/egg-cms/other/login.png)

**首页**

![home](http://cdn.caihp.top/egg-cms/other/home.png)



**博客管理 > 文章列表**

![article-list](http://cdn.caihp.top/egg-cms/other/article-list.png)

**博客管理 > 文章类型**

![article-type](http://cdn.caihp.top/egg-cms/other/article-type.png)



**博客管理 > 友情链接**

![friendly-link](http://cdn.caihp.top/egg-cms/other/friendly-link.png)



**系统管理 > 用户管理**

![userManagement](http://cdn.caihp.top/egg-cms/other/userManagement.png)



**系统管理 > 角色管理**

![roleManagement](http://cdn.caihp.top/egg-cms/other/roleManagement.png)



**系统管理 > 菜单管理**

![menuManagement](http://cdn.caihp.top/egg-cms/other/menuManagement.png)



**系统管理 > 部门管理**

![deptManagement](http://cdn.caihp.top/egg-cms/other/deptManagement.png)



**系统管理 > 字典管理**

![dictManagement](http://cdn.caihp.top/egg-cms/other/dictManagement.png)



**系统管理 > 通知公告**

![noticeManagement](http://cdn.caihp.top/egg-cms/other/noticeManagement.png)



**我的博客 > 首页**

![web-home](http://cdn.caihp.top/egg-cms/other/web-home.png)



**我的博客 > 文章详情**

![web-article-detail](http://cdn.caihp.top/egg-cms/other/web-article-detail.png)



如果对您有帮助，您可以点右上角 "Star" 支持一下 谢谢！ ^_^