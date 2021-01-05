'use strict';
// app/controller/users.js
const BaseController = require("../base");


class Controller extends BaseController {
  constructor(...arg) {
    super(...arg)
    this.serviceName = 'menu'
  }
  // 查询
  async index() {
    const {ctx, service} = this;
    const result = await service.v1.system[this.serviceName].findAllMenu();
    ctx.returnBody(result, 100010);
  }
  
  // 查询用户菜单
  async userMenu() {
    const {ctx, service} = this;
    const result = await service.v1.system[this.serviceName].findByUser();
    ctx.returnBody(result, 100010);
  }
}

module.exports = Controller;