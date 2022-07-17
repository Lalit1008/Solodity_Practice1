// SPDX-License-Identifier: GPL-3.0

pragma solidity  >=0.5.0 <0.8.0;

/* Delegatecall executes other contract's code inside the contract that called it.
Using Delegate Call:
* msg.sender and msg.value preserved to the original value.
* what happen to the state variable: When code inside contract B is Executed, it does not change 
the state Variable inside contract B bu† state variable inside contract A is updated 

Delegatecall is a low level function in Solidity that executes code from another contract using 
the storage, sender, and ether amount of the caller's contract. Using delegatecall 
you can write upgradable contract, even though once a contract is deployed on the blockchain, 
you cannot change the code of the contract.

state variable in Contrat B must be in exact same order in contract A but if we change the order of
state variable than not receive correct answer.

Notes:
* delegatecall runs code of callee in caller's context ( storage, msg.sender, msg.value ).
* state variable of caller and callee must be in same order.
* use delegatecall to upgrade contract.
* delegatecall return 2 value , onle is boolen and 2nd is bytes data.




Uses: 
when two contract already deploy on blockchain it means we canot change the code inside bot contract. 
in this case Contract A delegate call to contract B, than able to change state varialbe value withour changing the code of anyone.
*/





contract B{
    /* state variable of contract B must be same order as contract A. means if we write like
( not get correct answer )
address public sender;
uint public value;
uint public num;   

( not get correct answer )
uint public amount;
uint public num;
address public sender;
uint public value; 

( get correct answer: last me likha sakte hai, yadi koi state variable add karna hai but vo variable 
contract a me nahi hai. )

uint public num;
address public sender;
uint public value;
uint public amount;

*/

uint public num;
address public sender;
uint public value;

function setvars(uint _num) public payable {
     num = _num;
    sender = msg.sender;
    value = msg.value;

}
}


// Here contract A delegatecall to Contract B
contract A{
uint public num;
address public sender;
uint public value;

function setvars(address _contractB, uint _num) public payable {

 (bool success, bytes memory data) = _contractB.delegatecall(abi.encodeWithSignature("setvars(uint256)", _num));
    

}
}

contract B1{
uint public num;
address public sender;
uint public value;

function setvars(uint _num) public payable {
     num = 2* _num;
    sender = msg.sender;
    value = msg.value;

}
}