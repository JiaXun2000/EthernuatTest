// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Delegate {

  address public owner;

  constructor(address _owner) public {
    owner = _owner;         //make the parameter address to be owner
  }

  function pwn() public {
    owner = msg.sender;     //change the ownership to calling this func caller  
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;        //intantiate 

  constructor(address _delegateAddress) public {
    delegate = Delegate(_delegateAddress);      //
    owner = msg.sender;
  }
  
  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);      //func call the delegate method, the parameter is msg.data, here is pwn()
    if (result) {
      this;
    }
  }
}