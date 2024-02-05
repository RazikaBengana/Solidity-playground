// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

// Déclaration du contrat 'MyOwnCrypto', qui hérite des contrats ERC20 et AccessControl --> Création de sa propre crypto-monnaie
contract MyOwnCrypto is ERC20, AccessControl {
    
    // Déclaration d'une variable publique pour stocker l'adresse du propriétaire du contrat
    address public owner;
    
    // Déclaration d'une variable pour stocker le total de l'approvisionnement en jetons disponibles
    uint totalSupplyOfTokensAvailable = 1000 * 10 ** decimals();

    // ---------------------------------------------------------------------------------------------------------------
    
    // Constructeur du contrat, exécuté une seule fois lors du déploiement du contrat
    constructor() ERC20("MyOwnCrypto", "MOC") {
        // Assignation de l'adresse du déploieur comme propriétaire du contrat
        owner = msg.sender;
        
        // Mint (création) initial de 100 jetons au propriétaire du contrat
        _mint(owner, 100 * 10 ** decimals());
        
        // Attribution du rôle DEFAULT_ADMIN_ROLE au propriétaire du contrat
        _grantRole(DEFAULT_ADMIN_ROLE, owner);
    }

    // ---------------------------------------------------------------------------------------------------------------

    // Fonction permettant au propriétaire de créer de nouveaux jetons et les attribuer à une adresse spécifique
    function mint(address to, uint256 amount) public onlyRole(DEFAULT_ADMIN_ROLE) {

        // Vérifie si le total de l'approvisionnement existant plus la quantité demandée ne dépasse pas la limite
        require(totalSupply() + amount <= totalSupplyOfTokensAvailable, "We have no more token to mint");
        
        // Mint (crée) les jetons et les attribue à l'adresse spécifiée
        _mint(to, amount);
    }
}