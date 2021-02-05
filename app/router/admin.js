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
  router.put(`/api/${app.config.public}/admin/system/user/:id/resetPwd`, app.middleware.auth({
    put: 'system:user:resetPwd'
  }), controller[app.config.public].admin.system.common.resetPwd); // 重置密码
  router.put(`/api/${app.config.public}/admin/system/user/:id/updateUserImg`, app.middleware.auth({
    put: 'system:user:updateUserImg'
  }), controller[app.config.public].admin.system.common.updateUserImg); // 修改头像
  router.put(`/api/${app.config.public}/admin/system/user/:id/updateUserPwd`, app.middleware.auth({
    put: 'system:user:updateUserPwd'
  }), controller[app.config.public].admin.system.common.updateUserPwd); // 修改密码
  router.get(`/api/${app.config.public}/admin/system/showByType/:dictType`, controller[app.config.public].admin.system.dictData.showByType); // 字典查询
  router.get(`/api/${app.config.public}/admin/system/menu/userMenu`, controller[app.config.public].admin.system.menu.userMenu); // 用户菜单
  router.put(`/api/${app.config.public}/admin/system/role/changeRoleStatus`, app.middleware.auth({
    put: 'system:role:changeRoleStatus'
  }), controller[app.config.public].admin.system.role.changeRoleStatus); // 修改角色状态


  /**
   * 系统模块
   */
  router.resources('user', `/api/${app.config.public}/admin/system/user`, app.middleware.auth({
    get: 'system:user:list',
    post: 'system:user:add',
    put: 'system:user:update',
    delete: 'system:user:delete'
  }), controller[app.config.public].admin.system.user); // 用户路由
  router.resources('role', `/api/${app.config.public}/admin/system/role`, app.middleware.auth({
    get: 'system:role:list',
    post: 'system:role:add',
    put: 'system:role:update',
    delete: 'system:role:delete'
  }), controller[app.config.public].admin.system.role); // 角色路由
  router.resources('menu', `/api/${app.config.public}/admin/system/menu`, app.middleware.auth({
    get: 'system:menu:list',
    post: 'system:menu:add',
    put: 'system:menu:update',
    delete: 'system:menu:delete'
  }), controller[app.config.public].admin.system.menu); // 菜单路由
  router.resources('department', `/api/${app.config.public}/admin/system/department`, app.middleware.auth({
    get: 'system:department:list',
    post: 'system:department:add',
    put: 'system:department:update',
    delete: 'system:department:delete'
  }), controller[app.config.public].admin.system.department); // 部门路由
  router.resources('dictType', `/api/${app.config.public}/admin/system/dictType`, app.middleware.auth({
    get: 'system:dictType:list',
    post: 'system:dictType:add',
    put: 'system:dictType:update',
    delete: 'system:dictType:delete'
  }), controller[app.config.public].admin.system.dictType); // 字典类型路由
  router.resources('dictData', `/api/${app.config.public}/admin/system/dictData`, app.middleware.auth({
    get: 'system:dictData:list',
    post: 'system:dictData:add',
    put: 'system:dictData:update',
    delete: 'system:dictData:delete'
  }), controller[app.config.public].admin.system.dictData); // 字典数据路由
  router.resources('notice', `/api/${app.config.public}/admin/system/notice`, app.middleware.auth({
    get: 'system:notice:list',
    post: 'system:notice:add',
    put: 'system:notice:update',
    delete: 'system:notice:delete'
  }), controller[app.config.public].admin.system.notice); // 字典数据路由

  /**
   * 博客模块特殊处理
   * */ 
  router.get(`/api/${app.config.public}/admin/blog/articleType/getAllType`, app.middleware.auth({
    get: 'blog:articleType:getAllType'
  }), controller[app.config.public].admin.blog.articleType.getAllType); // 获取所有类型
  /**
   * 博客模块
   */
  router.resources('article', `/api/${app.config.public}/admin/blog/article`, app.middleware.auth({
    get: 'blog:article:list',
    post: 'blog:article:add',
    put: 'blog:article:update',
    delete: 'blog:article:delete'
  }), controller[app.config.public].admin.blog.article); // 文章路由
  router.resources('articleType', `/api/${app.config.public}/admin/blog/articleType`, app.middleware.auth({
    get: 'blog:articleType:list',
    post: 'blog:articleType:add',
    put: 'blog:articleType:update',
    delete: 'blog:articleType:delete'
  }), controller[app.config.public].admin.blog.articleType); // 文章类型路由
  router.resources('friendlyLink', `/api/${app.config.public}/admin/blog/friendlyLink`, app.middleware.auth({
    get: 'blog:friendlyLink:list',
    post: 'blog:friendlyLink:add',
    put: 'blog:friendlyLink:update',
    delete: 'blog:friendlyLink:delete'
  }), controller[app.config.public].admin.blog.friendlyLink); // 友情链接路由
};