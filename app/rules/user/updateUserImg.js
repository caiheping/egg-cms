'use strict';

const rule = {
  id: [
    { required: true, message: 'id不能为空' }
  ],
  avatar: [
    { required: true, message: '头像不能为空' }
  ]
};

module.exports = rule;