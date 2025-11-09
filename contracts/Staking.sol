// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Staking {
    mapping(address => uint256) public staked;
    mapping(address => uint256) public rewards;
    uint256 public totalStaked;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function stake() external payable {
        require(msg.value > 0, "Must stake BDAG");
        staked[msg.sender] += msg.value;
        totalStaked += msg.value;
        rewards[msg.sender] += msg.value / 10; // 10% reward
    }

    function withdraw(uint256 amount) external {
        require(staked[msg.sender] >= amount, "Insufficient stake");
        staked[msg.sender] -= amount;
        totalStaked -= amount;
        payable(msg.sender).transfer(amount);
    }

    function claimRewards() external {
        uint256 reward = rewards[msg.sender];
        require(reward > 0, "No rewards");
        rewards[msg.sender] = 0;
        payable(msg.sender).transfer(reward);
    }

    receive() external payable {}
}
