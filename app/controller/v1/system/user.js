'use strict';
// app/controller/users.js
const BaseController = require("../base");


class Controller extends BaseController {
  constructor(...arg) {
    super(...arg)
    this.serviceName = 'user'
  }
  // 查询用户信息
  async getInfo () {
    const { ctx, service } = this;
    // id为1的超级管理员，拥有全部权限
    if (ctx.state.user.id === 1) {
      ctx.returnBody({
        permissions:[
          "*:*:*"
        ],
        user: ctx.state.user
      }, 100010);
    } else {
      const result = await service.v1.system['menu'].findByUser(ctx.state.user.id)
      let list = result.rows.filter(item => item.menuType === 'F')
      let permissions = list.map(list => list.perms)
      ctx.returnBody({
        permissions,
        user: ctx.state.user
      }, 100010);
    }
  }

  // 查询
  async index() {
    const {ctx, service} = this;
    // 查询参数
    const query = {
      limit: ctx.helper.parseInt(ctx.query.pageSize),
      offset: ctx.helper.parseInt(ctx.query.pageNum),
      userName: ctx.query.userName ? ctx.query.userName : '',
      status: ctx.query.status ? ctx.query.status : '',
      deptId: parseInt(ctx.query.deptId)
    };
    const result = await service.v1.system[this.serviceName].findList(query);
    ctx.returnBody(result, 100010);
  }

  // 查询单个
  async show() {
    const {ctx, service} = this;
    let id = ctx.helper.parseInt(this.ctx.params.id)
    const result = ctx.body = await service.v1.system[this.serviceName].findOne(id);
    ctx.returnBody(result, 100010);
  }

  // 新增
  async create() {
    const {ctx, service} = this;
    const validateResult = await ctx.validate('user.post', ctx.request.body)
    // 验证不通过时，阻止后面的代码执行
    if (!validateResult) return
    ctx.request.body['password'] = await ctx.genHash(ctx.request.body['password'])
    let query = {
      userName: ctx.request.body['userName'],
      password: ctx.request.body['password'],
      deptId: ctx.request.body['deptId'],
      nickName: ctx.request.body['nickName'],
      sex: ctx.request.body['sex'],
      avater: ctx.request.body['avater'],
      email: ctx.request.body['email'],
      mobile: ctx.request.body['mobile'],
      remark: ctx.request.body['remark'],
      createdAt: new Date(),
      createdBy: ctx.state.user.userName
    }
    const result = await service.v1.system[this.serviceName].create(query);
    if (result) {
      ctx.returnBody(null, 100020);
    } else {
      ctx.returnBody(null, 100021);
    }
  }

  // 修改
  async update() {
    const {ctx, service} = this;
    const validateResult = await ctx.validate('user.post', ctx.request.body)
    // 验证不通过时，阻止后面的代码执行
    if (!validateResult) return
    let query = {
      deptId: ctx.request.body['deptId'],
      nickName: ctx.request.body['nickName'],
      sex: ctx.request.body['sex'],
      avater: ctx.request.body['avater'],
      email: ctx.request.body['email'],
      mobile: ctx.request.body['mobile'],
      status: ctx.request.body['status'],
      remark: ctx.request.body['remark'],
      updatedAt: new Date(),
      updatedBy: ctx.state.user.userName
    }
    let id = ctx.helper.parseInt(ctx.params.id)
    const result = await service.v1.system[this.serviceName].update(query, id);
    if (result) {
      ctx.returnBody(null, 100030);
    } else {
      ctx.returnBody(null, 100031);
    }
  }

  // 删除
  async destroy() {
    const {ctx, service} = this;
    const ids = ctx.params.id.split(',');
    const result = await service.v1.system[this.serviceName].destroy(ids);
    
    if (result) {
      ctx.returnBody(null, 100040);
    } else {
      ctx.returnBody(null, 100041);
    }
  }
}

module.exports = Controller;