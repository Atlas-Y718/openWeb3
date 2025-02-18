// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// require用于执行之前验证输入和条件
// revert类似requir
// assert用于检查代码中不应该有的错误，断言失败意味着存在错误

contract Error {
    function testRequire(uint256 _i) public pure {
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint256 _i) public pure {
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint256 public num;

    function testAssert() public view {
        assert(num == 0);
    }

    error InsufficientBanlance(uint256 balance, uint256 withdrawAmount);

    function testCustomError(uint256 _withdrawAmount) public view {
        uint256 bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBanlance({
                balance: bal,
                withdrawAmount: _withdrawAmount
            });
        }
    }
}

contract Account {
    uint256 public balance;
    uint256 public constant MAX_UINT = 2**256 - 1;

    function deposit(uint256 _amount) public {
        uint256 oldBalance = balance;
        uint256 newBalance = balance + _amount;
        require(newBalance >= oldBalance, "Overflow");
        balance = newBalance;
        assert(balance >= oldBalance);
    }
    function withdraw(uint256 _amount) public  {
         uint256 oldBalance = balance;

        require(balance >= _amount, "Underflow");

        if (balance < _amount) {
            revert("Underflow");
        }

        balance -= _amount;

        assert(balance <= oldBalance);
    }
}

/**
 * 主要区别
特性	require	revert	assert
用途	验证输入和前置条件	手动触发回滚	检查内部错误和不变量
错误信息	支持自定义错误信息	支持自定义错误信息或错误类型	无错误信息
Gas 处理	回滚状态更改，退还剩余 Gas	回滚状态更改，退还剩余 Gas	回滚状态更改，不退还 Gas
适用场景	用户输入验证、前置条件检查	复杂逻辑中的手动回滚	内部逻辑检查、不变量验证
严重性	通常用于预期中的错误	通常用于预期中的错误	用于不应发生的严重错误
总结
require：用于验证外部输入和前置条件，适合处理预期中的错误。

revert：用于手动触发回滚，支持自定义错误信息或错误类型。

assert：用于检查内部逻辑和不变量，适合处理不应发生的严重错误。

在实际开发中，应根据具体场景选择合适的错误处理方式：

使用 require 验证用户输入和前置条件。

使用 revert 在复杂逻辑中手动回滚。

使用 assert 确保内部逻辑的正确性。
 */