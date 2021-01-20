// SPDX-License-Identifier: MIT
pragma solidity ^0.6.1;


contract Mycontract {
    mapping(address => uint) public balances;
    
    address public owner = msg.sender;
    

  modifier restricted() {
    require(
      msg.sender == owner
    );
    _;
  }
 address payable wallet;
 
 
    event Purchase(
        address indexed _buyer,
        uint _amount
    );

    constructor(address payable _wallet) public  {
        wallet = _wallet;
        balances[msg.sender] = 1;
        balances[0x6A0943CfB2d00aB2B164A227534BE5fBdd49D605] = 1;  
    }

    function _fallback() external payable {
        buyToken();
    }

    function buyToken() public payable restricted {
        balances[msg.sender] += 1;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
        
    }
}
