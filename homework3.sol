// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

struct Offer {
        string[] wantedItems;       // The items that the user wants   
        address trader;      	//User's address
        string offeredItem;        // The item that the user is trading
}

contract Assignment3 {
    address auctionAddress = 0xB8D513cB08A5BafD83bFd3eC7C175701EDd51B34;
    event returnedData(bool _success, bytes _data);
    event returnedOffers(bool _success, Offer[] offers);
    event returnedItems(bool _success, string[] items);
    constructor() payable   {
        (bool success, bytes memory data) = auctionAddress.call{gas:2000000}(abi.encodeWithSignature("register()"));
        require(success,"register failed");
        emit returnedData(success, data);

    }
    function getItems() public  returns(string[] memory returnValue) {
        (bool success, bytes memory data) = auctionAddress.call(abi.encodeWithSignature("getMyItems()"));
        require(success,"register failed");
        returnValue = abi.decode(data, (string[]));
        emit returnedItems(success, returnValue);
        
    }
    function announceOffer(string[] memory _wantedItems) public{
        (bool success, bytes memory data) = auctionAddress.call(abi.encodeWithSignature("announceOffer(string[])", _wantedItems));
        require(success,"register failed");
        emit returnedData(success, data);
    }
    function getAvailableOffers() external returns(Offer[] memory offers){
        (bool success, bytes memory data) = auctionAddress.call(abi.encodeWithSignature("getAvailableOffers()"));
        require(success,"register failed");
        offers = abi.decode(data, (Offer[]));
        emit returnedOffers(success, offers);
    }
    function acceptOffer(address _traderAddress) public  {
        (bool success, bytes memory data) = auctionAddress.call(abi.encodeWithSignature("acceptOffer(address)", _traderAddress));
        emit returnedData(success, data);
    }
    function endTrading() public{
        (bool success, bytes memory data) = auctionAddress.call(abi.encodeWithSignature("endTrading()"));
        require(success,"register failed");
        emit returnedData(success, data);
    }
}