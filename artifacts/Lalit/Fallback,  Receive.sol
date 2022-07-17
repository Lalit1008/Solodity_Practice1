// SPDX-License-Identifier: GPL-3.0

pragma solidity  >=0.5.0 <0.8.0;

/* fallback is superior than Receive.
Fallback:- It is execuated when a non-existent function is called on the contract.
visilibity External karn hogi.
It han no Name
No arguments pass in this
return kuch nahi karta
data leta hai:- bytes ki form me. and ether leta hai, iske liye payable banana hota hai.
it can be difined one for contract.
Receive:- ye only ether le skta hai, data nahi le skta and receive ko payable karna complusory hota hai.
and other thingh same as fallback.*/




contract fallback_receive{

event log (string _fun, address _sender, uint _value, bytes _data );   // for checking of which function 
                                               // is ruiing whenn both function in a contract
fallback() external payable   {
emit log ("fallback ", msg.sender, msg.value, msg.data);
} 

receive() external payable{
 
  emit log ("receive ", msg.sender, msg.value," ");
  
}

/* if kisi contract me fallback and receive both function hote hai to us condition me
data and ether kha jayenge: YADI DATA+ Ether  hai to vah fallback ke pas jayga and ether bhi 
but yadi only ether hi hai to ether receive ke pas jayega.  */

function getwbal() public view returns( uint){
return address(this).balance;

}
function getwbal2() public view returns( uint){
return (msg.sender).balance;

}

}


