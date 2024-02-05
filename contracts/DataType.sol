// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18 <0.9.0;

// Les types de valeurs dans Solidity ne dépassent jamais 256
// Les variables d'état sont toutes stockées dans le 'storage'
// Lorsqu'on essaie de stocker dans le storage, c'est ce qui est le + cher (+ de dépenses de gaz)
// il est préférable d'utiliser des variables en 'memory' ou des variables 'calldata'
contract DataType {

    // Signed integer
    // -2 ** 255 à (2 ** 255) - 1
    // Plus ce qu'on alloue est petit, plus c'est bien pour le contrat, car les grosses données sont plus chères au niveau de l'EVM (+ de consommation d'unités de gaz)
    int256 internal numberSigned;
    int8 numberSignedMini;


    // ---------------------------------------------------------------------------------------------------------------


    // Unsigned integer
    // 0 à (2 ** 256) - 1
    uint256 public numberUnsigned = 5;


    // ---------------------------------------------------------------------------------------------------------------


    // Boolean
    bool trueOrFalse = true;


    // ---------------------------------------------------------------------------------------------------------------


    // Address
    // Le type 'adress' est propre à Solidity, car tous les comptes sur Ethereum sont définis par une adresse
    address addressDeMoi = 0x330f2E60A42351dd3dEaC65067fA62A77158F996;


    // ---------------------------------------------------------------------------------------------------------------


    // Enum
    enum Size {SMALL, MEDIUM, LARGE}


    // ---------------------------------------------------------------------------------------------------------------


    // Bytes
    bytes32 arrayOrBytes; 

    bytes1 smallArrayBytes; // => type de valeur (c'est lorsque la taille est définie, fixe)

    bytes dynamicArrayBytes; // => type de référence (c'est lorsque la taille n'est pas définie)


    // ---------------------------------------------------------------------------------------------------------------


    // String
    string arrayOfCharacter = "array";


    // ---------------------------------------------------------------------------------------------------------------

    // Array

    // Fixed sized array
    uint256[3] fixedArrayOfLength3;

    // Dynamic array
    // Le tableau dynamique n'a aucune valeur définie
    uint256[] public dynamicArray;


    // ---------------------------------------------------------------------------------------------------------------


    // Struct
    struct Book {
        uint256 id_book;
        string title;
        string description;
    }


    // ---------------------------------------------------------------------------------------------------------------


    // Mapping
    // Dans ce type, on a une clé et une valeur
    // Ce type est beaucoup plus pratique que le tableau
    mapping (uint256 => Book) mappingOfBook;


    // ---------------------------------------------------------------------------------------------------------------


    // Event
    event FirstEvent (uint number);


    // ---------------------------------------------------------------------------------------------------------------


    // Modifier
    modifier isGreaterThanZero(uint number){
        // numberUnsigned = 10;
        require(number > 0 , "Need to be greater than 0");
        _;
    }


    // ---------------------------------------------------------------------------------------------------------------


    function firstFunction(uint256 number) public virtual isGreaterThanZero(number) returns(uint256) {
        while(number < 10){
            number += 5;
        }
        numberUnsigned = 2;
        // emit FirstEvent(number);
        return numberUnsigned;
    } 

    

    // Toutes les variables de type valeur en argument d'une fonction sont stockées dans la mémoire
    // Les variables de types référence comme ici 'something' peuvent être stockées en mémoire si on la modifie ou bien en calldata si lecture seule (il faut le préciser)
    // Les events sont stockés en tant que logs, et ces logs sont stockés dans le stockage de l'EVM, et comme on a une écriture de l'EVM, la fonction ne doit pas être 'pure' 
    function firstFunction2(uint256 number, string memory something) public virtual isGreaterThanZero(number) returns(uint256) {
        something = "something other";
        while(number < 10){
            number += 5;
        }
        numberUnsigned = 2;
        // emit FirstEvent(number);
        return numberUnsigned;
    }


    // ---------------------------------------------------------------------------------------------------------------


    // Le modificateur 'pure' indique que la fonction ne modifie pas l'état du contrat et ne lit pas l'état non plus (donc pas d'écriture et de lecture)
    // 'pure' est utilisée pour des fonctions qui effectuent des calculs purement basés sur les arguments et n'interagissent pas avec le stockage
    function mathIntegrated() public pure returns(uint256){
        // (a + b) % c   =>   1 + 2 = 3 % 3 = 0
        // (a * b) % c   =>   1 * 2 = 2 % 3 = 2
        return mulmod(1, 2, 3);
    }


    // ---------------------------------------------------------------------------------------------------------------


    // 'timestamp' représente l'heure à laquelle le bloc a été miné
    function blockInformation() public view returns (uint256){
        return block.timestamp;
    }


    // ---------------------------------------------------------------------------------------------------------------


    // 'number' représente le numéro du bloc
    function blockInformation2() public view returns (uint256){
        return block.number;
    }


    // ---------------------------------------------------------------------------------------------------------------


    // 'sender' repésente la personne qui va envoyer la transaction
    function transactionInformation() public view returns (address){
        return msg.sender;
    }


    // ---------------------------------------------------------------------------------------------------------------


    // 'value' représente la valeur qui a été envoyé dans la transaction (l'éther reçu)
    // le keyword payable signifie qu'on va pouvoir recevoir de l'éther dans cette transaction
    function transactionInformation2() public payable returns (uint256){
        return msg.value;
    }


    // ---------------------------------------------------------------------------------------------------------------


    // 'data' représente l'encodage de cette fonction (avec les paramètres s'il y en a)
    // calldata = location de stockage
    function transactionInformation3() public pure returns (bytes calldata){
        return msg.data;
    }


    // ---------------------------------------------------------------------------------------------------------------


    function arrayFunction() public{
        dynamicArray.push(1);
    }

    function arrayPopFunction() public{
        dynamicArray.pop();
    }


    // ---------------------------------------------------------------------------------------------------------------


    // Cette fonction permet de hasher des éléments --> une taille fixe sera toujours retournée, qu'importe la longueur de l'élément à hasher
    // Hashage de 23342 = 0x8507cdd0850fbc1a066cf28b7e46e3a0bd6bec0c738c6f449d619086170366c3
    // Il y a aussi les fonctions 'sha256' et 'sha3' qu'on peut également utiliser pour hasher --> elles ont la même fonctionnalité que 'keccak256'
    function hashFunction() public pure returns(bytes32){
        return keccak256("23342");
    }


    // ---------------------------------------------------------------------------------------------------------------

    //            Ether sent to contract
    //                      |
    //                msg.data empty ?
    //                     / \
    //                  yes   no
    //                  /       \
    //     receive() exits ?     fallback()
    //           / \
    //        yes   no
    //        /      \
    //  receive()   fallback()



    // proxy => - smart contract inchangeable que l'on va déployer
    //          - il va servir de référence pour les personnes voulant intéragir avec notre contrat
    //          - l'utilisateur qui recherche simplement les fonctionnalités du contrat, ne pourra donc jamais intéragir avec notre adresse

    // proxy contract address => contrat d'implémentation



    // 'fallback' est principalement utilisé dans le cas où on utilise un design pattern de proxy dans Solidity
    fallback() external payable {
        // logique de délégation
        numberUnsigned = 101;
    }

    // 'receive' sert à recevoir de l'éther dans le contrat
    receive() external payable {
        numberUnsigned = 102;
    }
}