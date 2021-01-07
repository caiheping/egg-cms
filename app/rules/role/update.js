'use strict';

const rule = {
  id: [
    { required: true, message: 'id不能为空' }
  ],
  roleName: [ 
    { required: true, message: '角色名称不能为空' }
  ],
  roleKey: [
    { required: true, message: '角色权限字符串不能为空' }
  ],
  roleSort: [
    { required: true, message: '显示顺序不能为空' }
  ]
};

module.exports = rule;