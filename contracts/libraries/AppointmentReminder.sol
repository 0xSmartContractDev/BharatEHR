    
    library Reminder{
        
    struct AppointmentReminder {
        address doctorAddress;
        string reminderMethod;
        uint256 reminderFrequency;
        string message;        
    }
        struct AppointmentRecord {
        bytes32 id;
        uint256 date;
        uint256 time;
        address patientAddress;
        bool isAvailable;
        AppointmentReminder reminder;
    }
    }
    