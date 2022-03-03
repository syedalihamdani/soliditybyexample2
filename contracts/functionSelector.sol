// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelectorTest{
    function transfer(address _account,uint256 _amount) external view returns(bool){
        return true;
    }
}

contract FunctionSelector {
    /*
    "transfer(address,uint256)"
    0xa9059cbb
    "transferFrom(address,address,uint256)"
    0x23b872dd
    */
    
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }

    function callfunction(bytes4 _selector,address payable _selectorTest,uint256 _amount) external  returns(bool) {
        (bool seccess,bytes memory data)=_selectorTest.call(abi.encodeWithSelector(_selector, _selectorTest,_amount));
        return seccess;   
    }
}
