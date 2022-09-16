// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.14;

contract Bank
{
    address public Owner;
    constructor ()
    {
        Owner = msg.sender;
    }

    mapping(address=>uint) public balance;

    function setDeposit(address person, uint bal) payable public 
    {
        require(msg.value == bal," Enter value in msg.value ");
        balance[person] = bal;
    }

    function getDeposit(address pers) public view returns(uint)
    {
        return (balance[pers]);
    }

    function withdraw(uint amount) public 
    {
        require(msg.sender == Owner,"not an Owner");
        balance[msg.sender] = balance[msg.sender] - amount;
        (bool sent, ) = Owner.call{value: balance[msg.sender]}("");
        require(sent, "Failed to send Ether");
    }
}
