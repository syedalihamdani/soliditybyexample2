const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("soliditybyexample after function selector", function () {
  it("Calling public function from other contract", async function () {
    const Callee = await ethers.getContractFactory("Callee");
    const calleeDeployed = await Callee.deploy();
    await calleeDeployed.deployed();

    const Caller = await ethers.getContractFactory("Caller");
    const callerDeployed = await Caller.deploy();
    await callerDeployed.deployed();

    expect(await callerDeployed.callerFunction(calleeDeployed.address,2,2)).to.equal(4);
  });

  it("Creating new contract from contract", async function () {
    const Car = await ethers.getContractFactory("Car");
    const carDeployed = await Car.deploy("hr","A");
    await carDeployed.deployed();
    // console.log(carDeployed.address);

    const createCar = await ethers.getContractFactory("createCar");
    const createCarDeployed = await createCar.deploy();
    await createCarDeployed.deployed();
    console.log(createCarDeployed.address);

    await createCarDeployed.creater1("suzuki","ali");
    let cars1=await createCarDeployed.getCar(0)
    console.log(cars1);
  });
  it("FunctionSelector:getSelector function test", async function () {
    const SelectorTest = await ethers.getContractFactory("SelectorTest");
    const deployedSelectorTest = await SelectorTest.deploy();
    await deployedSelectorTest.deployed();
    console.log(deployedSelectorTest.address);
    const functionSelector = await ethers.getContractFactory("FunctionSelector");
    const deployedFunctionSelector = await functionSelector.deploy();
    await deployedFunctionSelector.deployed();
    console.log(deployedFunctionSelector.address);
    let getSelector=await deployedFunctionSelector.getSelector("transfer(address,uint256)");
    console.log(getSelector);
    let functionCall=await deployedFunctionSelector.callfunction(getSelector,deployedSelectorTest.address,8);
    console.log(functionCall.toString());
  });

  it("tryCatch function test from other contract", async function () {
    const [owner,user1,user2]=await ethers.getSigners();
    const Foo = await ethers.getContractFactory("Foo");
    const calleeDeployed = await Foo.deploy(owner.address);
    await calleeDeployed.deployed();

    const tryCatch = await ethers.getContractFactory("tryCatch");
    const tryCatchDeployed = await tryCatch.deploy();
    await tryCatchDeployed.deployed();

    const foo=await tryCatchDeployed.callFooFunction(calleeDeployed.address,4);
    console.log(foo);
  });

  it("tryCatch function test from other contract", async function () {
    const use= await ethers.getContractFactory("use");
    const useDeploy= await use.deploy();
    await useDeploy.deployed();

    const n=await useDeploy.number(2,4);
    console.log(n);
  });
  it.only("tryCatch function test from other contract", async function () {
    const Hashing= await ethers.getContractFactory("Hashing");
    const hashingDeploy= await Hashing.deploy();
    await hashingDeploy.deployed();

    await hashingDeploy.first("ali",30,true);
    const guess=await hashingDeploy.guessing("ali",30,true);
    expect(guess).to.equal(true);
  });
});
