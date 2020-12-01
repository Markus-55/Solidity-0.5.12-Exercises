pragma solidity 0.5.12;

// Import the file People.sol
import "./People.sol";

// Make a contract Workers inherit from the people contract
contract Workers is People {
    
    // Make a salary mapping with an address that points to a uint
    mapping(address => uint) public salary;
    // Make a bossOf mapping with an address that points to a address
    mapping(address => address) public bossOf;

    // Make a function to create a worker with a name, age, height, salary and the boss address
    function createWorker(string memory _name, uint _age, uint _height, uint _salary, address _boss) public {
        // Require the age to not exceed 75 and that the boss is not = to users address
        require(_age <= 75 && _boss != msg.sender);
        
        // Call function createPerson with a name, age and height as argument
        createPerson(_name, _age, _height);
        // The users address in the salary mapping is = to the input salary
        salary[msg.sender] = _salary;
        // The users address in the bossOf mapping is = to the input boss
        bossOf[msg.sender] = _boss;
    }
    
    // Make a function to fire worker with their address
    function fire(address _workerAddress) public {
        // Require that the users addres is the boss of the worker address
        require(msg.sender == bossOf[_workerAddress]);
        
        // Call function deletePerson with the worker address as an argument
        deletePerson(_workerAddress);
        // delete the worker address in the salary mapping
        delete(salary[_workerAddress]);
        // delete the worker address in the bossOf mapping
        delete(bossOf[_workerAddress]);
    }
}
