// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


/*
Solidity - Restricted Access
Restricted Access to a Contract is a common practice. By Default, a contract state is read-only unless it is specified as public.
We can restrict who can modify the contract's state or call a contract's functions using modifiers. We will create and use multiple modifiers as explained below −

onlyBy − once used on a function then only the mentioned caller can call this function.

onlyAfter − once used on a function then that function can be called after certain time period.

costs − once used on a function then caller can call this function only if certain value is provided.

*/

contract Test {
   address public owner = msg.sender;
   uint public creationTime = block.timestamp;

   modifier onlyBy(address _account) {
      require(
         msg.sender == _account,
         "Sender not authorized."
      );
      _;
   }
   function changeOwner(address _newOwner) public onlyBy(owner) {
      owner = _newOwner;
   }
modifier onlyAfter(uint _time) {
      require(
         block.timestamp >= _time,
         "Function called too early."
      );
      _;
   }
   function disown() public onlyBy(owner) onlyAfter(creationTime + 20 ) view returns(address)  {
      return owner;
   }
  modifier costs(uint _amount) {
      require(
         msg.value >= _amount,
         "Not enough Ether provided."
      );
      _;
      if (msg.value > _amount)
         payable (msg.sender).transfer(msg.value);
   }
   function forceOwnerChange(address _newOwner) public payable costs(200 ether) {
      owner = _newOwner;
      if (address(owner) & 0 == 1) return;        
}
}