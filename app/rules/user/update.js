'use strict';

const rule = {
  id: [
    { required: true, message: '用户id不能为空' }
  ],
  userName: [
    { required: true, message: '用户名不能为空' }
  ],
  password: [
    { required: true, message: '密码不能为空' }
  ],
  deptId: [
    {
      required: true,
      message: 'deptId不能为空'
    }
  ],
  roleIds: [
    {
      required: true,
      type: 'array',
      message: 'roleIds不能为空'
    }
  ]
};

module.exports = rule;