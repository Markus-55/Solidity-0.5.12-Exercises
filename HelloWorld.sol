pragma solidity 0.5.12;

// Make a contract helloWorld
contract helloWorld{
    
    // Make a struct person
    struct Person {
        // Make an address creator
        address creator;
        // Make a string name
        string name;
        // Make a uint age
        uint age;
        // Make a uint height
        uint height;
    }
    
    // Creates a public numOfPeopleByAddr mapping with the address that gives back a uint
    mapping(address => uint) public numOfPeopleByAddr;
    
    // Create a private people array with the Person struct
    Person[] private people;

    // Creates a person with the given name, age and height
    function createPerson(string memory _name, uint _age, uint _height) public{

        // Creates the new person from the person struct stored in memory
        Person memory newPerson;
        // The creators address is = their own address
        newPerson.creator = msg.sender;
        // The name of the new person is = to the function input _name
        newPerson.name = _name;
        // The age of the new person is = to the function input _age
        newPerson.age = _age;
        // The height of the new person is = to the function input _height
        newPerson.height = _height;

        // The creators address of the people mapping is = to the new person
        people.push(newPerson);
        
        // The users address of the numOfPeopleByAddr mapping += 1
        numOfPeopleByAddr[msg.sender] += 1;
        
    }
    
    // Gets a person and returns the string name, uint age and uint height
    function getPerson(uint id) public view returns (string memory _name, uint _age, uint _height, address creator){

        // returns the persons name, age and height of the people mapping with the creators address 
        return (people[id].name, people[id].age, people[id].height, people[id].creator);
    }
    
    // Make a function returnIds and returns the uint array memory
    function returnIds() private view returns (uint[] memory){
        
        // The uint array memory result = to the new uint array numOfPeopleByAddr mapping from the users address
        uint[] memory result = new uint[](numOfPeopleByAddr[msg.sender]);
        // uint creator
        uint k;
        // The loop starts at 0 and ends at the max length of the people array
        for (uint i=0; i<people.length;i++) {
            // if the people index is == to the users address
            if(people[i].creator == msg.sender) {
                // The result of the creator is = to the index
                result[k] = i;
                // creator +1
                k++;
            }
        }
        // Returns the result
        return result;
    }
    
}
