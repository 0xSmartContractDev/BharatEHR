pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

contract OwnableAdmin is Ownable{
    
    address public admin;

    constructor(address adminAddress) public {
        _transferOwnership(msg.sender);
        admin = adminAddress;
    }



}