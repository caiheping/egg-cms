'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  /**
   * 后台管理系统模块
  */
  // 特殊处理
  router.post(`/api/${app.config.public}/login`, controller[app.config.public].admin.system.common.login); // 登录
  router.post(`/api/${app.config.public}/logout`, controller[app.config.public].admin.system.common.logout); // 登出
  router.get(`/api/${app.config.public}/captcha`, controller[app.config.public].admin.system.common.captcha); // 验证码
  router.post(`/api/${app.config.public}/upload`, controller[app.config.public].admin.system.common.upload); // 上传
  router.get(`/api/${app.config.public}/admin/system/getInfo`, controller[app.config.public].admin.system.user.getInfo); // 获取用户信息
  router.put(`/api/${app.config.public}/admin/system/user/:id/resetPwd`, controller[app.config.public].admin.system.common.resetPwd); // 重置密码
  router.put(`/api/${app.config.public}/admin/system/user/:id/updateUserImg`, controller[app.config.public].admin.system.common.updateUserImg); // 修改头像
  router.put(`/api/${app.config.public}/admin/system/user/:id/updateUserPwd`, controller[app.config.public].admin.system.common.updateUserPwd); // 修改密码
  router.get(`/api/${app.config.public}/admin/system/showByType/:dictType`, controller[app.config.public].admin.system.dictData.showByType); // 字典查询
  router.get(`/api/${app.config.public}/admin/system/menu/userMenu`, controller[app.config.public].admin.system.menu.userMenu); // 用户菜单
  router.put(`/api/${app.config.public}/admin/system/role/changeRoleStatus`, controller[app.config.public].admin.system.role.changeRoleStatus); // 修改角色状态
  /**
   * 博客模块特殊处理
   * */ 
  router.get(`/api/${app.config.public}/admin/blog/articleType/getAllType`, controller[app.config.public].admin.blog.articleType.getAllType); // 获取所有类型

  /**
   * 系统模块
   */
  router.resources('user', `/api/${app.config.public}/admin/system/user`, controller[app.config.public].admin.system.user); // 用户路由
  router.resources('role', `/api/${app.config.public}/admin/system/role`, controller[app.config.public].admin.system.role); // 角色路由
  router.resources('menu', `/api/${app.config.public}/admin/system/menu`, controller[app.config.public].admin.system.menu); // 菜单路由
  router.resources('department', `/api/${app.config.public}/admin/system/department`, controller[app.config.public].admin.system.department); // 部门路由
  router.resources('dictType', `/api/${app.config.public}/admin/system/dictType`, controller[app.config.public].admin.system.dictType); // 字典类型路由
  router.resources('dictData', `/api/${app.config.public}/admin/system/dictData`, controller[app.config.public].admin.system.dictData); // 字典数据路由
  router.resources('notice', `/api/${app.config.public}/admin/system/notice`, controller[app.config.public].admin.system.notice); // 字典数据路由

  /**
   * 博客模块
   */
  router.resources('article', `/api/${app.config.public}/admin/blog/article`, controller[app.config.public].admin.blog.article); // 文章路由
  router.resources('articleType', `/api/${app.config.public}/admin/blog/articleType`, controller[app.config.public].admin.blog.articleType); // 文章类型路由
  router.resources('friendlyLink', `/api/${app.config.public}/admin/blog/friendlyLink`, controller[app.config.public].admin.blog.friendlyLink); // 文章类型路由



  /**
   * web前端模块
   */
  router.get(`/api/${app.config.public}/front/system/getInfo`, controller[app.config.public].front.system.user.getInfo); // 获取用户信息
  router.get(`/api/${app.config.public}/front/blog/articleType/getAllType`, controller[app.config.public].front.blog.articleType.getAllType); // 获取所有类型
  router.get(`/api/${app.config.public}/front/blog/getArticle`, controller[app.config.public].front.blog.article.getArticle); // 获取文章
  router.get(`/api/${app.config.public}/front/blog/getArticleById/:id`, controller[app.config.public].front.blog.article.getArticleById); // 获取文章详情
  router.get(`/api/${app.config.public}/front/blog/friendlyLink/getFriendlyLink`, controller[app.config.public].front.blog.friendlyLink.getAllLink); // 获取文章
};
