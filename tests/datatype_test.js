// Import des modules 'ethers' et 'chai' depuis 'hardhat'
const { ethers } = require("hardhat")
const { expect } = require("chai")

// Définition d'une suite de tests pour le contrat 'DataType'
describe("DataType Unit Test", function(){

    // Définition d'un test pour vérifier la valeur d'un nombre non signé
    it("test unsigned number value", async function(){

        // Création d'une instance du contrat 'DataType'
        const DataType = await ethers.getContractFactory("DataType")
        const dataTypeContract = await DataType.deploy()
        await dataTypeContract.deployed()

        // Affichage de l'adresse du contrat déployé
        console.log('DataType Contract address: ' + dataTypeContract.address)

        // Utilisation de 'chai' pour vérifier que la valeur du nombre non signé est égale à 5
        expect((await dataTypeContract.numberUnsigned()).toNumber()).to.be.equal(5)
    })
})