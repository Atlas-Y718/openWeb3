// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
// 原始数据类型
contract Primitives {
    bool public boo = true; // 布尔类型
    uint8 public u8 = 1; // 无符号整型
    uint256 public u256 = 456;
    uint256 public u = 123;
    int8 public i8 = 1; // 有符号整型
    int256 public i256 = 456;
    int256 public i = -123;
    int256 public minInt = type(int256).min; // 类型最小值
    int256 public maxInt = type(int256).max; // 类型最大值
    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c; // 地址类型
    bytes1 a = 0xb5;// 一个字节8位 [10110101]
    bytes1 b = 0x56;
    bool public defaultBoo; // 默认false
    uint256 public defaultUint; // 默认0 0 ~ 1^256
    int256 public defaultInt; // 默认0 -1^255 ~ 1^255
    address public defaultAddr; // 默认0x0000000000000000000000000000000000000000
}