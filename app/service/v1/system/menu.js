'use strict';
// app/controller/users.js
const BaseService = require("../base");


class UsersService extends BaseService {
  constructor(...arg) {
    super(...arg)
    this.modelName = 'Menus'
  }

  // 刪除id
  async destroy (id) {
    try {
      // 建立事务对象
      let transaction = await this.ctx.model.transaction();
      
      // 事务增操作
      let menus = await this.ctx.model[this.modelName].findAll({
        where: {
          parentId: id
        },
        transaction
      });
      if (menus.length) {
        throw Error('含有子元素，不能删除')
      }

      // 刪除数据
      await this.ctx.model[this.modelName].destroy({
        where: {
          id
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

module.exports = UsersService;