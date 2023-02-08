pragma solidity ^0.8.17;

import "./libraries/StructHelpers.sol";
import "./libraries/Appointment.sol";


// CRUD operations for to Book,Modify,Reschedule,Cancel,Retrieve appointments.
contract AppointmentScheduler {
    using Appointment for Appointment.AppointmentRecord;

    mapping (bytes32 => Appointment.AppointmentRecord) public appointments;    
    mapping(bytes32 => bool) public appointmentStatus;
    
    Appointment.AppointmentRecord private defaultAppointment;
    
    //Constructor
    constructor() public {
            defaultAppointment = Appointment.AppointmentRecord({
                id: bytes32(0),
                appointmentDate : 0,
                appointmentTime : 0,
                patientAddress : address(0),
                doctorAddress : address(0),
                reminderMethod : "",
                reminderBeforeInMins : 0,
                message : ""
            });    
    }

    /*modifier checkIsDefault(Appointment appt) {
        require(msg.sender == admin, "Access Denied: Only the admin can perform this action");
        require(appt.length != 0, "Appointment Data is Zero Bu");
        _;
    }*/

    //Creating a new Appointment
    function bookAppointment(Appointment.AppointmentRecord memory appointment) external returns (Appointment.AppointmentRecord memory){        
        bytes32 apptId = getHashId(appointment.appointmentDate,appointment.appointmentTime);
        require(appointmentStatus[apptId], "This appointment slot is not available");
        require(!(StructHelpers.isDefault(abi.encode(appointment))),"Empty Appointment. Prepare appointment again");
        // Booking a new Appointment.
        appointments[apptId] = appointment;
        // Making Appointment slot unavailable.
        appointmentStatus[apptId] = false;
        return appointments[apptId];
    }
    
    /*function modifyAppointment(bytes32 apptId,Appointment.AppointmentRecord memory _appointment) external returns (Appointment.AppointmentRecord memory){
        //Appointment memory appointment = appointments[apptId];
        bytes32 id = getHashId(_appointment.appointmentDate,_appointment.appointmentTime);
        if(apptId != id){
            require(appointmentStatus[id], "This appointment slot is not available");
            appointments[id] = _appointment;
            appointmentStatus[id] = false;
            
            // Reset the old appointment to make it a default appointment.
            appointments[apptId] = new Appointment.AppointmentRecord();
            //Change old appointment slot to available.
            appointmentStatus[apptId] = true;            
        }
        appointments[apptId] = _appointment;    
        return _appointment;
    }
    
    function cancelAppointment(bytes32 apptId) external view  {
        appointments[apptId] = new Appointment.AppointmentRecord();
        appointmentStatus[apptId] = true;
    } */

    // Appointment Reschedule Function.

    // Retrieve Appointment.
    function getAppointment(bytes32 apptId) public view returns (Appointment.AppointmentRecord memory) {
    return appointments[apptId];
    }
 
    // Check if the slot is available or not.
    function checkAvailability(bytes32 slot) public view returns (bool) {        
        return appointmentStatus[slot];
    }
    // Only for 1 Doctor-1 facility. If Multiple Doctors or multiple facilities, then we have add these 2 param to get hash ID.
    function getHashId(uint256 date, uint256 time) public pure returns (bytes32){
        return keccak256(abi.encodePacked(date, time));
    }
}
