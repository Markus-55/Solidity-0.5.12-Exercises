// Import the file Ownable.sol
import "./Ownable.sol";

pragma solidity 0.5.12;

// Make a Destroyable contract that inherits from the Ownable contract
contract Destroyable is Ownable {
    
    // Make a function to selfdestruct, only accessible by the owner
    function destroy() public onlyOwner {
        // Selfdestruct using the owners payable address
        selfdestruct(ownerPayable);
    }
}
