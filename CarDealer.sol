// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ElectricCar.sol";
import "./ExternalCarContract.sol";

// Contract for car dealership that interacts with external contract
contract CarDealer {
    IExternalCarContract public externalCarContract;

    constructor(address _externalCarContractAddress) {
        externalCarContract = IExternalCarContract(_externalCarContractAddress);
    }

    // Function to get car price from external contract
    function getCarPriceFromExternalContract(uint256 carId) public view returns (uint256) {
        return externalCarContract.getCarPrice(carId);
    }
}
