// SPDX-License-Identifier: GPL-3.0

pragma solidity  >=0.5.0 <0.8.0;

/* EVENT use for store data in blockchain.this alsodone by Makiong state variable also 
 ham  data me change karna nahi chahte, use access karna nahi chahtet us conditin me
 constand and state variable ko use nahi karke event ko use karte hai. jisse gas cost kam lagati hai */

 /* use as a output also
  blockchain me data actually me transcation log me milta hai */


  contract EVENT{
// decelaration of event like state variable, other data type
// eg.; address has value ---- 
event balance(address account , string message, uint Val);// aslo give name here but not mandatory
 
 function setdata (uint _val) public {

emit balance(msg.sender, " Has Value", 20);

 }
 }

  contract chatapp{
event chat( address _from, address _to, string _message);   // kisne kisko jo massage bheja, vesa kuch likna hai

/* event me kitne bhi perameter dal sakte hai likin ek event me max 3 parameter 
ki indexing kar skate hai * like
event chat( address _from, address _to, string _message, uint val, string mess1);:- right statment
event chat( address indexed _from, address indexed _to, string indexed _message); :- right statment
event chat( address indexed _from, address indexed _to, string indexed _message, uint indexed val);:- wrong statment
*/

function sendmass(address _to, string memory _message) public{

emit chat ( msg.sender, _to, _message);

}


  }