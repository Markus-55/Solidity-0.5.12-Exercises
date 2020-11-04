pragma solidity 0.5.12;

// Make a contract MemoryAndStorage
contract MemoryAndStorage {
    
    // Make a users mapping with a uint pointing to the User struct
    mapping(uint => User) users;
    
    // Make a struct User
    struct User{
        // Make a uint id 
        uint id;
        // Make uint balance
        uint balance;
    }
    
    // Create a function to add a user with their id and balance
    function addUser(uint id, uint balance) public {
        // The id of the users mapping = User struct with the id and balance
        users[id] = User(id, balance);
    }
    
    // Create a function to uppdate the balance
    function updateBalance(uint id, uint balance) public {
        // Create a user out of the User storage = to the users id
        User storage user = users[id];
        // The user balance is = to the input balance
        user.balance = balance;
    }
    
    // Create a function that gets the balance of the inputtet id
    function getBalance(uint id) view public returns(uint) {
        // Returns the balance of the users id
        return users[id].balance;
    }
    
}
