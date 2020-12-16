const { deployProxy, upgradeProxy } = require('@openzeppelin/truffle-upgrades');
var MyContract = artifacts.require("MyContract");
var MyContract2 = artifacts.require("MyContract2");

module.exports = async function(deployer) {    
    const MyContractContract=await MyContract.deployed()
    const MyContract2Contract=await upgradeProxy( MyContractContract.address, MyContract2,{ deployer });
    console.log(`Address of  MyContractContract: ${ MyContractContract.address}`)
    console.log(`Address of MyContract2Contract: ${MyContract2Contract.address}`)
    console.log("Doing some tests with the just upgraded contract");
    await MyContract2Contract.set(5)
    var bnx=await MyContract2Contract.result() // note result is Big Number
    console.log(`Called function set(5), X is now ${bnx.toString()}`)
    await MyContract2Contract.set2(5)
    var bnx=await MyContract2Contract.result() // note result is Big Number
    console.log(`Called function set2(5), X is now ${bnx.toString()}`)
}