// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract King {

  address payable king;
  uint public prize;
  address payable public owner;

  constructor() public payable {
    owner = payable(msg.sender);  
    king = payable(msg.sender);
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner); //This line is a bug make the contract creator to change back the owner.
    king.transfer(msg.value);                           //I think maybe this line could solve problem, cause we can call the fallback() by transfer method,
                                                        //and we only set the fallback code, and we could stop it.I figure that is return false.
    //This is not return prize to the Old King, it's only return currently msg.value, so this is Vulnerability, first will return our msg.value to old king, after that,
    //we set the fallback and get the forever ownership by return false.
    
    king = payable(msg.sender);     
    prize = msg.value;              //if someone transfer ether to this contract, that will trigger fallback and reset the prize.
  }

  function _king() public view returns (address payable) {
    return king;
  }
}