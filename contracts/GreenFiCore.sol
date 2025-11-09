// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GreenFiCore {
    struct Market {
        string question;
        uint yesPool;
        uint noPool;
        bool resolved;
        bool outcome;
        address creator;
        mapping(address => bool) hasClaimed;
        mapping(address => bool) userPrediction;
        mapping(address => uint) userStake;
    }

    uint public marketCount;
    mapping(uint => Market) public markets;

    mapping(address => uint) public stakedBalance;
    mapping(address => uint) public borrowedBalance;
    uint public totalStaked;
    uint public interestRate = 5; // 5% annualized

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // ---------------- Prediction Market ----------------

    function createMarket(string memory question) public {
        Market storage m = markets[marketCount++];
        m.question = question;
        m.creator = msg.sender;
    }

    function stakeOutcome(uint marketId, bool prediction) public payable {
        Market storage m = markets[marketId];
        require(!m.resolved, "Market resolved");
        m.userPrediction[msg.sender] = prediction;
        m.userStake[msg.sender] += msg.value;
        if (prediction) m.yesPool += msg.value;
        else m.noPool += msg.value;
    }

    function resolveMarket(uint marketId, bool outcome) public {
        Market storage m = markets[marketId];
        require(msg.sender == m.creator || msg.sender == owner, "Unauthorized");
        m.resolved = true;
        m.outcome = outcome;
    }

    function claimWinnings(uint marketId) public {
        Market storage m = markets[marketId];
        require(m.resolved, "Not resolved");
        require(!m.hasClaimed[msg.sender], "Already claimed");
        require(m.userPrediction[msg.sender] == m.outcome, "Wrong prediction");

        uint userStake = m.userStake[msg.sender];
        uint winningPool = m.outcome ? m.yesPool : m.noPool;
        uint losingPool = m.outcome ? m.noPool : m.yesPool;
        uint reward = userStake + (userStake * losingPool / winningPool);

        m.hasClaimed[msg.sender] = true;
        payable(msg.sender).transfer(reward);
    }

    function hasClaimed(uint marketId, address user) public view returns (bool) {
        return markets[marketId].hasClaimed[user];
    }

    function getMarket(uint marketId) public view returns (
        string memory question,
        uint yesPool,
        uint noPool,
        bool resolved,
        bool outcome
    ) {
        Market storage m = markets[marketId];
        return (m.question, m.yesPool, m.noPool, m.resolved, m.outcome);
    }

    // ---------------- Staking ----------------

    function stakeTokens() public payable {
        stakedBalance[msg.sender] += msg.value;
        totalStaked += msg.value;
    }

    function unstakeTokens(uint amount) public {
        require(stakedBalance[msg.sender] >= amount, "Insufficient stake");
        stakedBalance[msg.sender] -= amount;
        totalStaked -= amount;
        payable(msg.sender).transfer(amount);
    }

    // ---------------- Lending ----------------

    function borrow(uint collateralAmount) public {
        require(stakedBalance[msg.sender] >= collateralAmount, "Insufficient collateral");
        uint loanAmount = collateralAmount / 2;
        borrowedBalance[msg.sender] += loanAmount;
        payable(msg.sender).transfer(loanAmount);
    }

    function repayLoan() public payable {
        require(borrowedBalance[msg.sender] > 0, "No loan");
        borrowedBalance[msg.sender] -= msg.value;
    }

    // ---------------- Admin ----------------

    function transferOwnership(address newOwner) public {
        require(msg.sender == owner, "Not owner");
        owner = newOwner;
    }

    receive() external payable {}
}
