// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract   Assignment2 {
    event ReturnedData(bool _success, bytes _data);
    address otherContractAddr = 0xf456980ba64801d9a12AE003B81a76f3a9F34824;
    uint256 value;
    constructor() payable {
        value = msg.value;
    }
    
    function callSetAssignment(uint256 num) external payable {
         (bool success, bytes memory data) = payable(otherContractAddr).call{gas:2000000,value:value}(abi.encodeWithSignature("setAssignment(uint256)", num));
         require(success, "Function call failed!");
         emit ReturnedData(success, abi.decode(data, (bytes)));
    }
}
