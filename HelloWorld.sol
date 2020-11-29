pragma solidity 0.5.12;

// Import the file Ownable.sol
import "./Ownable.sol";
// Import the file Destroyable.sol
import "./Destroyable.sol";

// Make a contract People that inherits from the Ownable and Destroyable contract
contract People is Ownable, Destroyable {
    
    // Make a struct Person
    struct Person {
        // Make a string name
        string name;
        // Make a uint age
        uint age;
        // Make a uint height
        uint height;
    }
    
    // Make a people mapping with the address that points to the Person struct 
    mapping(address => Person) private people;
    // Make an address array of the creators
    address[] private creators;
    
    // Creates a person with a name, age and height as an input argument
    function createPerson(string calldata _name, uint _age, uint _height) external {
        // Require the age to be < 150
        require(_age < 150, "Age needs to be below 150");
        
        // Creates a new person out of the person memory
        Person memory newPerson;
        // The new persons name is = to the input name
        newPerson.name = _name;
        // The new persons age is = to the input age
        newPerson.age = _age;
        // The new persons height is = to the input height
        newPerson.height = _height;
        
        // call the function insertPerson with the new person as an argument
        insertPerson(newPerson);
        // Push the users address into the creators array
        creators.push(msg.sender);
    }
    
    // Make a function to insert a person
    function insertPerson(Person memory newPerson) private {
        // The creators address is = to the users address
        address creator = msg.sender;
        // The creators address of the people mapping is = to the new person 
        people[creator] = newPerson;
    }
    
    // Make a function that gets a person
    function getPerson() public view returns(string memory, uint, uint){
        // The creators address is = to the users address
        address creator = msg.sender;
        // Return the name, age and height in the people mapping with the creators address
        return (people[creator].name, people[creator].age, people[creator].height);
    }
    
    // Make a function that can only be accessed by the owner, to delete a person with the creator address
    function deletePerson(address _creator) public onlyOwner {
        // delete the creator in people mapping
        delete people[_creator];
        // Assert that the age of the people with the creator address is = to 0
        assert(people[_creator].age == 0);
    }
    
    // Make a function that can only be accessed by the owner, to get a creator with their id
    function getCreator(uint _id) public view onlyOwner returns(address){
        // Returns the id of creators address array
        return creators[_id];
    }
    
}
