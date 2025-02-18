// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ViewAndPure {
    uint256 public x = 1;
    // view函数声明不会改变任何状态
    function addToX(uint256 y) public view returns (uint256) {
        return x + y;
    }
    // pure函数声明不会更改和读取状态变量
    function add(uint256 i, uint256 j) public view returns (uint256) {
        return i + j;
    }
}