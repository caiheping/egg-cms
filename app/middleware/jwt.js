const jwt = require('jsonwebtoken');
const { checkWhiteList, handleTree } = require('../utils/tools');
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

module.exports = (options, app) => {
  return async function(ctx, next) {
    let parentWhiteLists = app.config.whiteList.filter(item => item.lastIndexOf('/*') !== -1)
    let whiteLists = app.config.whiteList.filter(item => item.lastIndexOf('/*') === -1)
    if (!checkWhiteList(ctx, parentWhiteLists) && !whiteLists.includes(ctx.request.path)) {
      // 拿到传会数据的header 中的token值
      const token = ctx.request.header.authorization ? ctx.request.header.authorization.split(' ')[1] : null;
      if (!token) {
        ctx.throw(401, '未登录， 请先登录');
        // next()
      } else { // 当前token值存在
        let decode;
        try {
          // 验证当前token
          decode = jwt.verify(token, options.secret);
        } catch (e) {
          ctx.throw(401, 'Token失效，请重新登录');
          console.log(e);
        }
        const user = await ctx.model.Users.findOne({
          where: {
            id: decode.id
          },
          include: [{
            model: ctx.model['Roles'],
            as: 'roles'
          }]
        });
        if (user) {
          ctx.state.user = user
          let departments = await ctx.model.Departments.findAndCountAll();
          ctx.state.departmentsObj = handleTree(departments.rows, 'deptId');
          if (ctx.state.user.id === 1) { // 超级管理员权限
            ctx.state.permissions = [
              "*:*:*"
            ]
          } else {
            let roleIds = ctx.state.user.roles.map(item => item.id)
            let menus = await ctx.model["RoleMenu"].findAll({
              where: {
                roleId: {
                  [Op.or]: roleIds
                }
              }
            })
            let menuIds = menus.map(item => item.menuId)
            let obj = {
              where: {
                id: {
                  [Op.or]: menuIds
                },
                status: '1' // 查询启用的菜单
              },
              order: [['orderNum', 'ASC']]
            }
            let result = await ctx.model['Menus'].findAndCountAll(obj);
            let list = result.rows.filter(item => item.menuType === 'F')
            ctx.state.permissions = list.map(list => list.perms)
          }
          await next();
        } else {
          ctx.throw(401, '用户信息验证失败');
        }
      }
    } else {
      await next();
    }
  };
};