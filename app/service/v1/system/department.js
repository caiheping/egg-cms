'use strict';

const BaseService = require("../base");
const Sequelize = require('sequelize');
const Op = Sequelize.Op;


class DepartmentsService extends BaseService {
  constructor(...arg) {
    super(...arg)
    this.modelName = 'Departments'
  }

  // 刪除id
  async destroy (deptId) {
    try {
      // 建立事务对象
      let transaction = await this.ctx.model.transaction();
      
      // 事务增操作
      let menus = await this.ctx.model[this.modelName].findAll({
        where: {
          parentId: deptId
        },
        transaction
      });
      if (menus.length) {
        throw Error('含有子元素，不能删除')
      }

      // 刪除数据
      await this.ctx.model[this.modelName].destroy({
        where: {
          deptId
        }
      })
      // 提交事务
      await transaction.commit();
      return true
    } catch (error) {
      this.ctx.throw(500, error)
    }
  }
}

module.exports = DepartmentsService;