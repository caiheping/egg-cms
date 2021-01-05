'use strict';
// app/controller/users.js
const BaseController = require("../base");


class Controller extends BaseController {
  constructor(...arg) {
    super(...arg)
    this.serviceName = 'role'
  }

  // 修改角色状态
  async changeRoleStatus () {
    const {ctx, service} = this;
    // 查询参数
    const query = {
      status: ctx.request.body.status
    };
    const id = this.ctx.helper.parseInt(ctx.request.body.id);
    const result = await service.v1.system[this.serviceName].updateStatus(query, {
      id
    });
    if (result) {
      ctx.returnBody(null, 100030);
    } else {
      ctx.returnBody(null, 100031);
    }
  }

  // 查询
  async index() {
    const {ctx, service} = this;
    // 查询参数
    const query = {
      limit: ctx.helper.parseInt(ctx.query.pageSize),
      offset: ctx.helper.parseInt(ctx.query.pageNum),
      roleName: ctx.query.roleName,
      status: ctx.query.status
    };
    const result = await service.v1.system[this.serviceName].findList(query, [['roleSort', 'ASC']]);
    ctx.returnBody(result, 100010);
  }

  // 查询单个
  async show() {
    const {ctx, service} = this;
    let id = ctx.helper.parseInt(this.ctx.params.id)
    const result = ctx.body = await service.v1.system[this.serviceName].findOne(id);
    ctx.returnBody(result, 100010);
  }
}

module.exports = Controller;