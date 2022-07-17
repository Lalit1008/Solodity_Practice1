// SPDX-License-Identifier: GPL-3.0

pragma solidity  >=0.5.0 <0.8.0;

contract fixedsizearray{
 uint[5] public arr1;



// for loop with array for initatization

function arraywithloop (uint x) public{

for(uint i=0; i<arr1.length;i++){
arr1[i]=x+(i*10);

}

}


 //uint[5] public arr1=[10,20,30,40,50];
// use for initialization
constructor (){

   arr1= [10,20,30,40];
}

// return array, array return karne me gas jayada lagti hai

function returnarray () public view returns ( uint[5] memory){

return arr1;

}


// function array() public view returns( uint){
// get
 // uint arr2;
// arr2=arr1[1];

// for updation

// arr1[2]= 200;

// for delete, than default value 0 aayegi

// delete arr1[3];

//  length

// uint len=arr1.length;
//  return len;



//}
// create array in function, only fixed size array hi create kar sakte hai, dayanic array nahi bante
// function createarray () public pure returns( uint){

//     uint[] memory arrmem= new uint[](5);
//     arrmem[1]=150;
//     return arrmem[1];



// }




}