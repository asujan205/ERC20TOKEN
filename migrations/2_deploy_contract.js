const Erc20Token = artifacts.require("Erc20Token");
const Erc20Tokensale= artifacts.require("ERC20Tokensale")
module.exports = function(deployer) {
  deployer.deploy(Erc20Token).then(function(){
    return deployer.deploy(Erc20Tokensale, Erc20Token.address,10000000000)
  });
};
