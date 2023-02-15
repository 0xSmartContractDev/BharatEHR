// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <=0.8.17;

import "./Appointment.sol";

library IterableMapping {
        using Appointment for Appointment.AppointmentRecord;
    // Iterable mapping from address to uint;
    struct Map {
        bytes32[] keys;
        mapping(bytes32 => Appointment.AppointmentRecord) values;
        mapping(bytes32 => uint) indexOf;
        mapping(bytes32 => bool) inserted;
    }

    function isAvailable(bytes32 key) private returns (bool){
        
    }

    function get(Map storage map, bytes32 key) public view returns (Appointment.AppointmentRecord memory) {
        return map.values[key];
    }

    function getKeyAtIndex(Map storage map, uint index) public view returns (bytes32) {
        return map.keys[index];
    }

    function size(Map storage map) public view returns (uint) {
        return map.keys.length;
    }

    function set(Map storage map, bytes32 key, Appointment.AppointmentRecord memory val) public {
        if (map.inserted[key]) {
            map.values[key] = val;
        } else {
            map.inserted[key] = true;
            map.values[key] = val;
            map.indexOf[key] = map.keys.length;
            map.keys.push(key);
        }
    }

    function remove(Map storage map, bytes32 key) public {
        if (!map.inserted[key]) {
            return;
        }

        delete map.inserted[key];
        delete map.values[key];

        uint index = map.indexOf[key];
        uint lastIndex = map.keys.length - 1;
        bytes32 lastKey = map.keys[lastIndex];

        map.indexOf[lastKey] = index;
        delete map.indexOf[key];

        map.keys[index] = lastKey;
        map.keys.pop();
    }
}