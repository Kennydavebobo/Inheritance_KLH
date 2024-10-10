// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IExternalCarContract {
    function getCarPrice(uint256 carId) external view returns (uint256);
}
