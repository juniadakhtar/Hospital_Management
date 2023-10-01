create database hospital;
use hospital;
CREATE TABLE Patient(
SID_P INTEGER NOT NULL,
Patientid_P INTEGER,
Gender VARCHAR(20),
Addres VARCHAR(20),
PhoneNumber_P INTEGER NOT NULL,
UNIQUE(SID_P),
PRIMARY KEY(Patientid_P),
UNIQUE(PhoneNumber_P) )

CREATE TABLE Room(
Room_ID INTEGER,
Type_of_Room VARCHAR(20),
No_of_Days VARCHAR(20),
PRIMARY KEY(Room_ID) )

CREATE TABLE Staff(
SID_S INTEGER,
AreaHandle varchar(20),
Name_S varchar(20),
PhoneNumber_S INTEGER NOT NULL,
PRIMARY KEY(SID_S),
UNIQUE(PhoneNumber_S) )

CREATE TABLE Nurse_Belong_To(
SID_S INTEGER,
Age INTEGER,
No_of_Days_Worked INTEGER,
PRIMARY KEY(No_of_Days_Worked,SID_S),
FOREIGN KEY(SID_S) REFERENCES Staff(SID_S) )


CREATE TABLE Ward_Boy_Care_Belongs_To(
SID_S INTEGER,
Age INTEGER,
No_of_Days_Worked INTEGER,
PRIMARY KEY(No_of_Days_Worked,SID_S),
FOREIGN KEY(SID_S) REFERENCES Staff(SID_S) )

CREATE TABLE Treatment(
TreatmentCode INTEGER,
DiseaseName_T varchar(20),
Description_T varchar(20),
PRIMARY KEY(TreatmentCode) )

CREATE TABLE Bill_Payed_By(
PatientId_P INTEGER,
Bill_ID INTEGER,
No_of_Days varchar(20),
fees Real,
PRIMARY KEY(Bill_ID,PatientId_P),
FOREIGN KEY(PatientId_P) REFERENCES Patient(PatientId_P) )

CREATE TABLE Disease(
DiseaseName INTEGER,
Symptom varchar(30),
PRIMARY KEY(DiseaseName) )

CREATE TABLE Doctor(
Doctorid_D INTEGER,
Speciallization varchar(20),
Doctor_Name varchar(20),
Qualification varchar(30),
Phone_Number INTEGER NOT NULL,
UNIQUE(Phone_Number),
PRIMARY KEY(Doctorid_D) )

CREATE TABLE Assigned(
Room_ID INTEGER,
Patientid_P INTEGER,
PRIMARY KEY(Room_ID),
FOREIGN KEY(Room_ID) REFERENCES Room(Room_ID) )

CREATE TABLE Care(
SID_S INTEGER,
Patientid_P INTEGER,
PRIMARY KEY(SID_S,Patientid_P),
FOREIGN KEY(SID_S) REFERENCES Staff(SID_S),
FOREIGN KEY(Patientid_P) REFERENCES Patient(Patientid_P) )

CREATE TABLE Maintain(
SID_S INTEGER,
Room_ID INTEGER,
PRIMARY KEY(SID_S,Room_ID),
FOREIGN KEY(SID_S) REFERENCES Staff(SID_S),
FOREIGN KEY(Room_ID) REFERENCES Room(Room_ID) )

CREATE TABLE Treats(
Doctorid_D INTEGER,
Patientid_P INTEGER,
PRIMARY KEY(Doctorid_D),
FOREIGN KEY(Doctorid_D) REFERENCES Doctor(Doctorid_D),
FOREIGN KEY(Patientid_P) REFERENCES Patient(Patientid_P) )

CREATE TABLE Super_From(
DiseaseName INTEGER,
Patientid_P INTEGER,
PRIMARY KEY(Patientid_P),
FOREIGN KEY(DiseaseName) REFERENCES Disease(DiseaseName),
FOREIGN KEY(Patientid_P) REFERENCES Patient(Patientid_P) )

CREATE TABLE Gets(
TreatmentCode INTEGER,
Patientid_p INTEGER,
PRIMARY KEY(Patientid_P),
FOREIGN KEY(TreatmentCode) REFERENCES Treatment(TreatmentCode),
FOREIGN KEY(Patientid_P) REFERENCES Patient(Patientid_P) )