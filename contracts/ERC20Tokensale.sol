// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
import './Erc20Token.sol';
contract ERC20Tokensale{
    address admin;
    Erc20Token public tokenContract;
    uint256 TokenPrice;
    uint256 soldToken;
    event sell (address _buyer, uint256 _amount);
  constructor( Erc20Token _tokenContract, uint256 _tokenPrice) public {
        //assign admin
        admin = msg.sender;
        //tokenContract
      tokenContract =_tokenContract;
      //set toekn price in wei
      TokenPrice = _tokenPrice;


    }
    //buy tokens
    function BuyTokens(uint256 _tokenNumber)  public payable{
        //keep track of  number of token sale
        //emit the sale event
        soldToken += _tokenNumber ;
        emit sell(msg.sender, _tokenNumber);


    }
}