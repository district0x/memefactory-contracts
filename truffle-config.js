'use strict';

module.exports = {
  networks: {
    ganache: {
      host: 'localhost',
      port: 8549,
      gas: 8e6, // gas limit
      gasPrice: 2e10, // 20 gwei, default for ganache
      network_id: '*'
    },
    ropsten: {
      host: 'localhost',
      port: 8545,
      gas: 8e6,
      gasPrice: 4e9, // 4 gwei
      network_id: '*'
    }
  },
  compilers: {
    solc: {
      version: "0.4.24"
    }
  }
};
