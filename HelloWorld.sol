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
    }
    
    // Creates a private people mapping with the address that gives back a person
    mapping(address => person) private people;

    // Creates a person with the given name, age and height
    function createPerson(string memory _name, uint _age, uint _height) public{
        // The creators address is = to their own address
        address creator = msg.sender;

        // Creates the new person from the person struct stored in memory
        person memory newPerson;
        // The name of the new person is = to the function input _name
        newPerson.name = _name;
        // The age of the new person is = to the function input _age
        newPerson.age = _age;
        // The height of the new person is = to the function input _height
        newPerson.height = _height;

        // The creators address of the people mapping is = to the new person
        people[creator] = newPerson;
    }
    
    // Gets a person and returns the string name, uint age and uint height
    function getPerson() public view returns(string memory _name, uint _age, uint _height){
        // The creators address is = to their own address
        address creator = msg.sender;
        // returns the persons name, age and height of the people mapping with the creators address 
        return (people[creator].name, people[creator].age, people[creator].height);
    }
    
}
