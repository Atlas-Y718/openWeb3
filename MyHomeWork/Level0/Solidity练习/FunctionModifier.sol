// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// 函数修改器可用于
// 限制访问
// 验证输入
// 防范重入攻击

contract FunctionModifier {
    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner)
        public
        onlyOwner
        validAddress(_newOwner)
    {
        owner = _newOwner;
    }

    modifier noReenrrancy() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 i) public noReenrrancy {
        x -= i;
        if (i > 1) {
            decrement(i - 1);
        }
    }
}