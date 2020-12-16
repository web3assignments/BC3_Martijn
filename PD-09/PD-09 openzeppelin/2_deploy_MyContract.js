

const { deployProxy } = require('@openzeppelin/truffle-upgrades');

var MyContract = artifacts.require("MyContract");

module.exports = async function(deployer) {
    const MyContractContract = await deployProxy(MyContract, [42], { deployer });
    console.log(`Address of MyContractContract: ${MyContractContract.address}`)
    console.log("Doing some tests with the just deployed contract");
    var bnx=await MyContractContract.result() // note result is Big Number
    console.log(`Initialized with 42, X is now ${bnx.toString()}`)
    await MyContractContract.set(3)    
    var bnx=await MyContractContract.result() // note result is Big Number
    console.log(`Called function set(3), X is now ${bnx.toString()}`)
};