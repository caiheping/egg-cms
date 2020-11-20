'use strict';
const Controller = require('egg').Controller;
const path = require('path');
const fs = require('fs');
const pump = require('pump');
const JWT = require('jsonwebtoken');

// 获取文件后缀
const getUploadFileExt = function (name) {
  let ext = name.split('.');
  if (ext[ext.length - 1] === 'blob') {
    return 'jpg'
  }
  return ext[ext.length - 1];
}

// 生成随机文件
const getUploadFileName = function (ext){
  return `${Date.now()}${Number.parseInt(Math.random() * 10000)}.${ext}`;
}

// 递归创建目录 同步方法
function mkdirsSync(dirname) {
  if (fs.existsSync(dirname)) {
    return true;
  } else {
    if (mkdirsSync(path.dirname(dirname, '../../'))) {
      fs.mkdirSync(dirname);
      return true;
    }
  }
}

class CommonController extends Controller {  
  
  async login() {
    const { ctx, service } = this;
    const query = ctx.request.body;
    const validateResult = await this.ctx.validate('user.login', query)
    // 验证不通过时，阻止后面的代码执行
    if (!validateResult) return
    // 从service文件中拿到返回结果
    if (ctx.session.code !== query.captcha) {
      // return ctx.throw(500, '验证码错误');
    }
    const result = await service.v1.system.common.login(query);
    if (!result) {
      ctx.returnBody(null, 200011);
    } else {
      let checkPwd = await this.ctx.compare(query.password, result.get('password')) // 对比两次密码是否一致
      if (!checkPwd) {
        ctx.returnBody(null, 200012);
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
        ctx.returnBody({
          userInfo: result,
          token
        });
      }
    }
  }
  // 登出
  async logout() {
    const { ctx, service } = this;
    ctx.state = {}
    ctx.session.token = null
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

  // 上传头像
  async upload () {
    const { ctx } = this
    mkdirsSync('app/public/uploads/')
    // 读取表单提交的文件流
    const stream = await ctx.getFileStream()
    // 获取上传的文件名  like.jpg dog.png 
    const file_name = path.basename(stream.filename)
    // 拼接上传路径
    const upload_path = 'app/public/uploads/' + getUploadFileName(getUploadFileExt(file_name))

    // 创建一个可以写入的流
    const writeStream = fs.createWriteStream(upload_path)

    // 第一个参数读取流，第二个参数可写流, 上传失败会自动销毁流
    await pump(stream, writeStream);
    ctx.returnBody({
      url: upload_path, // 上传路径
      fields: stream.fields // 所有表单字段都能通过 `stream.fields` 获取到
    }, '上传成功');
  }
}

module.exports = CommonController;