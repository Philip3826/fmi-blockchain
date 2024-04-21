// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Assignment1{
    address admin;
    address owner;
    string studentData;

    constructor(){
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }
    modifier isAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }
    function setStudentData(string memory _data) public isOwner {
        studentData = _data;
    }
    function setAdmin(address _admin) public isOwner {
        admin = _admin;
    }

    function getStudentData() public view returns(string memory) {
        return studentData;
    }

    function getAdmin() public view returns(address) {
        return admin;
    }
}