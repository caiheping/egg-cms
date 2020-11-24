'use strict';
// app/controller/users.js
const BaseService = require("../base");


class UsersService extends BaseService {
  constructor(...arg) {
    super(...arg)
    this.modelName = 'DictData'
  }
  
  // 查询某条数据
  async findByType (query) {
    return await this.ctx.model[this.modelName].findAll({
      where: query
    });
  }
}

module.exports = UsersService;