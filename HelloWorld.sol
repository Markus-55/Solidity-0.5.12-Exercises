pragma solidity 0.5.12;

// Make a contract helloWorld
contract helloWorld{
    
    // Make a struct person
    struct person {
        // Make a string name
        string name;
        // Make a uint age
        uint age;
        // Make a uint height
        uint height;
        // Make an address creator
        address creator;
    }
    
    // Make a private people array out of the person struct
    person[] private people;
    
    
    // creates a person with the given name, age and height
    function createPerson(string memory _name, uint _age, uint _height) public{
        
        // creates the new person from the Person struct stored in memory
        person memory newPerson;
        // The name of the new person is = to the function input _name
        newPerson.name = _name;
        // The age of the new person is = to the function input _age
        newPerson.age = _age;
        // The height of the new person is = to the function input _height
        newPerson.height = _height;
        // The creators address is = to their address
        newPerson.creator = msg.sender;
        
        // Push the new person into the array people
        people.push(newPerson);
    }
    
    //gets a person with their id and returns a string, uint, uint and an address
    function getPerson(uint id) public view returns (string memory, uint, uint, address){
        // returns the persons name, age, height and the creators address with the id of the array people
        return (people[id].name, people[id].age, people[id].height, people[id].creator);
    }
    
}
