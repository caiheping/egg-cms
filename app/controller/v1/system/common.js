'use strict';
const Controller = require('egg').Controller;
const path = require('path');
const fs = require('fs');
const JWT = require('jsonwebtoken');

class CommonController extends Controller {  
  
  async login() {
    const { ctx, service } = this;
    ctx.state.user = null
    const query = ctx.request.body;
    const validateResult = await this.ctx.validate('user.login', query)
    // 验证不通过时，阻止后面的代码执行
    if (!validateResult) return
    // 从service文件中拿到返回结果
    if (ctx.session.code.toLowerCase() !== query.captcha.toLowerCase()) {
      return ctx.throw(500, '验证码错误');
    }
    const result = await service.v1.system.common.login(query);
    if (!result) {
      return ctx.throw(500, '用户不存在');
    } else {
      let checkPwd = await ctx.compare(query.password, result.get('password')) // 对比两次密码是否一致
      if (!checkPwd) {
        return ctx.throw(500, '用户名或密码错误');
      } else if (result.status === '0') {
        return ctx.throw(500, '该用户已经被停用！');
      } else if (result.department.status === '0') {
        return ctx.throw(500, '该用户所在部门已经被停用！');
      } else {
        // 签发token
        const token = JWT.sign(
          {
            id: result.id,
            userName: result.userName
          },
          this.config.jwt.secret,
          {
            expiresIn: this.config.jwt.expiresIn,
          }
        );
        ctx.state.user = result
        ctx.returnBody({
          userInfo: result,
          token
        });
      }
    }
  }
  // 登出
  async logout() {
    const { ctx } = this;
    ctx.state = {}
    ctx.returnBody(null, 0)
  }
  // 验证码
  async captcha() {
    const { ctx, service } = this;
    let captcha = await service.v1.system.common.captcha(); // 服务里面的方法
    ctx.response.type = 'image/svg+xml';  // 知道你个返回的类型
    ctx.body = captcha.data; // 返回一张图片
  }

  
  // 重置密码
  async resetPwd() {
    const {ctx, service} = this;
    ctx.request.body['newPassword'] = await ctx.genHash(ctx.request.body['newPassword'])
    let query = {
      password: ctx.request.body['newPassword'],
    }
    let id = ctx.helper.parseInt(ctx.params.id)
    const result = await service.v1.system.user.resetPwd(query, id);
    if (result) {
      ctx.returnBody(null, 100030);
    } else {
      ctx.returnBody(null, 100031);
    }
  }

  // 修改密码
  async updateUserPwd() {
    const {ctx, service} = this;
    let checkPwd = await ctx.compare(ctx.request.body['password'], ctx.state.user.password) // 对比两次密码是否一致
    if (!checkPwd) {
      return ctx.throw(500, '原始密码错误');
    }
    ctx.request.body['newPassword'] = await ctx.genHash(ctx.request.body['newPassword'])
    let query = {
      password: ctx.request.body['newPassword'],
    }
    let id = ctx.helper.parseInt(ctx.params.id)
    const result = await service.v1.system.user.resetPwd(query, id);
    if (result) {
      ctx.returnBody(null, 100030);
    } else {
      ctx.returnBody(null, 100031);
    }
  }

  // 修改头像
  async updateUserImg() {
    const {ctx, service} = this;
    ctx.request.body['avatar'] = ctx.request.body['avatar']
    let query = {
      avatar: ctx.request.body['avatar'],
    }
    let id = ctx.helper.parseInt(ctx.params.id)
    const result = await service.v1.system.user.updateUserImg(query, id);
    if (result) {
      ctx.returnBody(null, 100030);
    } else {
      ctx.returnBody(null, 100031);
    }
  }

  // 上传头像
  async upload () {
    const { ctx } = this
    const file = ctx.request.files[0];
    const fileinfo = fs.readFileSync(file.filepath);
    const name = `CHP_${new Date().getTime()}_${file.filename}`;
    let filePath = `/public/uploads/${name}`;
    const target = `app/public/uploads/${name}`;
    try {
      await fs.writeFileSync(target, fileinfo);
    } catch (error) {
      throw error;
    } finally {
      await fs.unlink(file.filepath, err => {
        if (err) {
          throw err;
        }
        console.log('删除缓存文件:' + file.filepath + '成功！');
      });
    }
    ctx.returnBody({
      path: filePath, // 路径
    }, '上传成功');
  }
}

module.exports = CommonController;