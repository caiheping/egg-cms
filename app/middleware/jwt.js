const jwt = require('jsonwebtoken');
const { checkWhiteList, handleTree } = require('../utils/tools');

module.exports = (options, app) => {
  return async function(ctx, next) {
    let parentWhiteLists = app.config.whiteList.filter(item => item.lastIndexOf('/*') !== -1)
    let whiteLists = app.config.whiteList.filter(item => item.lastIndexOf('/*') === -1)
    if (!checkWhiteList(ctx, parentWhiteLists) && !whiteLists.includes(ctx.request.path)) {
      // 拿到传会数据的header 中的token值
      const token = ctx.request.header.authorization ? ctx.request.header.authorization.split(' ')[1] : null;
      if (!token) {
        ctx.throw(401, '未登录， 请先登录');
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
          id: decode.id,
          include: [{
            model: ctx.model['Roles'],
            as: 'roles'
          }]
        });
        if (user) {
          ctx.state.user = user
          let departments = await ctx.model.Departments.findAndCountAll();
          ctx.state.departmentsObj = handleTree(departments.rows, 'deptId');
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