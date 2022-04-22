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


    }   event Sell(address _buyer, uint256 _amount);

     function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
    }

    function buyTokens(uint256 _numberOfTokens) public payable {
        require(msg.value == multiply(_numberOfTokens, TokenPrice));
        require(tokenContract.balanceOf(this) >= _numberOfTokens);
        require(tokenContract.transfer(msg.sender, _numberOfTokens));

        soldToken += _numberOfTokens;

        Sell(msg.sender, _numberOfTokens);
    }

    function endSale() public {
        require(msg.sender == admin);
        require(tokenContract.transfer(admin, tokenContract.balanceOf(this)));

        // UPDATE: Let's not destroy the contract here
        // Just transfer the balance to the admin
        admin.transfer(address(this).balance);
    }
}