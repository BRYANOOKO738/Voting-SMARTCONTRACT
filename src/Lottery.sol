// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Lottery {
    address payable [] public players;
    address Manager;
    address payable public winner;

    constructor (){
        Manager=msg.sender;
    }
    receive() external payable {
        require(msg.value == 1 ether,"Please pay 1 ether");
        players.push(payable(msg.sender));
        players.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint){
        require(msg.sender ==  Manager, "You are not the Manager" );
        return address(this).balance;
    }

    function random() internal view returns(uint){
        return uint(keccak256(abi.encodePacked(block.prevrandao,block.timestamp,players.length)));
    }
    function pickWinner() public {
        require(msg.sender ==  Manager, "You must be a manager");
        require(players.length >=3,"Players must be at least 3  ");
        uint r =random();
        uint index = r%players.length;
        winner=players[index];
        winner.transfer(getBalance());
        players = new address payable[](0);
    }

    function allPlayers() public view returns(address payable[] memory){
        return players;
    }
}