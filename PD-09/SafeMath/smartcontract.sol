pragma solidity 0.5.1;

import "./SafeMath.sol";

contract MyContract {
    mapping(address => uint256) public balances;
	
using SafeMath for uint256;

 address owner;
 address payable wallet;
 
 uint256 startTime;

    modifier onlyWhileOpen() {
        require(block.timestamp >= startTime);
        _;
    }

    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );

    constructor(address payable _wallet) public {
        wallet = _wallet;
         owner = msg.sender;
    startTime = 1606128173;
    }

    function() external payable {
        buyToken();
    }

    function buyToken() public payable {
        balances[msg.sender] += 1;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
        
    }
}   