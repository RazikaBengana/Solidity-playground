// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18 <0.9.0;

// Déclaration du contrat 'CryptoBank' --> représentation d'une banque centralisée comme dans la vie réelle
contract CryptoBank {
    // Attention --> private n'existe pas vraiment dans la blockchain, ne pas oublier que toutes les données sont en réalité publiques :
    // un hacker expérimenté pourrait réussir à regarder la balance d'un quelconque client.
    // La variable 'balances' est déclarée comme private, ce qui signifie que son contenu ne peut pas être directement accédé depuis l'extérieur du contrat.
    // Cependant, si quelqu'un découvrait l'adresse du contrat et l'index de stockage approprié, il pourrait potentiellement utiliser "eth_getStorageAt" pour lire les soldes stockés dans cette variable

    // Mapping pour stocker les soldes des comptes des utilisateurs
    mapping(address => uint256) private balances;

    // Définir la personne qui va avoir le droit de transférer nos fonds à notre place (une sorte de conseiller bancaire)
    // Adresse publique du propriétaire du contrat
    address public owner;

    // ---------------------------------------------------------------------------------------------------------------

    // Constructeur du contrat --> initialise le propriétaire ('owner') et son solde initial
    constructor() payable {

        // Définir l'adresse du propriétaire comme l'adresse qui a déployé le contrat
        owner = msg.sender;
        // Initialise le solde du propriétaire avec la valeur initiale envoyée lors du déploiement
        balances[owner] = msg.value;
    }

    // ---------------------------------------------------------------------------------------------------------------

    // Fonction permettant aux utilisateurs de déposer des fonds (éther)
    function deposit() payable public {
        require(msg.value > 0, "Need to deposit more than 0");
        balances[msg.sender] += msg.value;
    }


    // Fonction permettant aux utilisateurs de consulter leur solde privé
    function getBalance(address customer) view public returns(uint256) {
        // Ne pas permettre à tout le monde de voir la balance des autres (on vérifie que l'utilisateur consulte son propre solde)
        require(msg.sender == customer, "You cannot see the balance of other people");
        return balances[customer];
    }


    // Fonction permettant au propriétaire de consulter le solde d'un utilisateur
    function getBalanceByOwner(address customer) view public returns(uint256) {
        require(msg.sender == owner, "You are not the owner");
        return balances[customer];
    }


    // Fonction permettant aux utilisateurs de retirer des fonds (éther)
    function withdraw(uint256 amount) public {
        // On vérifie s'il y a de l'argent stocké dans cette banque
        require(amount <= balances[msg.sender], "You cannot withdrawing more than you have");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
    

    // Fonction permettant au propriétaire de retirer des fonds d'un compte utilisateur spécifique
    // Elle est utile dans le cas où l'utilisateur aurait perdu sa clé privée
    // Le propriétaire peut ainsi lui renvoyer ses fonds dans une nouvelle addresse
    function withdrawOwner(address customer, address finalCustomer, uint256 amount) public {
        require(msg.sender == owner, "You are not the owner");
        require(amount <= balances[customer], "The customer has enough funds to withdraw");
        balances[customer] -= amount;
        payable(finalCustomer).transfer(amount);
    }
}