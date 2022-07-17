// SPDX-License-Identifier: GPL-3.0

pragma solidity  >=0.5.0 <0.8.0;

/*. Seller Registration
product details:- name, title, discriptions, Product Id, price, 
seller wallet address for given payment
buyer address 
boolen value: when product deliverd thanbuyer mark boolen value true. than payment given to seller
 */

contract Ecommerece{
struct product{
string title;
string discrip;
address payable add_seller;
uint product_id;
uint price;
address add_buyer;
bool delivery;
}
// for saved information use dynamic array 
product[] public products;
uint counter = 1;    // for product ID
// after creating all 3 function now create 3 event for each function.and than trigger the event.
event registered(string title, uint product_id, address seller );  // name nahi likhe tab ki koi eror nahi aayegi.
event bought ( uint product_id, address buyer);
event delivered ( uint product_id);



function registerproduct(string memory _title, string memory _discrip, uint _price) public {
 require( _price>0, " Price should be grater than Zero");
   product memory tempproduct;
tempproduct.title = _title;
tempproduct.discrip = _discrip;
tempproduct.price = _price * 10**18;         /*  this price in Ether, so convert price in wei multiply by 10 ki power 18. */
 
tempproduct.add_seller = payable(msg.sender);
tempproduct.product_id = counter;
counter++;

// for pushing these information in array.and starting me index 0 par storage hoga.

products.push(tempproduct);  

emit registered(_title, tempproduct.product_id, msg.sender);

}

 
function buy(uint _productID) public payable{
  require(products[_productID-1].price == msg.value, " please pay the exact price");
  require(products[_productID-1].add_seller != msg.sender, " seller can not purchase");
products[_productID-1].add_buyer = msg.sender;
emit bought( _productID, msg.sender);

}
 function delivery( uint _productID) public{
require(products[_productID-1].add_buyer == msg.sender, " only buyer can confirm");
products[_productID-1].delivery   = true;
// now payment transfer to seller
products[_productID-1].add_seller.transfer(products[_productID-1].price);
emit delivered( _productID);
 }


}