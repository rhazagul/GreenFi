const { expect } = require("chai");

describe("GreenFiCore", function () {
  let contract;
  let owner;
  let addr1;

  beforeEach(async function () {
    const GreenFiCore = await ethers.getContractFactory("GreenFiCore");
    contract = await GreenFiCore.deploy();
    [owner, addr1] = await ethers.getSigners();
  });

  it("should create a market", async function () {
    await contract.createMarket("Will it rain tomorrow?");
    const market = await contract.getMarket(0);
    expect(market[0]).to.equal("Will it rain tomorrow?");
  });

  it("should allow staking and resolve market", async function () {
    await contract.createMarket("Will maize prices rise?");
    await contract.connect(addr1).stakeOutcome(0, true, { value: ethers.utils.parseEther("1") });
    await contract.resolveMarket(0, true);
    await contract.connect(addr1).claimWinnings(0);
    const claimed = await contract.hasClaimed(0, addr1.address);
    expect(claimed).to.be.true;
  });
});
