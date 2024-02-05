// SPDX-License-Identifier: MIT
pragma solidity  >=0.8.18 <0.9.0;

import "./DataType.sol";

// Contrat héritant de 'DataType'
contract DataTypeChild is DataType {

    // La fonction 'accessParentVariable' appelle la fonction 'firstFunction' du contrat parent
    function accessParentVariable() public pure returns(uint256){
        return firstFunction(2); 
    }

    // Cette fonction 'firstFunction' remplace la fonction du même nom du contrat parent (avec 'override')
    function firstFunction(uint256) public override pure returns(uint256){
        return 12200;
    }
}