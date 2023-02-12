pragma solidity ^0.8.17;

//import "./AppointmentReminder.sol";

library Appointment{
    struct AppointmentRecord {
        bytes32 id;
        uint256 appointmentDate;
        uint256 appointmentTime;
        bool    isAvailable;
        address patientAddress;
        address doctorAddress;        
        AppointmentReminder reminder;      
    }
    
    enum ReminderStatus {
        NOT_SENT,
        SENT,
        PENDING
    }

    struct AppointmentReminder {        
        string reminderMethod;
        uint256 reminderFrequency;
        string message;
        ReminderStatus status;
    }
}    