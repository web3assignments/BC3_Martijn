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
        
    }

    function _fallback() external payable {
        buyToken();
    }

    function buyToken() public payable {
        balances[msg.sender] += 1;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
        
    }
}
