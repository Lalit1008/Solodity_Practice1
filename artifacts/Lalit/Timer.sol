// SPDX-License-Identifier: GPL-3.0


/*
block.timestamp is used for current block.timestamp,   pahle now use karte the but ab block.timestamp use karte hai.
end time -block.timestamp <= 0 it means contract ka end time ho gya hai, to esa hone par modifer ka
use karna chahiye , jisse end tim e hote hai , time over ka massage aa jaye.
*/
pragma solidity >=0.7.0 <0.9.0;
contract timer{
    uint _Start;
    uint _End;

modifier timeover{
    require (block.timestamp <= _End," time over");
    _;
}
    function Start() public{
        _Start = block.timestamp; 
        
    }

function End(uint totaltime) public{
        _End = totaltime +block.timestamp;
        

    }
function difftime() public view timeover returns(uint){

    return _End-block.timestamp;
}

}