pragma solidity ^0.8.17;

library Patient {

    // Define an enumeration for patient status
    enum Status { Active, Inactive }

    struct PatientDetails {
        address patientAddress;
        string firstName;
        string lastName;
        uint age;        
    }
}
