'use strict';

/** @type Egg.EggPlugin */
module.exports = {
  sequelize: {
    enable: true,
    package: 'egg-sequelize'
  },
  // 加密
  bcrypt: {
    enable: true,
    package: 'egg-bcrypt'
  },
  // 验证
  validatePlus: {
    enable: true,
    package: 'egg-validate-plus',
  }
};
