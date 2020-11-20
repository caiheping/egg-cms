'use strict';
// app/controller/users.js
const BaseService = require("../base");


class UsersService extends BaseService {
  constructor(...arg) {
    super(...arg)
    this.modelName = 'Menus'
  }
}

module.exports = UsersService;