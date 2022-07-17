// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.8.0;

struct Emp{
    string name;
    uint age;
    address acc;
}


contract Struct{


// also use struct data outside the contract and use in another contractor

Emp public emp;

//constructor ( string memory name, uint age, address _acc){

  //  emp.name= name;
    //emp.age= age;
    //emp.acc=_acc;

Emp[] public emps; 

function setvalues() public {

 Emp memory emp1= Emp(" Krishna", 20, msg.sender);

 Emp memory emp2= Emp( {name:"Radhika", acc:msg.sender, age:18});
 
  Emp memory emp3;
 emp3.name= " Balaram";
 emp3.age=26;
 emp3.acc= msg.sender; // not use this on contract level

 emps.push (emp2);
 emps.push(emp1);
 emps.push( emp3);
emps.push(Emp(" ram", 26, msg.sender)); 


Emp storage Emp6= emps[0];
Emp6.name=" geeta";
Emp6.age = 29;
delete Emp6.acc;
delete emps[1];
  //  emp.name=" Sita";
  //Emp storage Emp5=emp;
 // Emp5.name= " Sita";

 }


}


contract struct2{

  Emp public struct2= Emp("radhe", 21, msg.sender);
}