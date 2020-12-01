pragma solidity 0.5.12;

// Make a People contract
contract People{
    
    // Make an address owner
    address public owner;
    
    // Make a constructor
    constructor() public {
        // The owner is = to users address
        owner = msg.sender;
    }
    
    // Make a modifier onlyOwner
    modifier onlyOwner {
        // Require the users address to be == to the owner
        require(msg.sender == owner, "You are not the owner");
        _;
    }
    
    // Make a struct Person
    struct Person {
        // Make a string name
        string name;
        // Make a uint age
        uint age;
        // Make a uint height
        uint height;
    }
    
    // Make a people mapping with the address that gives back a person 
    mapping(address => Person) public people;
    
    // Create an event when a person is created with the name, age and height
    event personCreated(string name, uint age, uint height);
    // Make an event when a person is updated with the old name, age and height & the new name, age and height
    event personUpdated(string oldName, uint oldAge, uint oldHeight, string name, uint age, uint height);
    
    // Make a function that creates a person with a name, age and height
    function createPerson(string memory _name, uint _age, uint _height) internal {
    
    // If the age of the people in the mapping with the users address is == to 0
    if(people[msg.sender].age == 0){
        // The name of the people in the mapping with the users address = to the input name
        people[msg.sender].name = _name;
        // The age of the people in the mapping with the users address = to the input age
        people[msg.sender].age = _age;
        // The height of the people in the mapping with the users address = to the input height
        people[msg.sender].height = _height;
        
        // Emit the created person with the name, age and height with the users address in the people mapping
        emit personCreated(people[msg.sender].name, people[msg.sender].age, people[msg.sender].height);
    }
    // Else
    else {
        // The string variable old name = to the name in the people mapping with the users address
        string memory oldName = people[msg.sender].name;
        // The uint old age = to the age in the people mapping with the users address
        uint oldAge = people[msg.sender].age;
        // The uint old height = to the height in the people mapping with the users address
        uint oldHeight = people[msg.sender].height;
        
        // The name of the people in the mapping with the users address is = to the input name
        people[msg.sender].name = _name;
        // The age of the people in the mapping with the users address is = to the input age
        people[msg.sender].age = _age;
        // The height of the people in the mapping with the users address is = to the input height
        people[msg.sender].height = _height;
        
        // Emit the updated person with the old name, age and height & new name, age and height
        emit personUpdated(oldName, oldAge, oldHeight, people[msg.sender].name, people[msg.sender].age, people[msg.sender].height);
   
        }
    }
    
    // Make a function to get a person
    function getPerson () public view returns(string memory, uint, uint) {
        // Return the name, age and height of the people mapping with the users address
        return (people[msg.sender].name, people[msg.sender].age, people[msg.sender].height);
    }
    
    // Make a function to delete a person with the creator address
    function deletePerson(address _creator) public {
        // delete the creator in people mapping
        delete people[_creator];
        // Assert that the age of the people with the creator address is = to 0
        assert(people[_creator].age == 0);
    }
}
