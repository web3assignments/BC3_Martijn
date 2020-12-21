pragma solidity ^0.5.12;
import "@openzeppelin/upgrades-core/contracts/Initializable.sol";

contract MyContract is Initializable {

uint256 value;
function initialize(uint256 initialValue) public initializer{
value = initialValue;
}

    mapping(address => uint256) public balances;
	


 address owner;
 address payable wallet;
 
 //uint256 startTime;

   // modifier onlyWhileOpen() {
   //     require(block.timestamp >= startTime);
   //     _;
   // }

    event Purchase(
        address indexed _buyer,
        uint256 _amount
    );

    function initialize(address payable _wallet) public {
        wallet = _wallet;
         owner = msg.sender;
    //startTime = 1606128173;
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