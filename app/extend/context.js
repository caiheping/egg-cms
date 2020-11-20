'use strict';
const httpCode = require('../utils/http-code');

module.exports = {
  // response通用返回
  returnBody(data = null, code = 0) {
    this.body = {
      code,
      message: httpCode[code] ? httpCode[code] : 'success',
      data
    };
  },
};