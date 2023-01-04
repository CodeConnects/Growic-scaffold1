pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract Structs {
    
    string public purpose = "Save user balance and KYC details";

    // Mappings section
    mapping(address => uint) public balances;

    // Structs section
    struct UserDetail {
        string name;
        uint256 age;
    }
    mapping(address => UserDetail) public userDetails;



/********************* Structs section *********************/

    // save details of user calling smart contract
    // save them into a defined struct
    function setUserDetails(string calldata _name, uint256 _age) {
        userDetails[msg.sender].name = _name;
        userDetails[msg.sender].age = _age;
    }


    // retrieves and returns the details saved for the user calling the contract.
    function getUserDetail() public view returns (string, uint256) {
        // return the saved details of the user calling smart contract
        return userDetails[msg.sender];
    }

/********************* Mappings section functions *********************/

    function deposit (uint256 amount) public {
        // save amount deposited into mapping of address => balance
        balances[msg.sender] += amount;
    }

    function checkBalance() public view returns (uint) {
        // return the balance of address calling the contract (msg.sender)
        return balances[msg.sender];
    }



    constructor() payable {
    }
    receive() external payable {}
    fallback() external payable {}
}
