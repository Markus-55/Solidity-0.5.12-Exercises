pragma solidity 0.5.12;

// Import file Ownable.sol
import "./Ownable.sol";

contract ERC20 {
    // Make a string variable name
    string private name_;
    // Make a string variable symbol
    string private symbol_;
    // Make a uint8 variable decimals
    uint8 private decimals_;
    
    // Make a uint256 variable total supply
    uint256 private totalSupply_;
    
    // Make an address minter;
    address public minter;
    
    // Make a mapping of the balances with an address that point to a uint256
    mapping(address => uint256) private balances;
    
    // Make a constructor with a string name and symbol, a uint8 decimals and a uint256 total
    constructor(string memory name, string memory symbol, uint8 decimals, uint256 total) public {
        // The string variable name is = to the input name
        name_ = name;
        // The string variable symbol is = to the input symbol
        symbol_ = symbol;
        // The uint8 variable decimals is = to the input decimals
        decimals_ = decimals;
        
        // The uint256 variable total supply is = to the input total
        totalSupply_ = total;
        // The users address in the balances mapping is = to the uint256 variable total supply
        balances[msg.sender] = totalSupply_;
        
        // The address minter is = to the users address
        minter = msg.sender;
    }
    
    // Make a function name
    function name() public view returns(string memory) {
        // Returns the string variable name
        return name_;
    }
    
    // Make a function symbol
    function symbol() public view returns(string memory) {
        // Returns the string variable symbol
        return symbol_;
    }
    
    // Make a function decimals
    function decimals() public view returns(uint8) {
        // Returns the uint8 variable decimals
        return decimals_;
    }
    
    // Make a function totalSupply
    function totalSupply() public view returns(uint256) {
        // returns the uint256 variable total supply
        return totalSupply_;
    }
    
    // Make a function balanceOf with the account address
    function balanceOf(address _account) public view returns(uint256) {
        // Returns the input account address in the balances mapping
        return balances[_account];
    }
    
    // Make function mint with the account address and the token amount
    function mint(address _account, uint256 _amount) public {
        // Require the users address to be the minter;
        require(msg.sender == minter);
        // Require the input token amount to be < than 1 * 10 ^ 60
        require(_amount < 1e60);
        // The input account address in the balances mapping 
        // is = the input account address in the balances mapping + the input token amount
        balances[_account] = balances[_account] + _amount;
    }
    
    // Make a function transfer with a recipient address and the token amount
    function transfer(address _recipient, uint256 _amount) public returns(bool) {
        // require users address in the balances mapping to point to the input token amount
        require(_amount <= balances[msg.sender]);
        // The users address in the balances mapping
        // is = to the users address in the balances mapping - the input token amount
        balances[msg.sender] = balances[msg.sender] - _amount;
        // The input recipient address in the balances mapping
        // is = to the input recipient address in the balances mapping + the input token amount
        balances[_recipient] = balances[_recipient] + _amount;
        // Returns true
        return true;
    }
}
