// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.7.0;
import "remix_tests.sol"; // injected by remix-tests
import "../smartcontract.sol";

contract MyTest {
  smartcontract foo;

  function beforeEach() public {
    foo = new SimpleStorage();
  }

  function initialValueShouldBe100() public returns (bool) {
    return Assert.equal(foo.get(), 100, "initial value is not correct");
  }

  function valueIsSet200() public returns (bool) {
    foo.set(200);
    return Assert.equal(foo.get(), 200, "value is not 200");
  }

  function valueIsNotSet200() public returns (bool) {
    return Assert.notEqual(foo.get(), 200, "value is 200");
  }
  
address constant recipient=0x2967A60973344dF17758Dd35FC6248BfA12353b0;
address constant bank=0x6A0943CfB2d00aB2B164A227534BE5fBdd49D605;
address msgsender=address(this); // during tess this contract is the sender of the msg

    function beforeAll() public {
        mc=new smartcontract();
    }

    function CheckOwner() public {
       Assert.equal(mc.owner(),msgsender,"Owner should be address of this");
    }
  
}
