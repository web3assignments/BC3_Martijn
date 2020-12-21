const { deployProxy, upgradeProxy } = require('@openzeppelin/truffle-upgrades');
var MyContract = artifacts.require("MyContract");
var MyContract2 = artifacts.require("MyContract2");

module.exports = async function(deployer) {    
    const MyContractContract=await MyContract.deployed()
    const MyContract2Contract=await upgradeProxy( MyContractContract.address, MyContract2,{ deployer });
    console.log(`Address of  MyContractContract: ${ MyContractContract.address}`)
    console.log(`Address of MyContract2Contract: ${MyContract2Contract.address}`)
    console.log("Doing some tests with the just upgraded contract");
}
