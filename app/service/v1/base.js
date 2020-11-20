'use strict';

const Service = require('egg').Service;
const Sequelize = require('sequelize');
const Op = Sequelize.Op;

class BaseService extends Service {
  // 查询, 传页面，分页返回，否则全部返回
  async findList(query) {
    if (query.offset) {
      query.limit = query.limit ? query.limit : 10
      query.offset = (query.offset - 1) * query.limit
    } else {
      query.limit = null
      query.offset = null
    }
    let obj = {
      where: {}
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
    
    return await this.ctx.model[this.modelName].findAndCountAll(obj);
  }

  // 查询某条数据
  async findByPk (id) {
    return await this.ctx.model[this.modelName].findByPk(id);
  }

  // 新增
  async create (query) {
    return await this.ctx.model[this.modelName].create(query);
  }

  // 修改
  async update (query, where) {
    return await this.ctx.model[this.modelName].update(query, {
      where
    });
  }

  // 删除
  async destroy (ids) {
    return await this.ctx.model[this.modelName].destroy({
      where: {
        id: {
          [Op.or]: ids
        }
      }
    })
  }
}

module.exports = BaseService;