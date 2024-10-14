<div align="center">
<br>

![Solidity_playground.png](README-image/solidity_playground.png)

</div>


<p align="center">
<img src="https://img.shields.io/badge/-Solidity-purple">
<img src="https://img.shields.io/badge/-Linux-lightgrey">
<img src="https://img.shields.io/badge/-WSL-brown">
<img src="https://img.shields.io/badge/-Ubuntu%2020.04.4%20LTS-orange">
<img src="https://img.shields.io/badge/-JetBrains-blue">
<img src="https://img.shields.io/badge/-Remix-yellow">
<img src="https://img.shields.io/badge/License-not%20specified-brightgreen">
</p>


<h1 align="center"> Solidity - Playground </h1>


<h3 align="center">
<a href="https://github.com/RazikaBengana/Solidity-playground#eye-about">About</a> •
<a href="https://github.com/RazikaBengana/Solidity-playground#memo-learning-objectives">Learning Objectives</a> •
<a href="https://github.com/RazikaBengana/Solidity-playground#computer-requirements">Requirements</a> •
<a href="https://github.com/RazikaBengana/Solidity-playground#package-installation">Installation</a> •
<a href="https://github.com/RazikaBengana/Solidity-playground#keyboard-basic-usage">Basic Usage</a> •
<a href="https://github.com/RazikaBengana/Solidity-playground#pushpin-more info">More Info</a> •
<a href="https://github.com/RazikaBengana/Solidity-playground#mag_right-resources">Resources</a> •
<a href="https://github.com/RazikaBengana/Solidity-playground#bust_in_silhouette-authors">Authors</a> •
<a href="https://github.com/RazikaBengana/Solidity-playground#octocat-license">License</a>
</h3>

---

<!-- ------------------------------------------------------------------------------------------------- -->

<br>
<br>

## :eye: About

<br>

<div align="center">

**`Solidity - playground`** is a project designed to provide a hands-on environment for learning and experimenting with `Solidity`, the programming language for `Ethereum` smart contracts. 
<br>
<br>
This playground allows developers to test various smart contract functionalities, explore different data types, and implement token standards like `ERC20`. 
<br>
It serves as a valuable resource for both beginners and experienced developers looking to enhance their skills in `blockchain` development.

</div>

<br>
<br>

<!-- ------------------------------------------------------------------------------------------------- -->

## :memo: Learning Objectives

<br>

```diff

+ Understand the fundamentals of Solidity programming

+ Learn how to create and manage smart contracts on the Ethereum blockchain

+ Explore various data types and structures available in Solidity

+ Implement and interact with ERC20 tokens and other standards

+ Gain practical experience through testing and deploying smart contracts

```

<br>
<br>

<!-- ------------------------------------------------------------------------------------------------- -->

## :computer: Requirements

<br>

```diff

+ Basic knowledge of programming concepts

+ Familiarity with blockchain technology and Ethereum

+ Node.js and npm installed for managing dependencies

+ Remix IDE or Hardhat for testing and deploying contracts

```

<br>
<br>

<!-- ------------------------------------------------------------------------------------------------- -->

## :package: Installation

<br>

### Local Environment Setup:

<br>

- **Clone the repository**:

<br>

```yaml
git clone https://github.com/RazikaBengana/Solidity-playground.git
```

<br>
<br>

- Ensure you have `Node.js` and `npm` installed on your system. <br>
  Then, install the **project's dependencies** by running:

<br>

```yaml
npm install
```

<br>

This will install any necessary packages, including `OpenZeppelin Contracts`, which are already included in the repository.

<br>
<br>

### `Remix` IDE Setup:

<br>

