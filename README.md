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

### 关于项目的博客管理 > 友情链接 和系统管理 > 通知公告的解释   莫玉霞


**一.博客管理 > 友情链接  莫玉霞**

友情链接页面指南


### 搜索按钮：
- 我们想要搜索链接时，我们可以在名称的输入框输入名称，然后点击搜索按钮就会我们想要搜索的内容

### 重置按钮：
- 点击后可以重置搜索条件。

### 新增按钮：
- 点击新增按钮会出现一个页面框，我们可以在里面输入新的链接，里面有名称、链接和备注，其中名称和链接的输入不可以为空，当我们全部的输入好之后可以点击确定按钮，这样就可以见建成一个新的链接，我们点击取消按钮时，就会返回到原来的页面。

### 修改按钮：
- 当我们选中链接时，修改按钮会点亮，我们点击它会出现一个页面框，这时我们就可以修改我们想要修改的内容，然后点击确定按钮就可以了。



### 删除按钮：
- 当我们选中链接时，删除按钮会点亮，我们点击它会出现是否要删掉，点击确定按钮时就会帮我们删除掉刚才想要删除的链接。


在友情链接的页面我们可以看到名称、链接、备注的内容，创建的时间和操作（修改和删除）


**二.系统管理 > 通知公告的解释  莫玉霞**

通知公告的页面指南


主操作区域：

### 公告标题搜索框：
- 可以输入公告标题进行搜索。

### 类型下拉菜单：
- 可以选择公告的类型进行筛选。

### 搜索按钮：
- 点击后可以根据输入的条件进行搜索。

### 重置按钮：
- 点击后可以重置搜索条件。


### 公告列表：
- 显示公告的详细信息，包括：公告标题：显示公告的标题、 公告类型：显示公告的类型（如“公告”）、 状态：显示公告的状态（如“启用”）、创建者：显示创建公告的用户、创建时间：显示公告的创建时间、操作：提供对公告的操作选项，如“修改”和“删除”。

### 分页控制：
- 显示当前页码和总条数，并提供分页导航按钮。

### 新增按钮：
-点击新增按钮会出现一个页面框

​公告标题​：输入框，用于输入公告的标题。

​公告类型​：下拉菜单，用于选择公告的类型。​

状态​：单选按钮，用于选择公告的状态（启用或停用）。

​内容​：富文本编辑器，用于输入公告的详细内容。

​确定按钮​：点击后保存公告。

​取消按钮​：点击后取消添加公告操作。​


### 删除按钮：
- 当我们选中公告时，删除按钮会点亮，我们点击它会出现是否要删掉，点击确定按钮时就会帮我们删除掉刚才想要删除的公告。



### 修改按钮：
- 当我们选中公告时，修改按钮会点亮，我们点击它会出现一个页面框，这时我们就可以修改我们想要修改的内容，然后点击确定按钮就可以了。
