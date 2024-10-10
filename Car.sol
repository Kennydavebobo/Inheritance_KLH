// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A simple library for calculating distanceTraveled
library distanceTraveled {
    function calculatedistanceTraveled(uint256 distance, uint256 fuel) internal pure returns (uint256) {
        require(fuel > 0, "Fuel must be greater than zero");
        return distance / fuel;
    }
}

// Parent contract
contract Car {
    string public model;
    uint256 public year;
    uint256 public fuel;
    uint256 public distance; 

    constructor(string memory _model, uint256 _year, uint256 _fuel, uint256 _distance) {
        model = _model;
        year = _year;
        fuel = _fuel;
        distance = _distance;
    }

    // Virtual function to be overridden
    function getDescription() public virtual view returns (string memory) {
        return string(abi.encodePacked("Model: ", model, ", Year: ", uint2str(year)));
    }

    // Function to calculate distanceTraveled using the library
    function getdistanceTraveled() public view returns (uint256) {
        return distanceTraveled.calculatedistanceTraveled(distance, fuel);
    }

    // Utility function to convert uint to string
    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
}
