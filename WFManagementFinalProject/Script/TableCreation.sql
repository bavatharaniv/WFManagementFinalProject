CREATE TABLE SoftLock
(
       LockId int NOT NULL PRIMARY KEY,
       EmpId  int NULL,
       RequestedManager  varchar(50) NULL,
       RequestedDate  DATETIME,
       LockStatus  varchar(50) NOT NULL, 
       IsLocked Bit NULL,
       LastUpdatedDate DATETIME,
       RequestMessage   varchar(255) NOT NULL,
       WfmRemark  varchar(255) NOT NULL,
       ManagerStatus  varchar(50) NOT NULL,
       ManagerComment  varchar(255) NOT NULL,
       ManagerLastUpdatedDate  DATETIME
)

CREATE TABLE Employee (
    EmpId  int NOT NULL PRIMARY KEY,
       EmpName varchar(50) NOT NULL,
       Status varchar(50) NOT NULL,
       ManagerName varchar (30),
       wfm_MemberName varchar (30),
       Email varchar(250) NOT NULL ,
       LockStatus  varchar(50),
       Experience  decimal (5,0),
       Profile varchar(255),
       LockId int NOT NULL FOREIGN KEY REFERENCES SoftLock(LockId)
);

CREATE TABLE Skill(
       SkillId int NOT NULL PRIMARY KEY , 
       SkillName  varchar(30) NOT NULL
);


CREATE TABLE SkillMap(
       EmpId int FOREIGN KEY REFERENCES Employee(EmpId)  , 
       SkillId  int FOREIGN KEY REFERENCES Skill(SkillId)
);

CREATE TABLE [User](
       UserName varchar(50) NOT NULL PRIMARY KEY,
       [Password] varchar(50) NOT NULL,
       FirstName varchar(30) NOT NULL , 
       [Role]  varchar(30) NOT NULL,
       Email  varchar(50)
)



Select * from SoftLock
Select * from Employee
Select * from Skill
Select * from SkillMap
Select * from [User]


INSERT INTO [User] (UserName, [Password], FirstName , [Role] , Email)
VALUES
('TestManager' , '1234' , 'Jack' , 'Manager' , 'TestManager@gmail.com')

INSERT INTO [User] (UserName, [Password], FirstName , [Role] , Email)
VALUES
('TestWfmMember' , '1234' , 'Jim' , 'WfmMember' , 'TestWfmMember@gmail.com')

INSERT INTO Skill (SkillId , SkillName)
VALUES
(1,'C#')

INSERT INTO Skill (SkillId , SkillName)
VALUES
(2,'CSS')

INSERT INTO Skill (SkillId , SkillName)
VALUES
(3,'SQL')

INSERT INTO SoftLock (LockId , EmpId , LockStatus , IsLocked , LastUpdatedDate , RequestMessage, WfmRemark , ManagerStatus , ManagerComment)
Values
(1 , 1 , 'Locked' , 1 , GETDATE() , 'WfmMember did nothing so far','WfmMember did nothing so far','WfmMember did nothing so far','WfmMember did nothing so far' )

INSERT INTO SoftLock (LockId , EmpId , LockStatus , IsLocked , LastUpdatedDate , RequestMessage, WfmRemark , ManagerStatus , ManagerComment)
Values
(2 , 2 , 'Locked' , 1 , GETDATE() , 'WfmMember did nothing so far','WfmMember did nothing so far','WfmMember did nothing so far','WfmMember did nothing so far' )

INSERT INTO SoftLock (LockId , EmpId , LockStatus , IsLocked , LastUpdatedDate , RequestMessage, WfmRemark , ManagerStatus , ManagerComment)
Values
(3 , 3 , 'Locked' , 1 , GETDATE() , 'WfmMember did nothing so far','WfmMember did nothing so far','WfmMember did nothing so far','WfmMember did nothing so far' )

INSERT INTO Employee (EmpId , EmpName , [Status] , ManagerName , wfm_MemberName , Email , LockStatus , Experience , [Profile] , LockId )
VALUES
(1, 'Arun' , 'Senior Engineer' , 'Shyam' , 'Jim' , 'arun@gmail.com' , 1 , '4' , 'C# Developer' , 1)

INSERT INTO Employee (EmpId , EmpName , [Status] , ManagerName , wfm_MemberName , Email , LockStatus , Experience , [Profile] , LockId )
VALUES
(2, 'Ramya' , 'Senior Engineer' , 'Karthik' , 'Jim' , 'ramya@gmail.com' , 1 , '3' , 'CSS Developer' , 2)

INSERT INTO Employee (EmpId , EmpName , [Status] , ManagerName , wfm_MemberName , Email , LockStatus , Experience , [Profile] , LockId )
VALUES
(3, 'Rahul' , 'Senior Engineer' , 'Karthik' , 'Jim' , 'rahul@gmail.com' , 1 , '5' , 'SQL Developer' , 3)

INSERT INTO SkillMap (EmpId , SkillId)
VALUES
(1,1)

INSERT INTO SkillMap (EmpId , SkillId)
VALUES
(2,2)

INSERT INTO SkillMap (EmpId , SkillId)
VALUES
(3,3)
