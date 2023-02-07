pragma solidity ^0.8.17;

library Appointment{
    struct AppointmentRecord {
        bytes32 id;
        uint256 appointmentDate;
        uint256 appointmentTime;
        address patientAddress;
        address doctorAddress;        
        string  reminderMethod;
        uint256 reminderBeforeInMins;
        string  message;        
    }
}    