// Import the file Ownable.sol
import "./Ownable.sol";
// Import the file Destroyable.sol
import "./Destroyable.sol";

pragma solidity 0.5.12;

// Make contarct HelloWorld
contract HelloWorld is Ownable, Destroyable {
    
    // Make a struct Person
    struct Person {
        // Make a string name
        string name;
        // Make a uint age
        uint age;
        // Make a uint height
        uint height;
    }
    
    // Make a uint variable balance
    uint public balance;
    
    // Make a modifier that costs in the correct cost
    modifier costs(uint cost){
        // Require the users value to be >= to the cost
        require(msg.value >= cost);
        // Continue the execution
        _;
    }
    
    // Make a people mapping with the address that gives back a person 
    mapping(address => Person) private people;
    // Make an address array of the creators
    address[] private creators;
    
    // Creates a person with a name, age and height as an input argument that is payable and costs 1 ether
    function createPerson(string memory _name, uint _age, uint _height) public payable costs(1 ether) {
        // Require the age to be < 150
        require(_age < 150, "Age needs to be below 150");
        // Save the users value in the balance
        balance += msg.value;
        
        // Creates a new person out of the person memory
        Person memory newPerson;
        // The new persons name is = to the input name
        newPerson.name = _name;
        // The new persons age is = to the input age
        newPerson.age = _age;
        // The new persons height is = to the input height
        newPerson.height = _height;
    }
    
    // Make a function to insert a person
    function insertPerson(Person memory newPerson) private {
        // The creators address is = to the users address
        address creator = msg.sender;
        // The creators address of the people mapping is = to the new person 
        people[creator] = newPerson;
    }
    
    // gets a person with their name, age and height
    function getPerson() public view returns(string memory name, uint age, uint height){
        // The creators address is = to the users address
        address creator = msg.sender;
        // Return the name, age and height in the people mapping with the creators address
        return (people[creator].name, people[creator].age, people[creator].height);
    }
    
    // Make a function that can only be accessed by the owner and to delete a person with the creator address
    function deletePerson(address _creator) public onlyOwner {
        
        // delete the people mapping with the creators address array
        delete people[_creator];
        // Assert that the age of the people is = to 0
        assert(people[_creator].age == 0);
    }
    
    // Make a function that can only be accessed by the owner, to get a creator with their id and that returns an id
    function getCreator(uint _id) public view onlyOwner returns(address){
        // Returns the creators with their id
        return creators[_id];
    }
    
    // Make function that can only be accessed by the owner, to withdraw everything and returns a uint
    function withdrawAll() public onlyOwner returns(uint) {
        // The balance is updated to 0
        balance = 0;
        // Transfer the balance to the users address
        msg.sender.transfer(balance);
    }
}
