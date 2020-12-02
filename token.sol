pragma solidity 0.5.12;

// Import file Ownable.sol
import "./Ownable.sol";
// Import file Safemath.sol
import "./Safemath.sol";

contract ERC20 is Ownable {
    
    using SafeMath for uint256;
    
    // Make a string variable name
    string private name_;
    // Make a string variable symbol
    string private symbol_;
    // Make a uint8 variable decimals
    uint256 private decimals_;
    
    // Make a uint256 variable total supply
    uint256 private totalSupply_;
    
    // Make a mapping of the balances with an address that point to a uint256
    mapping(address => uint256) private balances;
    
    // Make a constructor with a string name and symbol, a uint8 decimals and a uint256 total
    constructor(string memory name, string memory symbol, uint256 decimals) public {
        // The string variable name is = to the input name
        name_ = name;
        // The string variable symbol is = to the input symbol
        symbol_ = symbol;
        // The uint8 variable decimals is = to the input decimals
        decimals_ = decimals;
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
    function decimals() public view returns(uint256) {
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
    function mint(address _account, uint256 _amount) public onlyOwner {
        // Require that the account address is not = to the 0 address
        require(_account != address(0), "mint to the zero address");
        
        // The total supply is = to the total supply + the input token amount
        totalSupply_ = totalSupply_.add(_amount);
        // The input account address in the balances mapping 
        // is = the input account address in the balances mapping + the input token amount
        balances[_account] = balances[_account].add(_amount);
    }
    
    // Make a function transfer with a recipient address and the token amount
    function transfer(address _recipient, uint256 _amount) public returns(bool) {
        // Require that the recipient address is not = to the 0 address
        require(_recipient != address(0), "transfer to the zero address");
        // Require that the msg.sender in the balances mapping is >= to the input amount
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        
        // The users address in the balances mapping
        // is = to the users address in the balances mapping - the input token amount
        balances[msg.sender] = balances[msg.sender].sub(_amount);
        // The input recipient address in the balances mapping
        // is = to the input recipient address in the balances mapping + the input token amount
        balances[_recipient] = balances[_recipient].add(_amount);
        
        // Returns true
        return true;
    }
}
