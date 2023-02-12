    
    library Reminder{
        
    enum ReminderStatus {
         NOT_SENT,
        SENT
    }

    struct AppointmentReminder {        
        string reminderMethod;
        uint256 reminderFrequency;
        string message;
        ReminderStatus status;
    }
    }
    