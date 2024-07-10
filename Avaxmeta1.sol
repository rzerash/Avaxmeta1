// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract to manage customer information for a small local store
contract CustomerInfo {
    // Mapping to store customer information
    mapping(address => Customer) public customers;

    // Struct to represent customer information
    struct Customer {
        uint age;
        bool isMember;
    }

    // Function to set customer information
    function setCustomerInfo(uint _age, bool _isMember) public {
        customers[msg.sender] = Customer(_age, _isMember);
    }

    // Function to check if a customer is eligible for a discount
    function checkEligibility() public view returns (bool) {
        Customer storage customer = customers[msg.sender];
        require(customer.age > 0, "Age is not set. Please set your age first.");
        require(customer.isMember == true, "You are not a member.");
        if (customer.age >= 18) {
            return true;
        } else {
            revert("You are not eligible for a discount.");
        }
    }
}