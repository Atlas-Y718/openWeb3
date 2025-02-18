// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Immutable {
    //一次性初始化：immutable 变量只能在构造函数中初始化，之后不可更改。
    //节省 Gas：由于值在部署时确定，读取 immutable 变量的 Gas 成本较低。
    //运行时确定：与 constant 不同，immutable 变量的值可以在运行时确定。
    //部署后，这些变量的值无法修改。
    address public immutable MY_ADDRESS;
    uint256 public immutable MY_UINT;
    constructor(uint256 _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}