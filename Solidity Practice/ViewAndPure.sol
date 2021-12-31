//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

//functions can be declared to have certain visibility and behavior
//visibility - public private internal and external
//behavior view pure payable

contract ViewAndPure {
    uint public x = 1;

    //view -don't modify state
    function addToX(uint y) public view returns (uint) {
        return x+y;
    }

    //pure - don't modify state or read from the state
    //pure function can call other pure functions
    function foo() public pure {
    }
    function pureFunc() public pure {
        foo();
    }

    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }


}
