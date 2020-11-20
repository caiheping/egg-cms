'use strict';
const Controller = require('egg').Controller;

class BaseController extends Controller {
  // 查询
  async index() {
    const {ctx, service} = this;
    // 查询参数
    const query = {
      limit: ctx.helper.parseInt(ctx.query.pageSize),
      offset: ctx.helper.parseInt(ctx.query.pageNum)
    };
    const result = await service.v1.system[this.serviceName].findList(query);
    ctx.returnBody(result, 100010);
  }

  // 查询单个
  async show() {
    const {ctx, service} = this;
    let id = ctx.helper.parseInt(this.ctx.params.id)
    const result = ctx.body = await service.v1.system[this.serviceName].findByPk(id);
    ctx.returnBody(result, 100010);
  }

  // 新增
  async create() {
    const {ctx, service} = this;
    let query = ctx.request.body
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
    let query = ctx.request.body
    const id = this.ctx.helper.parseInt(ctx.params.id);
    const result = await service.v1.system[this.serviceName].update(query, {
      id
    });
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

module.exports = BaseController;