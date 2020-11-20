'use strict';
// app/controller/users.js
const BaseService = require("../base");
const Sequelize = require('sequelize');
const Op = Sequelize.Op;


class UsersService extends BaseService {
  constructor(...arg) {
    super(...arg)
    this.modelName = 'Departments'
  }

  // 删除
  async destroy (ids) {
    return await this.ctx.model[this.modelName].destroy({
      where: {
        deptId: {
          [Op.or]: ids
        }
      }
    })
  }
}

module.exports = UsersService;