pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";


contract PrimitiveDataTypes {

  string public purpose = "Solidity Primitive Data Types, examples and descriptions";

  // Signed integers
        /* int can store positive or negative values
            default size is int256
            size can be specified in steps of 8 from int8 to int256 */
        int8 public gInt8 = -120;


    // Unsigned integers
        /* Value must be greater than or equal to zero
            default size is uint256
            size can be specified in steps of 8 from uint8 to uint256 */
        uint16 public gUint16 = 64000;


    // Boolean
        /* Possible values are the constants true and false. */
        bool public gFlag = true;


    // Addresses
        /* The address type has two versions:
            address: Holds a 20 byte value which is the size of an Eth address.
            address payable: 20 byte value plus transfer and send. */
        address public burnAdd = 0x000000000000000000000000000000000000dEaD;
        
        // Payable address can receive Ether
        address payable public gOwner;


    // Enums
        /* Enums are a defined list of values, helpful to model choice and track state
            Enums require at least one member
            Enums default value when declared is the first member
            Enums cannot have more than 256 members. */
        enum Status {
            Pending, // 0
            Shipped, // 1
            Accepted, // 2
            Rejected, // 3
            Canceled // 4
        }
        Status public defStatus;
        Status public newStatus;



    // Bytes
        /* stores data in binary format
            provides data types in the range from bytes1 to bytes32 inclusive
            Bytes with a fixed-size variable can be passed between contracts */
        bytes1 public gByte = 0x64;

    
    // Payable constructor can receive Ether
    // change newStatus variable to a different Enum
    constructor() payable {
        gOwner = payable(msg.sender);
        newStatus = Status.Accepted; // Accepted = 2
    }

}
