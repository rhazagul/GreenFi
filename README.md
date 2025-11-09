🌿 GreenFi – Decentralized Finance for Agricultural Forecasting

GreenFi is a multi-chain DeFi platform that empowers farmers, traders, and institutions to forecast crop yields, hedge against climate risks, and access financial tools. Built on BlockDAG’s fast, scalable EVM-compatible network, GreenFi integrates prediction markets, staking, lending, and token swaps to deliver real-world agricultural impact.

---

## 🌍 Problem

Agriculture faces systemic volatility:
- 🌪 Climate change disrupts yields and planting cycles
- 📉 Smallholders lack access to affordable risk management
- 📊 NGOs and governments need decentralized food security intelligence
- 💰 Farmers and traders struggle with liquidity and market uncertainty

---

## 💡 Solution

GreenFi offers a community-driven DeFi ecosystem:

### 🔮 Prediction Markets
- **Market Creation:** Users create binary forecast markets (e.g., “Will maize prices rise next month?”)
- **Staking:** Stake BDAG or ETH on outcomes
- **Resolution:** Outcomes resolved on-chain; winnings distributed automatically
- **Advanced Payouts:** Winners receive their stake plus a proportional share of the losing pool

### 💸 Lending Protocol
- Borrow stablecoins against staked BDAG
- Collateralized loans with liquidation thresholds
- Yield farming for lenders

### 💱 Decentralized Exchange (DEX)
- Swap BDAG, ETH, and stablecoins via AMM
- Liquidity pools for agricultural tokens
- Real-time price feeds via Chainlink oracles

### 📈 Staking Mechanism
- Stake BDAG to earn rewards and governance rights
- Lock tokens to support market creation and resolution

---

## 🛠 Technology Stack

| Component       | Technology |
|----------------|------------|
| Blockchain      | BlockDAG, Polygon, BNB Chain, Ethereum |
| Smart Contracts | Solidity + Hardhat |
| Frontend        | React + Ethers.js + Web3Modal |
| Wallet          | MetaMask |
| Backend         | Node.js / Express (optional) |
| Oracles         | Chainlink + Weather/Crop APIs |
| Testing         | Hardhat, Jest, Chai, Mocha |

---

## 📖 How It Works

1. **Create Market:** Define a yes/no agricultural forecast
2. **Stake Tokens:** Place BDAG or ETH on your chosen outcome
3. **Resolve Outcome:** Verified on-chain (future oracle support)
4. **Claim Winnings:**  
   - Use `claimWinnings()` to receive stake + share of losing pool  
5. **Check Status:**  
   - Use `hasClaimed()` and `getMarket()` for market info  
6. **DEX & Lending:**  
   - Swap tokens or borrow against collateral  
7. **Staking:**  
   - Stake BDAG for rewards and governance  
8. **Ownership Transfer:**  
   - Contract owner can transfer control for upgrades or decentralization

---

## GREENFI ARCHITECTURE

![GreenFi Architecture](assets/greenfi-architecture.png)

---

## 📦 Installation & Setup

### Prerequisites
- [Node.js](https://nodejs.org/) v18+
- [MetaMask](https://metamask.io/) with BlockDAG testnet
- [Hardhat](https://hardhat.org/)

### Setup Steps
```bash
git clone https://github.com/yourusername/greenfi.git
cd greenfi
npm install
```

### Environment Configuration
```env
PRIVATE_KEY=your_metamask_private_key
INFURA_API_KEY=your_infura_key
```

### Compile & Deploy
```bash
npx hardhat compile
npx hardhat run scripts/deploy.js --network blockdag
```

---

## 🚀 Demo Usage

1. Start frontend:
    ```bash
    cd frontend
    npm install
    npm start
    ```
2. Connect MetaMask to BlockDAG
3. Create a market (e.g., “Will Kano receive above-average rainfall?”)
4. Stake BDAG or ETH
5. Resolve market and claim winnings
6. Use DEX to swap tokens
7. Use Lending to borrow stablecoins
8. Stake BDAG for rewards

---

## 🗝 Key Features

- Blockchain-secured prediction markets
- Lending and borrowing for farmers
- Token swaps via DEX
- Transparent and automated payouts
- Getter and claim status functions
- Ownership transfer for upgrades
- Accepts ETH and BDAG
- Multi-chain support
- Community-driven forecasting

---

## 💎 Value Proposition

| Stakeholder | Benefit |
|-------------|---------|
| Farmers     | Risk management, liquidity access |
| Traders     | Market insights, yield farming |
| NGOs/Govts  | Decentralized food security data |
| Investors   | Exposure to $3T+ agriculture sector |

---

## 👥 Team Roles

- Smart Contract Development – Solidity, Hardhat, BlockDAG
- Frontend Development – React, Ethers.js, UI/UX
- Backend & Oracles – Weather/price APIs
- Business & Strategy – Partnerships, investor relations

---

## 🏆 Why GreenFi Stands Out

- First DeFi platform focused on agriculture
- Combines prediction markets, lending, staking, and DEX
- Built on BlockDAG for speed, low fees, scalability
- Technical innovation with social impact
- Unique crowdsourced agricultural data

