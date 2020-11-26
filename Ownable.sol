pragma solidity 0.5.12;

// Make a contract Ownable
contract Ownable {
    
    // The owner address
    address public owner;
    // The owner address converted into a payable address
    address payable ownerPayable = address(uint160(owner));
    
    // Make an only owner modifier
    modifier onlyOwner(){
        // Require the users address to be the owner
        require(msg.sender == owner);
        // Contine the execution
        _;
    }
    
    // Make a constructor 
    constructor() public{
        // The owner is = to the users address
        owner = msg.sender;
    }
}
