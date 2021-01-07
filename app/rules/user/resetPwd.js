'use strict';

const rule = {
  id: [
    { required: true, message: 'id不能为空' }
  ],
  newPassword: [
    { required: true, message: '密码不能为空' }
  ]
};

module.exports = rule;