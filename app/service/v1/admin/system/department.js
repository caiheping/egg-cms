'use strict';

const BaseService = require("../../base");


class Service extends BaseService {
  constructor(...arg) {
    super(...arg)
    this.modelName = 'Departments'
  }

  // 刪除id
  async destroy (deptId) {
    // 建立事务对象
    const transaction = await this.ctx.model.transaction();
    try {
      // 事务增操作
      let depts = await this.ctx.model[this.modelName].findAll({
        where: {
          parentId: deptId
        },
        transaction
      });
      if (depts.length) {
        throw Error('含有子元素，不能删除')
      }

      // 判断该部门是否有用户
      let users = await this.ctx.model['Users'].findAll({
        where: {
          deptId
        },
        transaction
      });

      if (users.length) {
        throw Error('该部门还有用户，不能删除')
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
      transaction.rollback();
      this.ctx.throw(500, error)
    }
  }
}

module.exports = Service;