// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract HelloWorld {

    struct Data {
        string str;
    }

    mapping(address => Data[]) d;

    function add(string memory _str) public {
        d[msg.sender].push(Data(_str));
    }

    function get() public view returns(Data[] memory) {
        return d[msg.sender];
    }

    function getAll() public view returns(Data[] memory) {
        require(msg.sender == 0xc9da01d74bFB7e36DbF1712801733D6f324a6C93, "Only Node A can see anyone's content.");
        return d[0x4D61b7E3C16E5E3f1a0a22cEa6e7E232d0e3A710];
    }

}