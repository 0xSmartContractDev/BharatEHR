pragma solidity ^0.8.17;

library Doctor {

  // Define an enumeration for patient status
  enum Status { Active, Inactive }
  // Define a structure for a doctor
  struct DoctorRecord {
    address doctorAddress;
    string name;
    string speciality;
    uint experience;    
  }
}
