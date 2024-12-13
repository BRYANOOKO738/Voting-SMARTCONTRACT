// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Lottery} from "../src/Lottery.sol";

contract DeployLottery is Script {
    function run() public returns (Lottery) {
        // Broadcast the transaction from the default account
        vm.startBroadcast();
        
        // Deploy the Lottery contract
        Lottery lottery = new Lottery();
        
        vm.stopBroadcast();
        
        // Log the contract address
        console.log("Lottery contract deployed to:", address(lottery));
        
        return lottery;
    }
}