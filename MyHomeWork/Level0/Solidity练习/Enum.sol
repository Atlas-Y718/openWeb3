// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Enum {
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Caceled
    }
    Status public status;

    function get() public view returns (Status) {
        return status;
    }

    function cancel() public {
        status = Status.Caceled;
    }

    function reset() public {
        delete status;
    }
}