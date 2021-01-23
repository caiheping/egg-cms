'use strict';

const BaseService = require("../../base");


class Service extends BaseService {
  constructor(...arg) {
    super(...arg)
    this.modelName = 'Articles'
  }
}

module.exports = Service;