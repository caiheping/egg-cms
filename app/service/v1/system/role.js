'use strict';

const BaseService = require("../base");
const { getDeptWhere } = require("../../../utils/tools");
const Sequelize = require('sequelize');
const Op = Sequelize.Op;


class UsersService extends BaseService {
  constructor(...arg) {
    super(...arg)
    this.modelName = 'Roles'
  }

  // 查询, 传页面，分页返回，否则全部返回
  async findList(query, order=[['createdAt', 'DESC']]) {
    // 部门权限控制
    let where = getDeptWhere(this.ctx);
    let users = await this.ctx.model["Users"].findAll({
      where
    });

    let userIds = users.map(item => item.id);

    let roles = await this.ctx.model['UserRole'].findAll({
      where: {
        userId: {
          [Op.or]: userIds
        }
      }
    });
    let roleIds = roles.map(item => item.roleId)

    if (query.offset) {
      query.limit = query.limit ? query.limit : 10
      query.offset = (query.offset - 1) * query.limit
    } else {
      query.limit = null
      query.offset = null
    }
    let obj = {
      where: {},
      order
    }
    for (let key in query) {
      if (key !== 'limit' && key !== 'offset') {
        if (!query[key]) {
          query[key] = ''
        }
        obj.where[key] = {
          [Op.like]:'%' + query[key] + '%'
        }
      }
    }

    obj.where.id = {
      [Op.or]: roleIds
    }

    return await this.ctx.model[this.modelName].findAndCountAll(obj);
  }

  // 查询某条数据
  async findOne (id) {
    return await this.ctx.model[this.modelName].findOne({
      where: {
        id
      },
      include: [{
        model: this.ctx.model['Menus'],
        as: 'menus'
      }]
    })
  }

  // 新增
  async create (query) {
    try {
      // 创建事务
      let transaction = await this.ctx.model.transaction();

      let role = await this.ctx.model[this.modelName].create(query, {
        transaction
      })

      let menuIds = this.ctx.request.body['menuIds']
      let menuQuery = []
      for (let i = 0; i < menuIds.length; i++) {
        let obj = {}
        obj.menuId = menuIds[i]
        obj.roleId = role.id
        menuQuery.push(obj)
      }

      // 事务批量增操作
      await this.ctx.model.RoleMenu.bulkCreate(menuQuery, {
        transaction
    });
    // 提交事务
    await transaction.commit();
    } catch (error) {
      this.ctx.throw(500, '服务器错误') 
    }
  }

  // 修改
  async update (query, where) {
    try {
      // 建立事务对象
      let transaction = await this.ctx.model.transaction();
      
      // 事务增操作
      await this.ctx.model[this.modelName].update(query, {
        where,
        transaction
      });
      await this.ctx.model.RoleMenu.destroy({
        where: {
          roleId: where.id
        },
        transaction
      })
      let menuIds = this.ctx.request.body['menuIds']
      console.log(menuIds, 111)
      let menuQuery = []
      for (let i = 0; i < menuIds.length; i++) {
        let obj = {}
        obj.menuId = menuIds[i]
        obj.roleId = where.id
        menuQuery.push(obj)
      }

      console.log(menuQuery)
      // 事务批量增操作
      await this.ctx.model.RoleMenu.bulkCreate(menuQuery, {
          transaction
      });
      // 提交事务
      await transaction.commit();
      return true
    } catch (error) {
      this.ctx.throw(500, '服务器错误');
    }
  }

  // 删除
  async destroy (ids) {
    try {
      // 建立事务对象
      let transaction = await this.ctx.model.transaction();
      
      await this.ctx.model[this.modelName].destroy({
        where: {
          id: {
            [Op.or]: ids
          }
        },
        transaction
      });
      await this.ctx.model.RoleMenu.destroy({
        where: {
          roleId: {
            [Op.or]: ids
          }
        },
        transaction
      })
      // 提交事务
      await transaction.commit();
      return true
    } catch (error) {
      this.ctx.throw(500, '服务器错误') 
    }
  }
}

module.exports = UsersService;