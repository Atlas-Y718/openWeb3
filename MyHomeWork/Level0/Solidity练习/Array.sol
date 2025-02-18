// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Array {
    uint256[] public arr;
    uint256[] public arr2 = [1, 2, 3];
    uint256[10] public myfixedSizeArr;

    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    function get() public view returns (uint256[] memory) {
        return arr;
    }

    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public {
        arr.push(i);
    }

    function pop() public {
        arr.pop();
    }

    function getLength() public view returns (uint256) {
        return arr.length;
    }

    function remove(uint256 index) public {
        delete arr[index]; //只是置为0，length没有减少
    }

    function examples() external {
        uint256[] memory a = new uint256[](5);
    }
}