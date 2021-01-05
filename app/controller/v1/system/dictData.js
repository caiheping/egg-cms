'use strict';
// app/controller/users.js
const BaseController = require("../base");


class Controller extends BaseController {
  constructor(...arg) {
    super(...arg)
    this.serviceName = 'dictData'
  }

  // 查询
  async index() {
    const {ctx, service} = this;
    const validateResult = await ctx.validate('dict.list', ctx.request.query)
    // 验证不通过时，阻止后面的代码执行
    if (!validateResult) return
    // 查询参数
    const query = {
      limit: ctx.helper.parseInt(ctx.query.pageSize),
      offset: ctx.helper.parseInt(ctx.query.pageNum),
      dictType: ctx.query.dictType,
      dictLabel: ctx.query.dictLabel,
      status: ctx.query.status
    };
    const result = await service.v1.system[this.serviceName].findList(query, [['dictSort', 'ASC']]);
    ctx.returnBody(result, 100010);
  }

  // 查询单个
  async showByType() {
    const {ctx, service} = this;
    // 查询参数
    const query = {
      dictType: this.ctx.params.dictType
    };
    const result = ctx.body = await service.v1.system[this.serviceName].findByType(query);
    ctx.returnBody(result, 100010);
  }
}

module.exports = Controller;