// SPDX-License-Identifier: GPL-3.0

pragma solidity  >=0.5.0 <0.8.0;

contract dynamicarry{

    uint[] public arr= [10,20,30,40];


    function fun() public  {

// // get the value
// uint get;
// get= arr[1];
// return get;

 // for update


 arr[3]=100;

//for delete
delete arr[1];

// push

//arr.push(120);

// pop

arr.pop();



    }
}