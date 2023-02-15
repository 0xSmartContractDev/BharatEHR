pragma solidity >=0.8.0 <=0.8.17;

import "./libraries/Patient.sol";
import "./libraries/Doctor.sol";
import "./OwnableAdmin.sol";

contract AdminTasks is OwnableAdmin{
    
    mapping (address => Patient.PatientDetails) patients;
    mapping (address => Doctor.DoctorRecord) doctors;


    modifier onlyEOA() {
        address callingAddress = msg.sender; 
        uint32 size;
        assembly{
            size := extcodesize(callingAddress)
        }
        require(
            size == 0,
            "Only EOA addresses are allowed."
        );
        _;
    }
 

    // Function to set the admin
    function setAdmin(address _admin) external onlyOwner {
        admin = _admin;
    }    

    // Event for patient creation
    event PatientCreated(address ptAddress, string firstName, string lastName);

    // Event for patient update
    event PatientUpdated(address ptAddress, string firstName, string lastName);

    // Event for patient deletion
    event PatientDeleted(address ptAddress);

    // Event for doctor creation
    event DoctorCreated(address docAddress, string firstName, string lastName);

    // Event for doctor update
    event DoctorUpdated(address docAddress, string firstName, string lastName);

    // Event for doctor deletion
    event DoctorDeleted(address docAddress);
    

    function addPatient(address patientAddress, string memory firstName, string memory lastName, uint age) external onlyEOA onlyAdmin {
        patients[patientAddress] = Patient.PatientDetails(patientAddress, firstName, lastName, age);
        emit PatientCreated(patientAddress, firstName, lastName);
    }

    function updatePatient(address patientAddress, string memory firstName, string memory lastName, uint age) external onlyEOA onlyAdmin {
        Patient.PatientDetails memory patient = patients[patientAddress];
        patient.firstName = firstName;
        patient.lastName = lastName;
        patient.age = age;
        patients[patientAddress] = patient;

        emit PatientUpdated(patientAddress,firstName,lastName);
    }

    function deletePatient(address patientAddress) external onlyEOA onlyAdmin {
        delete patients[patientAddress];
        emit PatientDeleted(patientAddress);
    }

    function getPatient(address patientAddress) onlyEOA external view returns (address, string memory, string memory, uint) {
        Patient.PatientDetails memory patient = patients[patientAddress];
        return (patient.patientAddress, patient.firstName, patient.lastName, patient.age);
    }

    function addDoctor(address doctorAddress, string memory firstName, string memory lastName, uint age) external onlyEOA onlyAdmin {
        doctors[doctorAddress] = Doctor.DoctorRecord(doctorAddress, firstName, lastName, age);
        emit DoctorCreated(doctorAddress, firstName, lastName);
    }

    function updateDoctor(address doctorAddress, string memory name, string memory speciality) external onlyEOA onlyAdmin {
        Doctor.DoctorRecord memory doctor = doctors[doctorAddress];
        doctor.name = name;        
        doctor.speciality = speciality;
        doctors[doctorAddress] = doctor;
        emit DoctorUpdated(doctorAddress,name,speciality);
    }

    function deleteDoctor(address doctorAddress) external onlyEOA onlyAdmin {
        delete doctors[doctorAddress];
        emit DoctorDeleted(doctorAddress);
    }    

    function getDoctor(address doctorAddress) external onlyEOA view returns (address, string memory, string memory, uint) {
        Doctor.DoctorRecord memory doctor = doctors[doctorAddress];
        return (doctor.doctorAddress, doctor.name, doctor.speciality,doctor.experience);
    }


    
}
