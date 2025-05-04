// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract OnChainTaxi {
    struct Ride {
        address driver;
        string passenger;
        string pickup;
        string destination;
        uint256 startTime;
        bool active;
    }

    uint256 public rideCount;
    mapping(uint256 => Ride) public rides;
    mapping(address => uint256) public reputation;

    event RideStarted(uint256 rideId, address driver, string passenger);
    event RideCompleted(uint256 rideId, address driver);

    // Start a ride
    function startRide(string memory _passenger, string memory _pickup, string memory _destination) external {
        rideCount++;
        rides[rideCount] = Ride({
            driver: msg.sender,
            passenger: _passenger,
            pickup: _pickup,
            destination: _destination,
            startTime: block.timestamp,
            active: true
        });
        emit RideStarted(rideCount, msg.sender, _passenger);
    }

    // Complete a ride
    function completeRide(uint256 _rideId) external {
        Ride storage ride = rides[_rideId];
        require(ride.active, "Ride not active");
        require(ride.driver == msg.sender, "Not your ride");

        ride.active = false;
        reputation[msg.sender] += 1;

        emit RideCompleted(_rideId, msg.sender);
    }

    // View active ride for a driver
    function getActiveRides(address _driver) external view returns (uint256[] memory) {
        uint256[] memory temp = new uint256[](rideCount);
        uint256 count = 0;
        for (uint256 i = 1; i <= rideCount; i++) {
            if (rides[i].driver == _driver && rides[i].active) {
                temp[count] = i;
                count++;
            }
        }

        // Resize the array
        uint256[] memory activeRides = new uint256[](count);
        for (uint256 j = 0; j < count; j++) {
            activeRides[j] = temp[j];
        }

        return activeRides;
    }
}
