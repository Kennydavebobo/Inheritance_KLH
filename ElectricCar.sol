// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Car.sol";

// Child contract representing an Electric Car
contract ElectricCar is Car {
    uint256 public batteryCapacity; // in kWh

    constructor(
        string memory _model, 
        uint256 _year, 
        uint256 _batteryCapacity, 
        uint256 _distance
    ) Car(_model, _year, 0, _distance) { // fuel is 0 since it's an electric car
        batteryCapacity = _batteryCapacity;
    }

    // Override the getDescription function to include battery info
    function getDescription() public override view returns (string memory) {
        return string(abi.encodePacked(super.getDescription(), ", Battery Capacity: ", uint2str(batteryCapacity), " kWh"));
    }
}
