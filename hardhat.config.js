require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.20",
  networks: {
    blockdag: {
      url: "https://rpc.blockdag.network",
      accounts: [process.env.PRIVATE_KEY],
    },
  },
};
