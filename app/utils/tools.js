
const Sequelize = require('sequelize');
const Op = Sequelize.Op;
const fs = require('fs');
const path = require('path');

// 校验有 /* 的白名单
function checkWhiteList(ctx, list) {
  list = list.map(item => item.substring(0, item.lastIndexOf('/*')))
  let flag = false
  list.forEach(item => {
    if (item === ctx.request.path.substring(0, item.length)) {
      flag = true
    }
  })
  return flag
}

// 递归创建目录 同步方法
function mkdirsSync(dirname) {
  if (fs.existsSync(dirname)) {
    return true;
  } else {
    if (mkdirsSync(path.dirname(dirname, '/'))) {
      fs.mkdirSync(dirname);
      return true;
    }
  }
}

/**
 *
 * @param data 数据源
 * @param id字段 默认 'id'
 * @param parentId 父节点字段 默认 'parentId'
 * @param children 孩子节点字段 默认 'children'
 * @param rootId 根Id 默认 0
 * @returns {{obj, list: Array}}
 */
function handleTree (data, id = 'id', parentId = 'parentId', children = 'children', rootId = 0) {
  const obj = {}
  data.forEach(item => {
    item[children] = []
    obj[item[id]] = item
  })
  const tree = []
  data.forEach(list => {
    if (list[parentId] !== rootId) {
      obj[list[parentId]][children].push(list)
    } else {
      tree.push(list)
    }
  })
  return {
    tree,
    obj
  }
}

// 获取本部门及以下id
function getIdLists (arr, ids = [], id='id') {
  for (let i = 0; i < arr.length; i++) {
    if (arr[i].children.length) {
      ids.push(arr[i][id])
      getIdLists(arr[i].children, ids, id)
    } else {
      ids.push(arr[i][id])
    }
  }
  return ids
}

// 返回部门的查询条件
function getDeptWhere (ctx, where = {}) {
  let dataScopeList = ctx.state.user.roles.map(item => parseInt(item.dataScope))
  let dataScope = Math.max(...dataScopeList)
  if (dataScope === 1) { // 部门及以下权限
    if (where.deptId) {
      where.deptId = {
        [Op.or]: getIdLists(ctx.state.departmentsObj.obj[where.deptId].children, [where.deptId], 'deptId')
      }
    } else {
      where.deptId = {
        [Op.or]: getIdLists(ctx.state.departmentsObj.obj[ctx.state.user.deptId].children, [ctx.state.user.deptId], 'deptId')
      }
    }
  } else if (dataScope === 2) { // 部门权限
    where.deptId = {
      [Op.or]: [ctx.state.user.deptId]
    }
  } else { // 本人权限
    where.deptId = {
      [Op.or]: [ctx.state.user.deptId]
    }
    where.id = ctx.state.user.id
  }
  return where
}

module.exports = {
  checkWhiteList,
  handleTree,
  getDeptWhere,
  mkdirsSync
}