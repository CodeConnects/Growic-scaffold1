pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract Structs {
    
    string public purpose = "Save user balance and KYC details";

    mapping(address => uint) public balances;

    constructor() payable {
    }

    // setUserDetails(string calldata name, uint256 age) 
    // this function accepts 2 arguments
    // these represent the details of user calling smart contract
    // it saves them into a defined struct


    // getUserDetail() 
    // retrieves and returns the details saved for the user calling the contract.


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
