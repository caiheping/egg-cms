const os = require('os');

module.exports = {
  get info(){
    const data = {
      memory: os.totalmem() / 1024 / 1024 / 1024 + 'G',
      platform: os.platform(),
      cpus: os.cpus().length,
      url: this.request.url
    };
    return data;
  }
};