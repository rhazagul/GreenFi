// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Lending {
    mapping(address => uint256) public collateral;
    mapping(address => uint256) public debt;
    uint256 public interestRate = 5; // 5% flat interest
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function depositCollateral() external payable {
        require(msg.value > 0, "Must deposit BDAG");
        collateral[msg.sender] += msg.value;
    }

    function borrow(uint256 amount) external {
        require(collateral[msg.sender] >= amount * 2, "Insufficient collateral");
        debt[msg.sender] += amount + (amount * interestRate / 100);
        payable(msg.sender).transfer(amount);
    }

    function repay() external payable {
        require(debt[msg.sender] > 0, "No debt");
        require(msg.value >= debt[msg.sender], "Insufficient repayment");
        debt[msg.sender] = 0;
    }

    receive() external payable {}
}
