// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
变量类型
1.状态变量
2.局部变量
3.全局变量

*/

contract Variables {
    // 状态变量,永久保存在合约存储空间中
    string public text = "Hello";
    uint256 public num = 123;

    function doSomething() public view {
        // 局部变量
        uint256 i = 456;
        // 全局变量
        uint256 timestamp = block.timestamp;
        address sender = msg.sender;
    }
}