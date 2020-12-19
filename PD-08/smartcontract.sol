// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "github.com/provable-things/ethereum-api/provableAPI_0.6.sol";

contract MyContract is usingProvable {
    mapping(address => uint) public balances;

 address owner;
 address payable wallet;
 string public EUR;
uint256 public priceOfUrl;
 
 uint startTime;

    modifier onlyWhileOpen() {
        require(block.timestamp >= startTime);
        _;
    }

    event Purchase(
        address indexed _buyer,
        uint _amount
    );

    constructor(address payable _wallet) public {
        wallet = _wallet;
         owner = msg.sender;
    startTime = 1606128173;
    }

function __callback(bytes32 /* myid prevent warning*/ , string memory result ) override public {
if (msg.sender != provable_cbAddress()) revert();
EUR = result;
}

function getEUR() public payable {
priceOfUrl = provable_getPrice("URL");
require (address(this).balance >= priceOfUrl,
"please add some ETH to cover for the query fee");
provable_query("URL",
"json(https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=EUR).EUR");

}



    function fallback() external payable {
        buyToken();
    }

    function buyToken() public payable {
        balances[msg.sender] += 1;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
        
    }
}
