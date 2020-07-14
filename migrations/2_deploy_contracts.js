const checkList = artifacts.require("checkList");

module.exports = function(deployer) {
  deployer.deploy(checkList);
};
