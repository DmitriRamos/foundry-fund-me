// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    // Create a new instance of the FundMe contract.
    FundMe fundMe;

    // the setUp() function is called before each test. It sets up the test by creating a new instance of the FundMe contract.
    // external means that the function can be called from outside the contract.
    function setUp() external {
        // Set up the test by creating a new instance of the FundMe contract.
        fundMe = new FundMe();
    }

    // public means that the function can be called from outside the contract.
    function testMinimumDollarIsFive() public {
        // assertEq() is a Solidity function that asserts that two values are equal.
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    // Below we are testing that the owner of the contract is the msg.sender, which is the sender of the transaction.
    function testOwnerIsMsgSender() public {
        console.log("owner: ", fundMe.i_owner());
        console.log("sender: ", address(this));
        // address(this) is a Solidity function that returns the address of the current contract.
        assertEq(fundMe.i_owner(), address(this));
    }
}
