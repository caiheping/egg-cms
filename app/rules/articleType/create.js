'use strict';

const rule = {
  userId: [ 
    { required: true, message: 'userId不能为空' }
  ],
  title: [
    { required: true, message: '名称不能为空' }
  ],
  key: [
    { required: true, message: 'key不能为空' }
  ],
  orderNum: [
    { required: true, message: '显示排序不能为空' }
  ]
};

module.exports = rule;