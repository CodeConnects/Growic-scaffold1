pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract is Ownable {

  event SetPurpose(address sender, string purpose);

  // private by default (not public)
  // public available outside of smart contract

  string public purpose = "Building Rhodes!!!";

  bool public defaultBool; // false
  uint public defaultUint; // 0 (0 up to max limit which is 256 by default)
  int public defaultInt; // 0
  address public defaultAdr; // 0x00000000000000000000000000000000

  // uint public price = 0.0222 ether;

  constructor() payable {
    // what should we do on deploy?
  }

  function setPurpose(string memory newPurpose) public payable {
      // require(msg.value == price, "0.0222 ETH price required");
      purpose = newPurpose;
      console.log(msg.sender,"set purpose to",purpose);
      emit SetPurpose(msg.sender, purpose);
  }

  function withdraw() public onlyOwner {
    (bool success, ) = msg.sender.call{value: address(this).balance}("");
  }

  // to support receiving ETH by default
  receive() external payable {}
  fallback() external payable {}
}
