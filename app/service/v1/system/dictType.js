'use strict';
// app/controller/users.js
const BaseService = require("../base");


class UsersService extends BaseService {
  constructor(...arg) {
    super(...arg)
    this.modelName = 'DictType'
  }
}

module.exports = UsersService;