- **Open `Remix` IDE**:

  - Navigate to [Remix IDE](https://remix.ethereum.org/) in your web browser

<br>

- **Import the Repository**:

  - In the `Remix` IDE, click on the "**File Explorer**" tab on the left sidebar 
  - Select "**GitHub**" and enter the repository URL: `https://github.com/razikabengana/solidity-playground.git`
  - Click "**OK**" to clone the repository into `Remix`

<br>

- **Dependencies**:

  - The project uses `OpenZeppelin` Contracts, which are included in the repository under `/.deps/npm/@openzeppelin/contracts`. <br>
    No additional installation is needed in `Remix`.

<br>
<br>

<!-- ------------------------------------------------------------------------------------------------- -->

## :keyboard: Basic Usage

<br>

### Local Environment:

<br>

- **Compile Contracts**

  - Use `Hardhat` to compile the smart contracts:

<br>

```yaml
npx hardhat compile
```

<br>

- **Deploy Contracts**

  - Deploy the contracts to a local `Ethereum` network or a test network. <br>
    Use the following command, replacing `<network-name>` with your desired network:

<br>

```yaml
npx hardhat run scripts/deploy.js --network <network-name>
```

<br>

- **Run Tests**

  - Execute the test suite to verify the functionality of the contracts:

<br>

```yaml
npx hardhat test
```

<br>
<br>

### `Remix` IDE:

<br>

- **Compile Contracts**:

  - Navigate to the "**Solidity Compiler**" on the left sidebar in `Remix`
  - Select the contract you wish to compile from the file explorer
  - Click the "**Compile**" button to compile the selected contract

<br>

- **Deploy Contracts**:

  - Go to the "**Deploy & Run Transactions**" tab
  - Choose the environment you want to deploy to (e.g., `JavaScript VM`, `Injected Web3 for MetaMask`, or a test network)
  - Select the contract you want to deploy from the dropdown menu
  - Click "**Deploy**" to deploy the contract to the selected environment

<br>

- **Run Tests**:

  - Use the "**Solidity Unit Testing**" plugin in Remix to run tests located in the `/.deps/remix-tests directory`
  - Select the test files and click "**Run Tests**" to execute them

<br>
<br>

<!-- ------------------------------------------------------------------------------------------------- -->

## :pushpin: More Info

<br>

### Training:

<br>

| File | Description                                                                                                                                                                                                                                                                                                                                                                     |
|------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [DataType.sol](/contracts/DataType.sol) | <br> Contains a `Solidity` smart contract named `DataType` that demonstrates various data types and functionalities available in `Solidity`. <br> It includes examples of state variables, functions, modifiers, events, and fallback mechanisms. <br> The contract provides a comprehensive overview of how to manage data and interactions within a smart contract. <br> <br> |
| [DataTypeChild.sol](/contracts/DataTypeChild.sol) | <br> Inherits from the `DataType` contract and demonstrates the use of inheritance and function overriding in `Solidity`. <br> It extends the functionality of the parent contract by overriding one of its functions and providing a method to access a variable from the parent contract. <br> <br>                                                                           |
| [DataTypeChildChild.sol](/contracts/DataTypeChildChild.sol) | <br> Further extends the `DataTypeChild` contract. <br> Provides a method to access a specific variable (`numberUnsigned`) from the parent contract, showcasing multi-level inheritance in `Solidity`. <br> <br>                                                                                                                                                                |
| [DataType_test.sol](/tests/DataType_test.sol) | <br> `Solidity` test suite designed to validate the functionality of the `DataType` contract. <br> Uses the `Remix` IDE's testing framework to perform unit tests, ensuring that the contract behaves as expected. <br> Includes various test cases to check state variables and transaction context. <br> <br>                                                                 |
| [datatype_test.js](/tests/datatype_test.js) | <br> Unit test for the `DataType` contract using the `Hardhat` framework and the `Chai` assertion library. <br> Verifies the functionality of the `DataType` contract, specifically checking the value of an unsigned number. <br> <br>                                                                                                                                           |

<br>
<br>

### Projects: 

<br>

| Project Name                   | Description                                                                                                                                                                                                                                                                                         |
|--------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Voting Project](/contracts/VotingProject.sol)         | <br> Implements a voting mechanism allowing users to vote on proposals, delegate their votes, and determine the winning proposal. <br> Manages voter registration and voting rights, ensuring only eligible voters can participate. <br> Demonstrates a decentralized voting system. <br> <br>      |
| [Custom Cryptocurrency Project](/contracts/MyOwnCrypto.sol) | <br> Defines a custom `ERC20` cryptocurrency named `MyOwnCrypto` (symbol: `MOC`). <br> Inherits functionalities from `OpenZeppelin ERC20` and `AccessControl`, allowing token creation and permission management. <br> The contract owner can mint new tokens up to a maximum supply. <br> <br>     |
| [CryptoBank Project](/contracts/CryptoBank.sol)        | <br> Simulates a centralized banking system, allowing users to deposit, withdraw `Ether`, and view balances. <br> Provides mechanisms for contract owner to manage funds. <br> Illustrates a smart contract mimicking real-world banking operations with a focus on privacy and security. <br> <br> |

<br>
<br>

<!-- ------------------------------------------------------------------------------------------------- -->

## :mag_right: Resources

<br>

**_Do you need some help?_**

<br>

**Read or watch:**

* [Solidity - Documentation](https://docs.soliditylang.org/)

* [Ethereum - Documentation](https://ethereum.org/en/developers/docs/)

* [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/)

<br>
<br>

<!-- ------------------------------------------------------------------------------------------------- -->

## :bust_in_silhouette: Authors

<br>

**${\color{blue}Razika \space Bengana}$**

<br>
<br>

<!-- ------------------------------------------------------------------------------------------------- -->

## :octocat: License

<br>

```Solidity - playground``` _project has no license specified._

<br>
<br>

---

<p align="center"><br>2024</p>
