// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract Room
{
    // enum Status
    // {
    //     Occupied,
    //     NotOccupied        
    // }
    uint public roomsCount;

    struct roomStruct
    {
        bytes4 roomName;
        string  OccupantName;
        // uint    price;
        bool check;
        string status;
    }
    
    mapping(string => roomStruct) public roomalotment;

    function addRoom(string memory _roomName) public
    {
        roomsCount++;
        roomStruct memory room = roomalotment[_roomName];
        // room.roomName = stringToBytes32(_roomName);
        // room.check = true;
        // room.status = "Available";
        roomalotment[_roomName] = roomStruct(stringToBytes32(_roomName),room.OccupantName,true,"Available");
    }

    function bookRooom(string memory roomName,string memory _occupantName) public returns(string memory)
    {
        roomStruct memory room = roomalotment[roomName];
        // require(roomNo > 0 && roomNo <= roomsCount,"nahi hae bhai");
        if (room.check)
        {
            roomalotment[roomName] = roomStruct({
                roomName: room.roomName,
                OccupantName: _occupantName,
                check: false,
                status: "NOT AVAILABLE"
            });
            return ("available");
        }
        else
        {
            room.status = " available";
            return ("not available");
        }
    }

    function compareStrings (string memory a, string memory b) private pure returns (bool)
    {
      return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }


    function stringToBytes32(string memory source) private pure returns (bytes4 result) {
    bytes memory tempEmptyStringTest = bytes(source);
    if (tempEmptyStringTest.length == 0) {
        return 0x0;
    }

    assembly {
        result := mload(add(source, 32))
    }
}
}
