pragma solidity 0.5.1;

contract myContract {
    Person[]public people;
    
    
    return people.length;
    
    
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
      
    }
    mapping (uint => address) public onlyToOwner;
    
   unit [id] = people.push(Person(_firstName, _lastName)) + 1; {
    unit id = people.length - 1; 
    onlyToOwner [id] = msg.sender;
      
    }
}
