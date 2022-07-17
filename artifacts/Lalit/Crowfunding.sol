// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Crowfunding{
    mapping ( address=> uint) public contributors;
    address public manager;
    uint public minimum_contibution;
    uint public deadline;
    uint public target;
    uint public raisedAmount;
    uint public no_of_contributors;


    constructor (uint _target, uint _deadline){
        target = _target;

    // block.timestamp give value in second. so _deadline also in seconds
        deadline = block.timestamp + _deadline;
        minimum_contibution = 100 wei;
        manager = msg.sender;

    }
// request taken fund by manager for complete goal
    struct Request_for_fund{
        string fund_use_detail;
        address payable recepient;  // jise fund transfer karna hai,for his work
        uint amount; //  amount jitna tranfer krna hai
      uint no_of_voters;
        bool completed;     // voting complet hui ya nahi check 
        mapping (address=> bool) voters;

    }
// there are different type no of request of fund expense
    mapping(uint=> Request_for_fund) public requests;
    uint public numrequest;

    // for transfering ether in smart contract by contributors

    function sendEth() public payable {
require(block.timestamp<deadline," deadline pass now you cannot contribute");
require(msg.value >= minimum_contibution," please transfer at least minimum contribution ");
// contributors frist time aayega to no_of_contributors badadenge.first time aayega tab tak uska contibtion 0 wei hoga.
 if(contributors[msg.sender] == 0 wei){
no_of_contributors++;
 }
 contributors[msg.sender] = contributors[msg.sender] + msg.value;
 raisedAmount += msg.value; // also wright like raisedAmount = raisedAomunt +msg.value
 
    }

function totalcontractbalance() public view returns(uint){
 return address(this).balance;

}  
 
 function refund_if_traget_not_achive() public {
require(block.timestamp>deadline && raisedAmount<target," you are not eligible for refund");
require (contributors[msg.sender]>0," you are not contribute any amount");
// msg.sender ko payable banana
address payable user = payable(msg.sender);
user.transfer(contributors[msg.sender]); 
contributors[msg.sender] = 0;

 }

modifier onlymanager{
require(msg.sender == manager," only manager can call this function");
_;

}

function createrequest_for_fund( string memory _fund_use_detail, address payable _recepient, uint _amount ) public onlymanager {
 // yadi struct ke andar mapping hai and function ke andar struct ko use karte hai to storage ka hi use karenge, memory ka nahi
 Request_for_fund storage newRequest_for_fund = requests[numrequest];
 numrequest++;
newRequest_for_fund.fund_use_detail = _fund_use_detail;
newRequest_for_fund.recepient = _recepient;
newRequest_for_fund.amount = _amount;
newRequest_for_fund.completed = false;
newRequest_for_fund.no_of_voters = 0;

}

function voterequest(uint _numrequest) public{

    require(contributors[msg.sender]>0," for voting first you become contributor");
    Request_for_fund storage thisrequest = requests[_numrequest];
    require(thisrequest.voters[msg.sender] == false," you have already voted");
    thisrequest.voters[msg.sender] = true;
    thisrequest.no_of_voters++;
} 

function makepaymnet_forrequest( uint _numrequest) public onlymanager{
require(raisedAmount>= target,"target not achive");
Request_for_fund storage thisrequest1 = requests[_numrequest];
require(thisrequest1.completed == false," already fund transfer to this request");
require(thisrequest1.no_of_voters>no_of_contributors/2," no of voter less for completation of this request");
  thisrequest1.recepient.transfer(thisrequest1.amount);
  thisrequest1.completed = true;

}

}