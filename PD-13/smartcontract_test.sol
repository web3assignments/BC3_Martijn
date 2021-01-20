pragma solidity >=0.4.22 <0.8.0;
import "remix_tests.sol"; 
import "remix_accounts.sol";
import "../smartcontract.sol";

contract testSuite {
smartcontract mc;

address constant recipient=0x2967A60973344dF17758Dd35FC6248BfA12353b0;
address constant bank=0x6A0943CfB2d00aB2B164A227534BE5fBdd49D605;
address msgsender=address(this); // during tess this contract is the sender of the msg

    function beforeAll() public {
        mc=new smartcontract();
    }

    function CheckOwner() public {
       Assert.equal(mc.owner(),msgsender,"Owner should be address of this");
    }

    function CheckBank() public  {
       Assert.equal(mc.balances(bank),1,"Initial bank balance should be 1");
       Assert.equal(mc.balances(msgsender),1,"Initial msgsender balance should be 1");
    }
    
     function CheckBuyToken() public  {
       Assert.equal(mc.balances(recipient),1,"Initial recipient balance should be 1");
       mc.buyToken(recipient,1);
       Assert.equal(mc.balances(recipient),1,"Recipient balance should now be 1");
       Assert.equal(mc.balances(msgsender),1+1,"msgsender balance should be 1+1");
    }

}
