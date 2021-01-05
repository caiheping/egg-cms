'use strict';

const BaseService = require("../base");
const Sequelize = require('sequelize');
const Op = Sequelize.Op;


class NoticeService extends BaseService {
  constructor(...arg) {
    super(...arg)
    this.modelName = 'Notice'
  }
}

module.exports = NoticeService;