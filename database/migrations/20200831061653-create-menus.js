'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    const { INTEGER, DATE, STRING } = Sequelize;
    await queryInterface.createTable('menus', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: INTEGER
      },
      parentId: {
        allowNull: false,
        type: INTEGER,
        comment: '父Id'
      },
      title: {
        allowNull: false,
        type: STRING,
        comment: '菜单名称'
      },
      path: {
        type: STRING,
        comment: '菜单路径'
      },
      name: {
        type: STRING,
        comment: '名称'
      },
      component: {
        type: STRING,
        comment: '组件路径'
      },
      isFrame: {
        type: STRING,
        defaultValue: '1',
        comment: '是否为外链（0是 1否）'
      },
      menuType: {
        type: STRING,
        defaultValue: 'M',
        comment: '菜单类型（M目录 C菜单 F按钮）'
      },
      visible: {
        type: STRING,
        defaultValue: '0',
        comment: '菜单显示状态（0显示 1隐藏）'
      },
      orderNum: {
        allowNull: false,
        type: INTEGER,
        comment: '显示顺序'
      },
      status: {
        type: STRING,
        defaultValue: '0',
        comment: '菜单状态（0正常 1停用）'
      },
      perms: {
        type: STRING,
        comment: '权限标识'
      },
      icon: {
        type: STRING,
        defaultValue: '#',
        comment: '图标'
      },
      isDelete: {
        type: STRING,
        defaultValue: '0',
        comment: '删除标志（0代表存在 1代表删除）'
      },
      remark: {
        type: STRING,
        comment: '备注'
      },
      createdAt: {
        allowNull: true,
        type: DATE,
        comment: '创建时间'
      },
      createdBy: {
        allowNull: true,
        type: STRING,
        comment: '创建者'
      },
      updatedAt: {
        allowNull: true,
        type: DATE,
        comment: '更新时间'
      },
      updatedBy: {
        allowNull: true,
        type: STRING,
        comment: '更新者'
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('menus');
  }
};