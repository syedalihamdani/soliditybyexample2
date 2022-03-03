// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Car{
    string public model;
    string public owner;
    address public carAddress;
    constructor(string memory _model,string memory _owner) payable{
        model=_model;
        owner=_owner;
        carAddress=address(this);
    }
}

contract createCar{
    Car[] public cars;
    function creater1(string memory _model,string memory _owner) public{
        Car car=new Car(_model,_owner);
        cars.push(car);
    }
    function creater2(string memory _model,string memory _owner) public payable{
        Car car=(new Car){value:msg.value}(_model,_owner);
        cars.push(car);
    }

    function creater3(string memory _model,string memory _owner,bytes32  _salt)public{
        Car car=(new Car){salt:_salt}(_model,_owner);
        cars.push(car);
    }

    function creater4(string memory _model,string memory _owner,bytes32 _salt) public payable{
        Car car=(new Car){value:msg.value,salt:_salt}(_model,_owner);
        cars.push(car);
    }

    function getCar(uint8 _index) public view returns(Car){
        return cars[_index];
    }
}