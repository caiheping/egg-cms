'use strict';
// app/controller/users.js
const BaseController = require("../base");


class Controller extends BaseController {
  constructor(...arg) {
    super(...arg)
    this.serviceName = 'menu'
  }
  // async create () {

  // }
}

module.exports = Controller;