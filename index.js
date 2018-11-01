'use strict';

const { Contracts } = require('zos-lib')

const MemeRegistryDb = Contracts.getFromLocal('EternalDb');
// const Registry = Contracts.getFromLocal('Registry');
// const MiniMeTokenFactory = Contracts.getFromLocal('MiniMeTokenFactory');
// const Dank = Contracts.getFromLocal('DankToken');
// const MemeToken = Contracts.getFromLocal('MemeToken');
// const MemeFactory = Contracts.getFromLocal('MemeFactory');

const AdminUpgradeabilityProxy = Contracts.getFromNodeModules('zos-lib', 'AdminUpgradeabilityProxy');

module.exports = async function() {

  console.log('Deploying MemeRegistryDb ...');
  let memeRegistryDbContract = await MemeRegistryDb.new();

  console.log('Deploying a proxy pointing to MemeRegistryDb ...');
  const memeRegistryDbProxy = await AdminUpgradeabilityProxy.new(memeRegistryDbContract.address);

  console.log('Initializing MemeRegistryDb proxy...');
  let memeRegistryDb = await memeRegistryDbContract.at(memeRegistryDbProxy.address);
  await memeRegistryDb.initialize();

  console.log('Upgrading MemeRegistryDb ...');
  memeRegistryDbContract = await memeRegistryDb.new();
  await memeRegistryDbProxy.upgradeTo(memeRegistryDbContract.address);
  memeRegistryDb = await memeRegistryDbContract.at(memeRegistryDbProxy.address);

  console.log('Done.');
};
