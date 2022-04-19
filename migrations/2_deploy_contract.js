const Erc20Token = artifacts.require("Erc20Token");

module.exports = function(deployer) {
  deployer.deploy(Erc20Token);
};
