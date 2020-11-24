'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.post(`/api/${app.config.public}/login`, controller.v1.system.common.login); // 登录
  router.post(`/api/${app.config.public}/logout`, controller.v1.system.common.logout); // 登出
  router.get(`/api/${app.config.public}/captcha`, controller.v1.system.common.captcha); // 验证码
  router.post(`/api/${app.config.public}/upload`, controller.v1.system.common.upload); // 上传
  router.get(`/api/${app.config.public}/system/getInfo`, controller.v1.system.user.getInfo); // 获取用户信息
  router.put(`/api/${app.config.public}/system/user/:id/resetPwd`, controller.v1.system.common.resetPwd); // 重置密码
  router.put(`/api/${app.config.public}/system/user/:id/updateUserImg`, controller.v1.system.common.updateUserImg); // 修改头像
  router.put(`/api/${app.config.public}/system/user/:id/updateUserPwd`, controller.v1.system.common.updateUserPwd); // 修改密码
  router.get(`/api/${app.config.public}/system/showByType/:dictType`, controller.v1.system.dictData.showByType); // 字典查询

  /**
   * 系统模块
   */
  router.resources('user', `/api/${app.config.public}/system/user`, controller.v1.system.user); // 用户路由
  router.resources('role', `/api/${app.config.public}/system/role`, controller.v1.system.role); // 角色路由
  router.resources('menu', `/api/${app.config.public}/system/menu`, controller.v1.system.menu); // 菜单路由
  router.resources('department', `/api/${app.config.public}/system/department`, controller.v1.system.department); // 部门路由
  router.resources('dictType', `/api/${app.config.public}/system/dictType`, controller.v1.system.dictType); // 字典类型路由
  router.resources('dictData', `/api/${app.config.public}/system/dictData`, controller.v1.system.dictData); // 字典数据路由
};
