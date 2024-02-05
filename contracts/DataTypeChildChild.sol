// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.18 <0.9.0;

import "./DataTypeChild.sol";

// Contrat héritant de 'DataTypeChild'
contract DataTypeChildChild is DataTypeChild {

    // La fonction fait une lecture du storage, donc il faut la mettre en mode 'view'
    function accessParent1Variable() public view returns(uint256){
        return numberUnsigned;
    }
}