// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {Hello} from "../src/Hello.sol";

contract HelloTest is Test {
    string public message = "Hello, World!";

    Hello hello;

    function setUp() public {
        hello = new Hello(message);
    }

    function testMessageInitialValue() public {
        assertEq(hello.getMessage(), message);
    }

    function testSetMessage() public {
        string memory newMessage = "Hello, Forge!";
        hello.setMessage(newMessage);
        assertEq(hello.getMessage(), newMessage);
    }
}
