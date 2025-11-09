// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DEX {
    mapping(address => uint256) public liquidity;
    uint256 public totalLiquidity;
    uint256 public exchangeRate = 1000; // 1 ETH = 1000 BDAG (example)

    function provideLiquidity() external payable {
        require(msg.value > 0, "Must provide BDAG");
        liquidity[msg.sender] += msg.value;
        totalLiquidity += msg.value;
    }

    function swapETHForBDAG() external payable {
        require(msg.value > 0, "Send ETH to swap");
        uint256 bdagAmount = msg.value * exchangeRate;
        require(address(this).balance >= bdagAmount, "Insufficient BDAG");
        payable(msg.sender).transfer(bdagAmount);
    }

    function swapBDAGForETH(uint256 bdagAmount) external {
        uint256 ethAmount = bdagAmount / exchangeRate;
        require(address(this).balance >= ethAmount, "Insufficient ETH");
        payable(msg.sender).transfer(ethAmount);
    }

    receive() external payable {}
}
