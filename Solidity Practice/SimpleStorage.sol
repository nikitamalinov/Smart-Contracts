//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.7;

contract SimpleStorage {
    string public text; //stored on the blockchain/smart contract - state variable
    //solidity automatically creates a getter function for the public state variable

    //storage = value stored somewhere in our contract
    //memory = value stored outside the contract
    function set(string memory _text) public {
        text = _text;

    }

    //2 types of functions 1) creates transactions 2) does not - has to use view or pure keyword

    //view - does not change the state of the blockchain
    //pure - does not change state of blockchain and does not read any variables
    //writing storage instead of memory will yield a reference to the variable
    function get() public view returns (string memory) {
        return text;
    }

}
