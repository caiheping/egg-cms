'use strict';

module.exports = app => {
  const { STRING, INTEGER, DATE } = app.Sequelize;

  const Notice = app.model.define('notice', {
    id: {
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
      type: INTEGER
    },
    noticeTitle: {
      allowNull: false,
      type: STRING,
      comment: '公告标题'
    },
    noticeType: {
      allowNull: false,
      type: STRING,
      defaultValue: '1',
      comment: '公告类型（1通知 2公告）'
    },
    noticeContent: {
      allowNull: false,
      type: STRING,
      comment: '公告内容'
    },
    status: {
      type: STRING,
      defaultValue: '1',
      comment: '公告状态（1正常 0停用）'
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
  return Notice;
};