// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.27;

contract SendEther {
    constructor() payable {}

    receive() external payable { }

    function sendViaTransfer(address payable _to) external {
        _to.transfer(123);
    }

    function sendViaSend(address payable  _to) external {
        bool sent = _to.send(123);
        require(sent, "send failed");
    }

    function sendViaCall(address payable  _to) external {
        (bool success,) = _to.call{value: 123} ("");
        require(success, "call failed");
    }
}

contract EthReceiver {
    event log(uint amout, uint gas);

    receive() external payable {
        emit log(msg.value, gasleft());
     }
}