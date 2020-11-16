pragma solidity 0.5.1;

contract myContract {
    uint public peopleCount = 0;
    mapping(uint => Person) public people;
    
    address owner;
    
    modifier onlyOwner() {
    require(msg.sender == owner);
    _;
    }
 
    struct Person {
      uint _id;
      string _firstName;
      string _lastName;
      
    }
    
    constructor()public {
        owner = msg.sender;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public onlyOwner {
        incrementCount();
        peopleCount += 1;
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }
    function incrementCount() internal {
    peopleCount += 1;
    }
    
}
