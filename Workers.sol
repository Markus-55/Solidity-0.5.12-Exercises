pragma solidity 0.5.12;

// Import the file HelloWorld.sol
import "./HelloWorld.sol";

// Make a contract Workers inherit from the people contract
contract Workers is People {
    
    // Make a struct wallet
    struct wallet {
        // Make an address hash
        address hash;
        // Make a uint money
        uint money;
    }
    
    // Make an instance from the people contract = to people contract address
    People instance = People(0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B);
    
    // Make a salary mapping with an address that points to a uint
    mapping(address => uint) public salary;

    // Make a function to create a worker with a name, age, height and salary
    function createWorker(string memory _name, uint _age, uint _height, uint _salary) public {
        // Take the instance of the createPerson function in the people contract
        instance.createPerson(_name, _age, _height);
        
        // Require the age to not exceed 75
        require(_age <= 75, "Age above 75 is not allowed");
        
        // The address of the worker is = to the users address
        address worker = msg.sender;
        
        // Create a new salary out of the wallets memory
        wallet memory newSalary;
        // The new salary with the hash is = to the worker address
        newSalary.hash = worker;
        // The new salary with the money is = to the worker salary
        newSalary.money = _salary;
        
        // The worker in the salary mapping is = to the worker salary
        salary[worker] = _salary;
    }
    
    // Make a function to fire worker with their address
    function fire(address worker) public {
        // Delete the worker in the salary mapping
        delete salary[worker];
    }
}
