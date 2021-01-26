// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
import "github.com/provable-things/ethereum-api/provableAPI_0.6.sol";


contract Mycontract is usingProvable {
    mapping(address => uint256) public balances;
    uint256 public storedData;
    address public owner = msg.sender;
   string public EUR;
    uint256 public priceOfUrl;
    
function destroy() public {
    selfdestruct(msg.sender);
}

  modifier restricted() {
    require(
      msg.sender == owner
    );
    _;
  }
 address payable wallet;
 
 
    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );

    constructor(address payable _wallet) public  {
        wallet = _wallet;
         storedData = 100;
         
         balances[msg.sender] = 1;
        balances[0x6A0943CfB2d00aB2B164A227534BE5fBdd49D605] = 1;
    }

    function _fallback() external payable {
        buyToken();
    }

function set(uint x) public {
    storedData = x;
  }

  function get() public view returns (uint retVal) {
    return storedData;
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

    function buyToken() public payable restricted {
        balances[msg.sender] += 1;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
        
    }
}
