# TokenVault - Minting Tomorrow's Tokens Today

TokenVault is a robust and highly secure platform designed to facilitate NFT minting and storage. This project is built to help creators and users mint, view, and manage NFTs while leveraging IPFS for decentralized, cost-effective storage.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Installation](#installation)
- [Usage](#usage)
- [Technologies Used](#technologies-used)
- [Security](#security)
- [Contributing](#contributing)
- [License](#license)
- [Authors](#authors)

## Overview

TokenVault allows users to mint NFTs and securely store and retrieve NFT data. The project utilizes IPFS (InterPlanetary File System) to store NFT metadata in a decentralized manner, optimizing for both security and cost-efficiency. 

## Features

- **NFT Minting**: Create unique NFTs with metadata stored on IPFS.
- **Secure Viewing**: Display NFTs on a secure, reliable platform.
- **Decentralized Storage**: Utilize IPFS to reduce costs and ensure data integrity.
- **Wallet Integration**: Connect with wallets like MetaMask for seamless NFT management.
- **CID Validation**: Ensure only valid IPFS CIDs are displayed, maintaining data integrity.

## Architecture

1. **Frontend**: Built with HTML, CSS, and JavaScript, with Web3.js integration for Ethereum-based transactions.
2. **Smart Contract**: Deployed on the Ethereum blockchain, with an ABI to manage NFT creation and access controls.
3. **IPFS Storage**: Stores NFT data to keep costs down and data available in a decentralized manner.
4. **Wallet Connection**: Integrates with wallets like MetaMask for secure user login and NFT transactions.

## Installation

### Prerequisites
- [Node.js](https://nodejs.org/en/) (v14+ recommended)
- [MetaMask](https://metamask.io/) extension for wallet connection
- [IPFS](https://ipfs.tech/) account for decentralized file storage

### Steps

1. **Clone the Repository**
   ```bash
   https://github.com/sivasankarreddyvattigunta/TokenVault
   cd TokenVault
   ```

2. **Install Dependencies**
   ```bash
   npm install
   ```

3. **Compile and Deploy the Smart Contract**
   Deploy the contract on your desired Ethereum network (e.g., Rinkeby, Mainnet, or local Ganache). Update the contract address in the frontend code.



## Usage

1. **Connect Wallet**: Open TokenVault in your browser and connect your Ethereum wallet (MetaMask recommended).
2. **Mint NFT**: Enter the desired metadata and click on "Mint NFT." The data will be uploaded to IPFS, and a new NFT will be created.
3. **View NFTs**: View your minted NFTs directly on the platform with integrated IPFS content display.

## Technologies Used

- **Ethereum Blockchain**: To manage NFT ownership and transactions.
- **IPFS**: For decentralized, cost-effective storage of NFT metadata.
- **Web3.js**: For blockchain interaction and wallet integration.
- **MetaMask**: For wallet connectivity.

## Security

TokenVault incorporates several security features to protect users and their NFTs:

- **Encrypted Data**: NFT metadata stored on IPFS is hashed and encrypted to ensure privacy.
- **Secure Wallet Connection**: Users connect via trusted wallets like MetaMask.
- **CID Validation**: CIDs are verified before displaying content, protecting against invalid data.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any suggestions, bug reports, or feature requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Authors

- **Donadula Hemadri**
- **Vattigunta Siva Sankar Reddy**

