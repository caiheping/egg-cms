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
# 如果clone 很慢，也可以拉码云的仓库
git clone https://gitee.com/caiheping/egg-cms.git
cd egg-cms
npm install
```

然后修改config/config.default.js和database/config.json（这个改不改都行）下自己的数据库用户名和密码

创建数据库egg_cms_development

在egg_cms_development数据库下导入项目根目录下egg_cms_development.sql文件

运行项目

> npm run dev

浏览器打开 http://127.0.0.1:7001/index.html

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

演示地址：http://blog.caihp.top （自己服务器只开放部分功能，想要查看全部功能，请copy代码在自己的电脑上看）

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



**传送门：前端vue3 + 后端egg项目地址：https://github.com/caiheping/oa-api   或者  https://gitee.com/caiheping/oa-api**

如果对您有帮助，您可以点右上角 "Star" 支持一下 谢谢！ ^_^

                 博客管理>文章列表————曾雨情
**一、关于项目的搭建：**
1.搭建环境下载软件：node-v20.18.0-x64  和 Navicat

2.在Navicat中，创建数据库egg_cms_development,然后导入原博主的项目根目录下数据库数据egg_cms_development.sql文件

3.用VSC打开项目，然后修改config/config.default.js文件中的数据库名和密码，以及主机地址。

4.在VSC里新建终端用命令 npm run dev 运行项目

5.运行成功后浏览器打开网址http://127.0.0.1:7001/index.html，即可成功打开项目，项目默认登录账号admin,密码：123456，只需输入图片验证码即可进入首页。


**二：关于 博客管理>文章列表 功能的介绍：**
![文章列表页面](images/ariticle%20page.png)

以下是如何使用文章列表页面的指南：


1. **查看文章列表**：
   打开文章列表页面，用户可以看见所有已发布的文章。

2. **分页浏览**：
   - 如果文章数量较多，可以使用页面底部的分页控件来浏览不同页的文章。

### 搜索文章
1. **使用搜索框**：
   - 在页面顶部的搜索框中输入想要查找的文章标题。

2. **执行搜索**：
   - 点击“搜索”按钮，系统会显示与搜索条件匹配的文章。

3. **重置搜索**：
   - 如果需要清除搜索条件，可以点击“重置”按钮。

### 查看文章详情
1. **点击文章标题**：
   - 在文章列表中，点击你想要查看的文章标题，通常会跳转到文章的详细页面。

### 修改文章
1. **点击“修改”按钮**：
   - 在文章列表中，找到你想要修改的文章，点击该文章行的“修改”按钮。

2. **编辑文章**：
   - 系统会跳转到文章编辑页面，你可以在这里修改文章的标题、内容等信息。

3. **保存修改**：
   - 修改完成后，点击“确定”按钮保存修改。

### 删除文章
1. **点击“删除”按钮**：
   - 在文章列表中，找到你想要删除的文章，点击该文章行的“删除”按钮。

2. **确认删除**：
   - 系统可能会弹出确认对话框，询问你是否确定要删除文章，点击“确定”以确认删除。



### 管理文章类型
1. **访问文章类型管理**：
   - 在左侧导航栏中，点击“文章类型”以管理文章的分类。

2. **添加或修改类型**：
   - 在文章类型管理页面，你可以添加新的文章类型或修改现有的类型。


### 添加新文章
![增加文章页面](images/article%20%20%20ADD.png)
以下是对该页面的详细描述：
标题:用于输入文章的标题。  副标题：写副标题

分类：有一个下拉菜单，用于选择文章的分类。

内容：用于输入文章的正文内容。编辑框上方有一些文本格式化工具，如加粗、斜体、列表、链接等，便于用户编辑修改。

这个增加文章页面的设计让用户能够方便地创建和编辑文章，同时提供实时预览功能，以便用户在发布前检查文章的最终效果。

