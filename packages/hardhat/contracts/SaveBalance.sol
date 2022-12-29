pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract SaveBalance {
    
    string public purpose = "Save a user balance";

    mapping(address => uint) public balances;

    constructor() payable {
    }

    function deposit (uint256 amount) public {
        // save amount deposited into mapping of address => balance
        balances[msg.sender] += amount;
    }

    function checkBalance() public view returns (uint) {
        // return the balance of address calling the contract (msg.sender)
        return balances[msg.sender];
    }

    receive() external payable {}
    fallback() external payable {}
}
