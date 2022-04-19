// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract Erc20Token {
    uint256 totalSupply ;
    string public name ="SujanCrypto ";
    string public symbol ="CRySA";
    string public standard ="CRySA v1.0";
    mapping ( address => uint256 )  public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
//initalize 
    constructor ( ) public {
        balanceOf[msg.sender]= 10000000;
        totalSupply = 10000000;
    }
    event Transfer(
        address indexed _from ,
        address indexed _to ,
        uint256 _value 
    );
    event Approve (
        address indexed _owner ,
        address indexed  _Spender,
        uint256 _value


    );
    
// transfer 
function transfer( address _to ,uint256 TokenNum) public returns( bool success){
 require (balanceOf[msg.sender] >= TokenNum);
 balanceOf[msg.sender]-= TokenNum;
 balanceOf[_to]+=TokenNum;
 emit Transfer(msg.sender,_to,TokenNum);
 return true;

}
//delegate transfer 
   function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;

      emit   Approve(msg.sender, _spender, _value);

        return true;
    }
      function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

         emit Transfer(_from, _to, _value);

        return true;
    }

}