// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Sample{

    uint public a = 10;
    function SetA( uint _a) public{
        a =_a;
    }
}