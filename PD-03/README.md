pragma solidity 0.5.1;

contract MyContract {
    mapping(address => uint) public balances

    event Purchase(
        address indexed _buyer,
        uint _amount
    );

    constructor(address payable _wallet) public {
        wallet = _wallet;
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
