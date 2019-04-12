CREATE TABLE Cours(
	coursID INT PRIMARY KEY NOT NULL,
    courseName varchar(50) NOT NULL,
    courseCode varchar(50) NOT NULL,
    courseInfo varchar(250)
);

CREATE TABLE Roles(
    roleID INT PRIMARY KEY NOT NULL,
    roleName VARCHAR(50) NOT NULL
);

CREATE TABLE RoomType(
    typeID INT PRIMARY KEY NOT NULL,
    typeName VARCHAR(50) NOT NULL
);

CREATE TABLE Account(
    accountID INT PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    roleID INT NOT NULL
);

ALTER TABLE Account
ADD CONSTRAINT FK_Account_roleID FOREIGN KEY (roleID) REFERENCES Roles(roleID); 

CREATE TABLE Groupe(
    groupID INT PRIMARY KEY NOT NULL,
    groupNumber varchar(5) NOT NULL,
    coursID INT NOT NULL
);

ALTER TABLE Groupe
ADD CONSTRAINT FK_Groupe_coursID FOREIGN KEY (coursID) REFERENCES Cours(coursID); 

CREATE TABLE Student(
    studentID INT PRIMARY KEY NOT NULL,
    studentNumber INT,
    studentName VARCHAR(50) NOT NULL,
    studentFName VARCHAR(50) NOT NULL,
    accountName VARCHAR(50) NOT NULL,
    horaire VARCHAR(50),
    accountID INT NOT NULL
);

ALTER TABLE Student
ADD CONSTRAINT FK_Student_accountID FOREIGN KEY (accountID) REFERENCES Account(accountID); 

CREATE TABLE Teacher(
    teacherID INT PRIMARY KEY NOT NULL,
    teacherName VARCHAR(50) NOT NULL,
    teacherFName VARCHAR(50) NOT NULL,
    accountID INT
);

ALTER TABLE Teacher
ADD CONSTRAINT FK_Teacher_accountID FOREIGN KEY (accountID) REFERENCES Account(accountID); 

CREATE TABLE GroupStudent(
studentID int NOT NULL,
groupID int NOT NULL
);

ALTER TABLE GroupStudent
ADD FOREIGN KEY (studentID) REFERENCES Student(studentID);
ALTER TABLE GroupStudent
ADD FOREIGN KEY (groupID) REFERENCES Groupe(groupID);

CREATE TABLE Room(
    roomID INT PRIMARY KEY NOT NULL,
    wing CHAR NOT NULL,
    floor INT NOT NULL,
    number INT NOT NULL,
    places INT NOT NULL,
    typeID INT NOT NULL
);

ALTER TABLE Room
ADD CONSTRAINT FK_Room_typeID FOREIGN KEY (typeID) REFERENCES RoomType(typeID);

CREATE TABLE Class(
    classID INT PRIMARY KEY NOT NULL,
    startTime TIME NOT NULL,
    endTime TIME,
    roomID INT NOT NULL,
    coursID INT NOT NULL,
    teacherID INT NOT NULL,
    groupID INT NOT NULL
);

ALTER TABLE Class
ADD CONSTRAINT FK_Class_roomID FOREIGN KEY (roomID) REFERENCES Room(roomID);
ALTER TABLE Class
ADD CONSTRAINT FK_Class_coursID FOREIGN KEY (coursID) REFERENCES Cours(coursID);
ALTER TABLE Class
ADD CONSTRAINT FK_Class_teacherID FOREIGN KEY (teacherID) REFERENCES Teacher(teacherID);
ALTER TABLE Class
ADD CONSTRAINT FK_Class_groupID FOREIGN KEY (groupID) REFERENCES Groupe(groupID); 