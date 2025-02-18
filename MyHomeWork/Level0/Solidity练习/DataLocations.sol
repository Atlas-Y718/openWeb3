// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*数据存储位置
storage 状态变量存储在区块链上
memory 存储在内存中，并且函数在被调用时存在
calldata 在函数参数的特殊位置
*/
contract DataLocation {
    uint256[] public arr;
    mapping(uint256 => address) map;
    struct MyStruct {
        uint256 foo;
    }
    mapping(uint256 => MyStruct) MyStructs;

    function f() public {
        _f(arr, map, MyStructs[1]);
    }

    function _f(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct
    ) internal {}

    function g(uint256[] memory _arr) public returns (uint256[] memory) {}

    function h(uint256[] calldata _arr) external {}
}