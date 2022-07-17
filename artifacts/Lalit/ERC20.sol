// SPDX-License-Identifier: GPL-3.0

pragma solidity  >=0.5.0 <0.8.0;

abstract contract ERC20_STD{   
 /* kot bhi token jab banate hai to uska name, symbol and than decimals define kiya jata hai 
 like: Ethereum bolck chain ki currency name ' Ether' , symbol 'ETH' and decimals '10 ** 18' wei.
  1 ether = 10 ** 18 */

function name() public view virtual returns (string memory);
function symbol() public view virtual returns (string memory);
function decimals() public view virtual returns (uint8);

// ERC20 token standard token function
function totalSupply() public view virtual returns (uint256);
function balanceOf(address _owner) public view virtual returns (uint256 balance);
function transfer(address _to, uint256 _value) public virtual returns (bool success);
function transferFrom(address _from, address _to, uint256 _value) public virtual returns (bool success);
function approve(address _spender, uint256 _value) public virtual returns (bool success);
function allowance(address _owner, address _spender) public view virtual returns (uint256 remaining);

event Transfer(address indexed _from, address indexed _to, uint256 _value);
event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}

// jo token launch karta hai vahi owner hota hai, vahi token aage distribute karega etc. 
contract token_ownership {

address public contract_Owner;   // jo total jitne bhi token hai, unka owner hai
address public new_Owner;        // jiosko ownership transfer karni hai

event transferownership(address indexed  _from, address indexed _to);

constructor() {
    contract_Owner = msg.sender;     
}

// for changing the ownership of token
function change_Owner (address _to) public{
//  only contract_Owner can change the ownership
require(msg.sender == contract_Owner," only Contract owner change the token ownership");
new_Owner = _to; 

}

function accept_Owner() public {

    require(msg.sender == new_Owner, " only new assign owner can execute this");
    emit transferownership ( contract_Owner, new_Owner);
    contract_Owner = new_Owner;
    new_Owner = address(0);
}

}

contract  MyERC20 is ERC20_STD, token_ownership{
 string public _name;
 string public _symbol;
 uint8 public _decimals;
 uint256 public _totalsupply; 

 // minter: creator of the token
address public _minter;
// _minter kitni total value or balance create kar rha hai, total supply kitni hai, kitne token remaning hai for mint.
mapping(address=>uint256) token_Balance;

/* jab koi thirt party hamare account se kisi aur ke account par token transfer kare,
it means hamne use approve kiya hua hai,ese kaun kaun se address hai jinhe ham approve
 kar rahe hai, token transfer ke liye , for this mapping */
mapping(address=> mapping(address=>uint256)) allowed;


// isme hamne abhi decimals ko define nahi kiya
 constructor(address mint){
_name = "ParamPavitram";
_symbol = " PPI";
_totalsupply = 10000; 
_minter = mint;
token_Balance[_minter] = _totalsupply;
 }

function name() public view override returns (string memory){
    return _name;
}

function symbol() public view override returns (string memory){
    return _symbol;
}

function decimals() public view override returns (uint8){
    return _decimals;
}

function totalSupply() public view override returns (uint256){
 return _totalsupply; 
}

// jis jis person ne token own kiya hota hai, uska balance dikhata hai
function balanceOf(address _owner) public view override returns (uint256 balance){
    return token_Balance[_owner];
}
 // transfer token from minter
function transfer(address _to, uint256 _value) public override returns (bool success){
require(token_Balance[msg.sender]>=_value,"minter donot have sufficent number of token");
token_Balance[msg.sender] = token_Balance[msg.sender]-_value;
token_Balance[_to] = token_Balance[_to]+ _value;
  
emit Transfer( msg.sender, _to, _value);
 return true;
}

/* jab koi thirt party hamare account se kisi aur ke account par token transfer kare,
it means hamne use approve kiya hua hai, hamare account se tranfer ke liye */

function transferFrom(address _from, address _to, uint256 _value) public override returns (bool success){

uint256 allowedbal = allowed[_from][msg.sender];
require(allowedbal >= _value," insufficient balance");
token_Balance[_from] -= _value;
token_Balance[_to] += _value;

emit Transfer( _from, _to, _value);
return true;

}
// here _spender is thirt party
function approve(address _spender, uint256 _value) public override returns (bool success){
require(token_Balance[msg.sender] >= _value," insufficient token");
allowed[msg.sender][_spender] = _value;

emit Approval(msg.sender, _spender, _value);
return true;
}


function allowance(address _owner, address _spender) public view override returns (uint256 remaining){
return allowed[_owner][_spender];

}



}


