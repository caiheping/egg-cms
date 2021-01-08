# cms-api

## 描述

cms-api 为前后端分离的后台管理系统

## 技术栈

后端技术栈：egg.js + mysql + sequelize + jwt 等

前端技术栈：vue全家桶 + axios + elementUI 等

前端项目地址：https://github.com/caiheping/vue-cms

### 项目运行

```bash
git clone https://github.com/caiheping/egg-cms.git
cd egg-cms
npm install
```

然后修改config/config.default.js和database/config.json下自己的数据库用户名和密码

创建数据库egg_cms_development

在egg_cms_development数据库下导入项目根目录下egg_cms_development.sql文件

运行项目

> npm run dev

浏览器打开 http://127.0.0.1:7001/public/admin/index.html/#/login

admin登录账号：admin，密码： 123456
普通用户账号密码自己用admin去用户管理创建

### 项目功能
- [x] 登录 -- 完成
- [x] 首页 -- 待定
- [x] 文章列表 -- 完成
- [x] 文章类型 -- 完成
- [x] 用户中心 -- 完成
- [x] 角色管理 -- 完成
- [x] 菜单管理 -- 完成
- [x] 部门管理 -- 完成
- [x] 通知公告 -- 完成

## 后续

根据后台管理系统的博客模块开发前端个人博客界面，顺便完善首页

如果对您有帮助，您可以点右上角 "Star" 支持一下 谢谢！ ^_^