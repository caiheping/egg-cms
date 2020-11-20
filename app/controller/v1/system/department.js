'use strict';
// app/controller/users.js
const BaseController = require("../base");


class Controller extends BaseController {
  constructor(...arg) {
    super(...arg)
    this.serviceName = 'department'
  }

  // 修改
  async update() {
    const {ctx, service} = this;
    let query = ctx.request.body
    const id = this.ctx.helper.parseInt(ctx.params.id);
    const result = await service.v1.system[this.serviceName].update(query, {
      deptId: id
    });
    if (result) {
      ctx.returnBody(null, 100030);
    } else {
      ctx.returnBody(null, 100031);
    }
  }
}

module.exports = Controller;