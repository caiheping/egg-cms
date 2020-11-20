'use strict';
// app/controller/users.js
const BaseService = require("../base");


class UsersService extends BaseService {
  constructor(...arg) {
    super(...arg)
    this.modelName = 'Roles'
  }

  // 查询某条数据
  async findOne (id) {
    return await this.ctx.model[this.modelName].findOne({
      where: {
        id
      },
      include: [{
        model: this.ctx.model['Menus'],
        as: 'menus'
      }]
    })
  }
}

module.exports = UsersService;