'use strict';
// app/controller/users.js
const BaseController = require("../base");


class Controller extends BaseController {
  constructor(...arg) {
    super(...arg)
    this.serviceName = 'articleType'
    this.modleName = 'blog'
  }
  // 查询
  async index() {
    const {ctx, service} = this;
    // 查询参数
    const query = {
      limit: ctx.helper.parseInt(ctx.query.pageSize),
      offset: ctx.helper.parseInt(ctx.query.pageNum),
      userId: ctx.state.user.id,
      title: ctx.query.title
    };
    const result = await service.v1[this.modleName][this.serviceName].findList(query, [['orderNum', 'ASC']]);
    ctx.returnBody(result, 100010);
  }

  async getAllType () {
    const {ctx, service} = this;
    const query = {
      userId: ctx.state.user.id
    };
    const result = await service.v1[this.modleName][this.serviceName].findAll(query);
    ctx.returnBody(result, 100010);
  }
}

module.exports = Controller;