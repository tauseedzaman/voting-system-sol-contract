// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";

contract HelloScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
    }
}
