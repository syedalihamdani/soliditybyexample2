//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Callee {
    function add(uint256 a,uint b) public pure returns(uint256){
        return a+b;
    }

      function sub(uint256 a,uint b) public pure returns(uint256){
        return a-b;
    }   
}

contract Caller{
    function callerFunction(Callee _Callee,uint256 a,uint256 b) public pure returns(uint256){
        return _Callee.add(a,b);
    }
}
