// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract Erc20Token {
    uint256 totalSupply ;
    string public name ="SujanCrypto ";
    string public symbol ="CRySA";
    string public standard ="CRySA v1.0";
    mapping ( address => uint256 )  public balanceOf;
//initalize 
    constructor ( ) public {
        balanceOf[msg.sender]= 100000;
        totalSupply = 100000;
    }
// transfer 
function transfer( address _to ,uint256 TokenNum) public returns( bool success){
require(TokenNum <= );
}
}