pragma solidity 0.5.12;

// Make contract HelloWorld
contract HelloWorld{
    
    // Make a struct Person
    struct Person {
        // Make a string name
        string name;
        // Make a uint age
        uint age;
        // Make a uint height
        uint height;
    }
    
    // Create an event when a person is created with the name, age and height
    event personCreated(string name, uint age, uint height);
    
    // Make an event when a person is updated with the old name, age and height & the new name, age and height
    event personUpdated(string oldName, uint oldAge, uint oldHeight, string name, uint age, uint height);
    
    // Make a people mapping with the address that gives back a person 
    mapping(address => Person) private people;
    
    // Make a function that creates a person with a name, age, height
    function createPerson(string memory _name, uint _age, uint _height) public{
    
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
        // The uint old height = to the 
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
    // Make a function getPerson that returns a string memory, and two uint
    function getPerson () public view returns (string memory, uint, uint) {
        // Return the name, age and height of the people mapping with the users address
        return (people[msg.sender].name, people[msg.sender].age, people[msg.sender].height);
    }

}
