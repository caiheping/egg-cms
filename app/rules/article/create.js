'use strict';

const rule = {
  userId: [ 
    { required: true, message: 'userId不能为空' }
  ],
  title: [
    { required: true, message: '标题不能为空' }
  ],
  subTitle: [
    { required: true, message: '副标题不能为空' }
  ],
  type: [
    { required: true, message: '类型不能为空' }
  ],
  content: [
    { required: true, message: '内容不能为空' }
  ]
};

module.exports = rule;