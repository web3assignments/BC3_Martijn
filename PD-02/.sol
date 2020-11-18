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
      string _firstName;
      string _lastName;
      
    }
    
    constructor()public {
        owner = msg.sender;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public onlyOwner {
      unit [id] = people.push(Person(_firstName, _lastName)) + 1;
       onlyToOwner [id] = msg.sender;
      
    }
    
}
