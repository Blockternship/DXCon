var Conference = artifacts.require("./Conference.sol");

module.exports = function(deployer) {
  deployer.deploy(Conference, 'FirstCon', 0xd14d6f37ff841980f0cfcdf199771ff0d283d880);
};
