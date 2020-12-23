// SPDX-License-Identifier: MIT
pragma solidity ^0.6.1;


contract Mycontract {
    mapping(address => uint) public balances;
    
     modifier onlyOwner() {
    require(msg.sender == owner);
    _;
    }

 address owner;
 address payable wallet;
 
 uint startTime;

    modifier onlyWhileOpen() {
        require(block.timestamp >= startTime);
        _;
    }

    event Purchase(
        address indexed _buyer,
        uint _amount
    );

    constructor(address payable _wallet) public  {
        wallet = _wallet;
         owner = msg.sender;
    startTime = 1606128173;
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
