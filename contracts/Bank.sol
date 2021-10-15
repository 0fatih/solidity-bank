//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Bank {

    // Store users' balances
    mapping(address => uint) public balances;

    function deposit() public payable returns (address){
        require(msg.value > 0, "You can't deposit 0 amount!");
        balances[msg.sender] += msg.value;
        return msg.sender;
    }

    function withdraw(uint _amount) public {
        require(balances[msg.sender] >= 0, "You didn't deposit anything!");
        uint userBalance = balances[msg.sender];
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(userBalance);
    }

    function transfer(uint _amount, address _to) public {
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }

}
