'use strict';
module.exports = {
  // 转数字类型
  parseInt(string) {
    if (typeof string === 'number') return string;
    if (!string) return string;
    return parseInt(string) || 0;
  }
};