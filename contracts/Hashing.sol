// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Hashing{
    bytes32 public person;
    function first(string memory _name,uint8 _age,bool _ismale) public{
        person=keccak256(abi.encodePacked(_name,_age,_ismale));
    }

    function guessing(string memory _name,uint8 _age,bool _ismale)public view returns(bool){
        return person==keccak256(abi.encodePacked(_name,_age,_ismale));
    }
}