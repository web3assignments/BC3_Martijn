pragma solidity 0.5.1;

contract myContract {
   
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
  
    Person[] public people;
    
    function addPerson(string memory _firstName, string memory _lastName) public returns (uint) {
        people.push(Person(_firstName, _lastName));
        return  people.length - 1;
   
    }
}


