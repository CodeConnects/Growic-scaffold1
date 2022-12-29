pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

contract SaveBalance {
    string public purpose = "Save a user balance";

    mapping(address => uint) public balances;

    function deposit (uint256 amount) {
        // save amount deposited into mapping of address => balance
        balances[msg.sender] += amount;
    }

    function checkBalance() public view returns (uint) {
        // search for user balance inside the balance mapping
        // return the balance of address calling the contract (msg.sender)
        return balances[msg.sender];
    }

    constructor() payable {
    }
}
