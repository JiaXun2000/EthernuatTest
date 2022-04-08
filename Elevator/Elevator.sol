// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
  function isLastFloor(uint) external returns (bool);   //this interface has no implemented, and it is like abstract contract.
}                                                       //and it's also a specification.

contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);           //this step aims instantiate interface.In actual combat, this msg.sender is out Attack contract.

    if (! building.isLastFloor(_floor)) {               //this is our first time to call this interface function.
      floor = _floor;
      top = building.isLastFloor(floor);                //and this is the second times to call it, at this point the return value becomes true.Our purpose has been achieved
    }
  }
}