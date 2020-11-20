'use strict';
// app/controller/users.js
const BaseController = require("../base");


class Controller extends BaseController {
  constructor(...arg) {
    super(...arg)
    this.serviceName = 'role'
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