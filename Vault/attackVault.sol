pragma solidity ^0.8.0;

import './Vault.sol';
contract Attack{
    Vault V;

    function exploit(address _addr)public {
        V = Vault(_addr);
    }
    function attackVault() public {
        
    }

}