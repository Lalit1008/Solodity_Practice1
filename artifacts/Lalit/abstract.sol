// SPDX-License-Identifier: GPL-3.0

pragma solidity  >=0.5.0 <0.8.0;

/* Abstract Contract is a contract which contain at least one function without implementation.
abstract contract used as a base contract.not use as a drived contract.
generally  abstract contract contains both implemantation as well as abstract function.
drived contract will implement the abstract function and use the existing functions as and when required.
To make contract abstract use keyword " abstract "
abstract contract can not be deployed.
*/

// base Contract hote hai and abstract contract can not be deployed.

abstract contract A{
    
    // since the function has no implemantation ( abstract function ) mark it as virtual.
 function X() public view virtual returns ( string memory );

 function Y() public pure returns( string memory){
     return " shayam";
 }
} 

// drived contract: 

 contract B is A{
 function X() public pure override returns ( string memory){
     return " Ram";
 }
 
}
/* if drived contract also not implementation the incomplete function then that drived contract
will aslo be marked as abstract contract
here Drived Contract C, D is also Abstract Contract with diff. Example
 */

 abstract contract C is A{
 function X() public pure virtual override returns ( string memory);
 }

 abstract contract D is A{
     uint public Num;
// here function X not declare with implemantation so this contract marked as abstract contract.
 }
 









