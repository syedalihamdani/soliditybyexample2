// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Foo{
    address public owner;
    constructor(address _owner) {
        require(_owner!=address(0),"Foo:zero address not allowed");
        owner=_owner;
    }

    function foo(uint8 _x) public pure returns(uint8){
        require(_x!=0,"Foo:zero value given");
        return _x;
    }
}
// There is no need of try catch.That is why i don't need to rearn right now
contract tryCatch{
    function callFooFunction(Foo _fooContract,uint8 _x) public view returns(uint8){
     uint8 a =_fooContract.foo(_x);
     return a;    
    }
}