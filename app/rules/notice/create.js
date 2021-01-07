'use strict';

const rule = {
  noticeTitle: [
    { required: true, message: '公告标题不能为空' }
  ],
  noticeType: [
    { required: true, message: '公告类型不能为空' }
  ],
  noticeContent: [
    { required: true, message: '内容不能为空' }
  ]
};

module.exports = rule;