# Basic ERC20 Token

![BSC Badge](https://img.shields.io/badge/Binance%20Smart%20Chain-FCD535?style=for-the-badge&logo=binance&logoColor=black)
![Solidity](https://img.shields.io/badge/Solidity-363636?style=for-the-badge&logo=solidity&logoColor=white)
![OpenZeppelin](https://img.shields.io/badge/OpenZeppelin-4.9.3-3E6FA7?style=for-the-badge)

A modern implementation of BEP-20 token on Binance Smart Chain with burn functionality and approve-and-call pattern.

## Features ✨
- ✅ Fully BEP-20 compliant
- 🔥 Built-in burn functionality (via OpenZeppelin's ERC20Burnable)
- 🤖 approveAndCall pattern for atomic interactions
- 🎯 Fixed supply of 1,000,000,000 tokens
- 🔒 Secure implementation using OpenZeppelin contracts
- 📈 18 decimal precision
- 🌐 Optimized for BSC Mainnet & Testnet

## Prerequisites 📋
- [Node.js](https://nodejs.org/) v16+
- [npm](https://www.npmjs.com/) v7+
- [MetaMask](https://metamask.io/) wallet with BSC network configured
- tBNB for testnet deployment ([Get from faucet](https://testnet.bnbchain.org/faucet-smart))

## Installation ⚙️
```bash
git clone https://github.com/h0z3yn/basic-bep20-token.git
cd basic-bep20-token
npm install @openzeppelin/contracts@4.9.3
```

## Deployment 🚀

### Using Remix IDE
1. Visit [Remix IDE](https://remix.ethereum.org/)
2. Create new file `Watt.sol`
3. Paste contract code
4. Compile with compiler version 0.8.29
5. Deploy to BSC network with parameters:
   - Constructor arguments: `["WattCoin", "WTC"]`

### Using Hardhat
```bash
npx hardhat compile
npx hardhat run scripts/deploy.js --network bscTestnet
```

## Contract Details 📄

### Constructor
```solidity
constructor(string memory tokenName, string memory tokenSymbol)
```

## Key Parameters
| Parameter       | Value                  |
|-----------------|------------------------|
| Initial Supply  | 1,000,000,000 WTC      |
| Decimals        | 18                     |
| Symbol          | WTC                    |
| Name            | WattCoin               |

## Verification 🔍
Verify on [BscScan](https://bscscan.com/):
```bash
npx hardhat verify --network bscTestnet <CONTRACT_ADDRESS> "WattCoin" "WTC"
```

## Testing 🧪
```bash
npm install --save-dev @nomicfoundation/hardhat-toolbox
npx hardhat test
```

### Sample Test Script
```javascript
describe("WattCoin", function () {
  it("Should return correct name and symbol", async function () {
    expect(await wattCoin.name()).to.equal("WattCoin");
    expect(await wattCoin.symbol()).to.equal("WTC");
  });
});
```

## Interacting with Contract 💻

### Via Remix
1. After deployment, use the deployed contract interface
2. Call methods like:
   - `balanceOf(address)`
   - `transfer(to, amount)`
   - `burn(amount)`

### Via Web3
```javascript
const contract = new web3.eth.Contract(abi, address);
const balance = await contract.methods.balanceOf(userAddress).call();
```

## Security Considerations 🔐
- Contract uses audited OpenZeppelin implementations
- Mainnet deployment should include:
  - Proper access controls
  - Multi-sig wallet for ownership
  - Third-party security audit

## Contributing 🤝
Contributions welcome! Please:
1. Fork the repository
2. Create your feature branch
3. Submit a pull request

## License 📄
MIT License

## Acknowledgements 💡
- Built with [OpenZeppelin](https://openzeppelin.com/contracts/)
- BSC integration inspired by [Binance Chain Docs](https://docs.bnbchain.org/)