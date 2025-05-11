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



## 部门管理--黄晓蓉

### 查看部门列表（部门管理页面显示）
1. **打开部门列表页面**  
   - 登录后台管理系统后，在左侧导航栏中点击 **“系统管理”** → **“部门管理”**。  
   - 页面将显示所有已创建的部门信息，包括部门名称、状态、排序、创建时间等。     

### 添加新部门（可添加新一级部门，也可在同一级添加）
1. **点击新增**  
   - 点击部门列表左/右上角的 **“新增”** 按钮。  
2. **填写部门信息**  
   - **上级部门**：从下拉菜单中选择该部门的上级（如“总部”），系统要求此参数必填，若未选择，将提示 “parentId 不能为空” 。  
   - **部门名称**：输入部门名称（如“测试一部”），该字段为必填项，若为空，会提示 “部门名称不能为空” 。
  - **部门顺序**：可按需设置部门的显示顺序（若不设置，系统可能会有默认排序规则 ）。此参数也是必填的，若未填写，将提示 “显示顺序不能为空” 。
   - **部门状态**：选择“正常”或“停用”。  
3. **保存设置**  
   - 点击 **“确定”** 完成添加；点击 **“取消”** 放弃操作。  

### 修改部门信息（各字段不能为空）
1. **点击编辑按钮**  
   - 在部门列表中，找到目标部门，点击其操作栏中的 **“编辑”** 按钮。  
2. **修改内容**  
   - 在弹出的编辑页面中调整部门名称、状态等信息。  
3. **保存修改**  
   - 点击 **“确定”** 保存更改；点击 **“取消”** 退出编辑。  

### 删除部门（二次确认）
1. **点击删除按钮**  
   - 在部门列表中，找到目标部门，点击其操作栏中的 **“删除”** 按钮。  
2. **确认操作**
   - 系统将弹出确认对话框，点击 **“确定”** 完成删除；点击 **“取消”** 中止操作。  

### 注意事项
- **层级关系**：添加部门时需正确选择上级部门，确保组织架构清晰。  
- **状态管理**：停用部门后，其下属部门及相关权限可能受影响，请谨慎操作。
