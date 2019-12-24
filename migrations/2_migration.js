const ContractWithVasya = artifacts.require("ContractWithVasya");

module.exports = function(deployer) {
  deployer.deploy(ContractWithVasya);
};
