// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Lottery{
address public Manager;

address payable [] public Players;

// initilization of Manager
 constructor (){
     // person who deploy the contract is manager
Manager = msg.sender;

 }
function alreadyentered() view public returns(bool){
    for(uint i=0; i<Players.length; i++){
if( Players[i] == msg.sender)
    return true;
}
return false;

}


function enter() payable public {
require ( msg.sender != Manager, " Manager can not take part in the Lottery");
require ( alreadyentered() == false, " Palyer can not take part again in Lottery");
require ( msg.value >= 1 ether," Please pay minimum Lottery Fees" );

}

function randomnumber() private view returns(uint){
   return uint (sha256(abi.encodePacked(block.difficulty, block.number,Players)));

}

function pickwinner() public {
require( msg.sender == Manager," only manager can pick the winner");
uint winnerindex = randomnumber()% Players.length;
address contractaddress = address(this);
// tranfer winning amount from contract 
Players[winnerindex].transfer(contractaddress.balance); 
// reset the lottery again
Players = new address payable[](0);

}

function getplayers() public view returns(address payable[] memory){
    return Players;
}

}
