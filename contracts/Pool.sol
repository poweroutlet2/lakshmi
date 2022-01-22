//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Pool {
    mapping(address => uint) addressToBalance;

    function deposit() external payable returns(address, uint256) {
        require(msg.value >= 0.5 ether, "Minimum deposit of 0.5 required.");
        addressToBalance[msg.sender] += msg.value;
        return (msg.sender, addressToBalance[msg.sender]);
    }

    function balanceOf(address _address) external view returns(uint) {
        return addressToBalance[_address];
    }

    function totalValue() external view returns(uint) {
        return address(this).balance;
    }
}