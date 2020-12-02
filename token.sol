pragma solidity 0.5.12;

import "./Ownable.sol";

contract ERC20 {
    string private name_;
    string private symbol_;
    uint8 private decimals_;

    uint256 private totalSupply_;
    
    address public minter;
    
    mapping(address => uint256) private balance_;
    
    constructor(string memory name, string memory symbol, uint8 decimals, uint256 total) public {
        name_ = name;
        symbol_ = symbol;
        decimals_ = decimals;
        
        totalSupply_ = total;
        balance_[msg.sender] = totalSupply_;
        
        minter = msg.sender;
    }
    
    function name() public view returns(string memory) {
        return name_;
    }

    function symbol() public view returns(string memory) {
        return symbol_;
    }

    function decimals() public view returns(uint8) {
        return decimals_;
    }

    function totalSupply() public view returns(uint256) {
        return totalSupply_;
    }

    function balanceOf(address _account) public view returns(uint256) {
        return balance_[_account];
    }

    function mint(address _account, uint256 _amount) public {
        require(msg.sender == minter);
        require(_amount < 1e60);
        balance_[_account] = balance_[_account] + _amount;
    }

    function transfer(address _recipient, uint256 _amount) public returns(bool) {
        require(_amount <= balance_[msg.sender]);
        balance_[msg.sender] = balance_[msg.sender] - _amount;
        balance_[_recipient] = balance_[_recipient] + _amount;
        //emit Transfer(msg.sender, _recipient, _amount);
        return true;
    }
}
