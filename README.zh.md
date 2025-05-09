                 后台管理系统————文章管理
一、关于项目的搭建：
1.搭建环境下载软件：node-v20.18.0-x64  和 Navicat
2.在Navicat中，创建数据库egg_cms_development,然后导入原博主的项目根目录下数据库数据egg_cms_development.sql文件
3.用VSC打开项目，然后修改config/config.default.js文件中的数据库名和密码，以及主机地址。
4.在VSC里新建终端用命令 npm run dev 运行项目
5.运行成功后浏览器打开网址http://127.0.0.1:7001/index.html，即可成功打开项目，项目默认登录账号admin,密码：123456，只需输入图片验证码即可进入首页。
