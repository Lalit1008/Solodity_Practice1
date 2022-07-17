// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Receiver{

event log( bytes data);

function TRansfer( address _to, uint _amount) public{
emit log(msg.data);
// 0x67a144c0 ( first four bytes encodes the function to call and rest of the data is function parameter t pass to the function
// 0000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4. // data for first parameter address _to
// 00000000000000000000000000000000000000000000000000000000000000f5 // data or second parameter uint _amount
}
}

contract checselector{

function checkselector( string calldata _fun) external pure returns(bytes4){

    return bytes4(keccak256(bytes(_fun)));
}


}