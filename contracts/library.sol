// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// Library is simmiler to the contract.you can't declar any state variable and you can't send ether
// A library is embeded to the smart contract if all functions internal
// Otherwise it needs to deploy and embed befor the contract is deployed

library math{
    function add(uint256 a,uint256 b) internal view returns(uint256){
        return a+b;
    }
}

contract use{
    using math for uint;
    function number(uint a,uint b) public view returns(uint){
        return math.add(a,b);
    }
}