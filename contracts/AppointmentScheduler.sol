pragma solidity ^0.8.17;

contract AppointmentScheduler {
    struct Appointment {
        bytes32 id;
        uint256 date;
        uint256 time;
        address patientAddress;
        bool isAvailable;
        string reminderMethod;
        uint256 reminderFrequency;
        string message;        
    }
    
    //Need to implement modifiers. Change visibility for some methods.
    //Need to implement array to iterate mapping.
    mapping (bytes32 => Appointment) public appointments;    
    
    function bookAppointment(uint256 _appointmentDate, uint256 _appointmentTime, address patientAddress, string memory _reminderMethod, uint256 _reminderFrequency, string memory _message) external returns (Appointment memory){        
        bytes32 id = getHashId(_appointmentDate,_appointmentTime);
        require(appointments[id].isAvailable, "This appointment slot is not available");
        appointments[id] = Appointment(id, _appointmentDate, _appointmentTime, patientAddress, false,_reminderMethod,_reminderFrequency,_message);        
        return appointments[id];
    }
    
    function modifyAppointment(bytes32 id, uint256 date, uint256 time) external {
        Appointment storage appointment = appointments[id];
        appointment.date = date;
        appointment.time = time;        
    }
    
    function cancelAppointment(bytes32 id) public {
        Appointment storage appointment = appointments[id];
        appointment.date = 0;
        appointment.time = 0;
        appointment.patientAddress = address(0);
        appointment.isAvailable = true;
    }

    function getAppointment(bytes32 id) public view returns (Appointment memory) {
    return appointments[id];
    }
 
    function checkAvailability(bytes32 id) public view returns (bool) {
        Appointment storage appointment = appointments[id];
        return appointment.isAvailable;
    }
    // Only for 1 Doctor-1 facility. If Multiple Doctors or multiple facilities, then use both to get hash ID.
    function getHashId(uint256 date, uint256 time) public pure returns (bytes32){
        return keccak256(abi.encodePacked(date, time));
    }
}
