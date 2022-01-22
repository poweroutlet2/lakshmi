//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Pool.sol";

contract ReservePool is Pool {
    function withdraw(uint amount) external returns(address, uint256) {
        require(amount <= addressToBalance[msg.sender], "Requested withdrawal amount higher than account balance.");
        payable(msg.sender).transfer(amount);
        addressToBalance[msg.sender] -= amount;
        return(msg.sender, addressToBalance[msg.sender]);
    }
}