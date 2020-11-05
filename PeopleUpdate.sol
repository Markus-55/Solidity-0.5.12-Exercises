pragma solidity 0.5.12;

// Make contarct HelloWorld
contract HelloWorld{
    
    // Make a struct Person
    struct Person {
        // Make a string name
        string name;
        // Make a uint age
        uint age;
        // Make a uint height
        uint height;
        // Make a boolean senior
        bool senior;
    }
    
    // Create an event when a person is created with the name and the boolean senior
    event personCreated(string name, bool senior);
    // Create an event when a person is deleted with the name, the boolean senior and the address of the one that deleted the person
    event personDeleted(string name, bool senior, address deletedBy);
    
    // Make the address of owner public 
    address public owner;
    
    // Make a modifier onlyOwner
    modifier onlyOwner(){
        // Require the users address to be the same as the owners address
        require(msg.sender == owner);
        // Continue execution
        _;
    }
    
    // Make a constructor that is public
    constructor() public{
        // Make the owner = to the owners address
        owner = msg.sender;
    }
    
    // Make a people mapping with the address that gives back a person 
    mapping(address => Person) private people;
    // Make an array with the creators addresses
    address[] private creators;
    
    // Creates a person with a name, age and height as an input argument    
    function createPerson(string memory name, uint age, uint height) public{
        // Requires the age to be less 150
        require(age < 150, "Age needs to be below 150");
        // Creates a new person out of the person memory
        Person memory newPerson;
        // The new persons name is = to the input name
        newPerson.name = name;
        // The new persons age is = to the input age
        newPerson.age = age;
        // The new persons name is = to the input height
        newPerson.height = height;
        // If the age is >= 65
        if(age >= 65){
            // The new person is a senior
            newPerson.senior = true;
        }
        else{
            // The new person is not a senior 
            newPerson.senior = false;
        }
        
        // call the function insertPerson with the new person as an argument
        insertPerson(newPerson);
        // push the users address into the creators address array
        creators.push(msg.sender);
        //people[msg.sender] == newPerson;
        // Assert that
        assert(
            // The hashed people mapping
            keccak256(
                // Takes all propertys of the person in the people mapping as arguments
                abi.encodePacked(
                    // The name of the person in the people mapping with the users address
                    people[msg.sender].name,
                    // The age of the person in the people mapping with the users address
                    people[msg.sender].age,
                    // The height of the person in the people mapping with the users address
                    people[msg.sender].height,
                    // The boolean senior in the people mapping with the users address
                    people[msg.sender].senior
                )
            ) 
            // Compare it with
            ==
            // The hashed new person
            keccak256(
                // Takes all propertys of the new person as arguments
                abi.encodePacked(
                    // The new persons name
                    newPerson.name,
                    // The new persons age
                    newPerson.age,
                    // The new persons height
                    newPerson.height,
                    // The new persons boolean senior
                    newPerson.senior
                )
            )
        );
        
        // emit the person that was created with the new persons name and senior boolean
        emit personCreated(newPerson.name, newPerson.senior);
    }
    
    // Make a function to insert a person
    function insertPerson(Person memory newPerson) private {
        // The creators address is = to the users address
        address creator = msg.sender;
        // The creators address of the people mapping is = to the new person 
        people[creator] = newPerson;
    }
    
    // gets a person with their name, age, height and the boolean senior 
    function getPerson() public view returns(string memory name, uint age, uint height, bool senior){
        // The creators address is = to the users address
        address creator = msg.sender;
        // Return the name, age, height and boolean senior in the people mapping with the creators address
        return (people[creator].name, people[creator].age, people[creator].height, people[creator].senior);
    }
    
    // Deletes a person, the person can only be deleted by the owner 
    function deletePerson(address creator) public onlyOwner {
        string memory name = people[creator].name;
        bool senior = people[creator].senior;
        
        // deletes the person in the people mapping with the creators address
        delete people[creator];
        // Asserts that the age in the mapping with the creators address is == 0 
        assert(people[creator].age == 0);
        // emit the person that was deleted with the persons name, senior boolean and address
        emit personDeleted(name, senior, msg.sender);
    }
    
    // Creates a function that gets the creators id, the function can only be accesed by the owner
    function getCreator(uint id) public view onlyOwner returns(address){
        // Return the creators address by id
        return creators[id];
    }
    
    
    
}
