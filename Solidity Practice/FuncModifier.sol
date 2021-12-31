//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.10;

contract FunctionModifier {

    //function modifiers
    //reusable code that can be run before or after a function
    //use cases 1) Restrict write access 2) Input Validation
    //amd 3) Reentrancy guard



    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // Set the transaction sender as the owner of the contract.
        owner = msg.sender;
    }

    //1) restricts write access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _; //executes the rest of the code
    }

    //2) modifier with parameter
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
        owner = _newOwner; //declaring modifier in function signature
    }

    // M3) odifiers can be called before and / or after a function.
    // prevents a recursive call/function calling another before it finishes executing
    modifier noReentrancy() {
        require(!locked, "No reentrancy"); //requires locked to be false

        locked = true;
        _;
        locked = false;
    }
                                      //!^ the modifier  
    function decrement(uint i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }
}
