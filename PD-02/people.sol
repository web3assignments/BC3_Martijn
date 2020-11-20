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
      uint _age;
      
    }
    
    constructor()public {
        owner = msg.sender;
          
    }
 
    Person[] public people;
    
    function addPerson(string memory _firstName, string memory _lastName, uint _age) public onlyOwner returns (uint) {
        people.push(Person(_firstName, _lastName, _age));
        return  people.length - 1;
        
    }
    
    function adultTest(Person memory _people) public returns (string memory){
    string memory adult;
   if (_people.personAge >=18 == true)
     adult = "You are a adult";
    else
  adult = "U are not a adult";
    }
   
   
}
