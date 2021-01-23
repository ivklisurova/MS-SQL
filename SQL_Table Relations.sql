--01. One-To-One Relationship 

CREATE TABLE Passports(
	PassportID INT  IDENTITY(101,1) PRIMARY KEY, 
	PassportNumber VARCHAR(50) NOT NULL,
)

INSERT INTO Passports(PassportNumber)
VALUES ('N34FG21B'), ('K65LO4R7'), ('ZE657QP2')

--SELECT * FROM Passports
		
CREATE TABLE Persons (
	PersonID INT IDENTITY NOT NULL,
	FirstName VARCHAR(50) NOT NULL , 
	Salary DECIMAL(38, 2) NOT NULL , 
    PassportID INT NOT NULL , 
)

--SELECT * FROM Persons

INSERT INTO Persons(FirstName, Salary, PassportID )
VALUES 
	('Roberto', 43300.00, 102), 
	('Tom', 56100.00, 103), 
	('Yana', 60200.00, 101)

ALTER TABLE Persons
ADD PRIMARY KEY (PersonID)

ALTER TABLE Persons
ADD FOREIGN KEY (PassportID) REFERENCES Passports(PassportID)

--02. One-To-Many Relationship 

CREATE TABLE Manufacturers(
	ManufacturerID INT  IDENTITY  PRIMARY KEY, 
	[Name] VARCHAR(50) NOT NULL,
	EstablishedOn VARCHAR(10) NOT NULL
)


INSERT INTO Manufacturers([Name],EstablishedOn)
VALUES 
	('BMW', '07/03/1916'), 
	('Tesla', '01/01/2003'), 
	('Lada', '01/05/1966')

--SELECT * FROM Manufacturers

CREATE TABLE Models(
	ModelID INT  IDENTITY(101,1)  PRIMARY KEY, 
	[Name] VARCHAR(50) NOT NULL,
	ManufacturerID INT FOREIGN KEY REFERENCES Manufacturers(ManufacturerID)
)

INSERT INTO Models([Name],ManufacturerID)
VALUES 
	('X1', 1), 
	('i6', 1), 
	('Model S', 2), 
	('Model X', 2), 
	('Model', 2),
	('Nova', 3)

--SELECT * FROM Models

--03. Many-To-Many Relationship

CREATE TABLE Students(
	StudentID INT  IDENTITY  PRIMARY KEY, 
	[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Exams(
	ExamID INT  IDENTITY(101,1)  PRIMARY KEY, 
	[Name] VARCHAR(50) NOT NULL
)


INSERT INTO Students([Name])
VALUES 
	('Mila'), 
	('Toni'), 
	('Ron')

INSERT INTO Exams([Name])
VALUES 
	('SpringMVC'), 
	('Neo4j'), 
	('Oracle 11g')

--SELECT * FROM Students
--SELECT * FROM Exams


CREATE TABLE StudentsExams(
	StudentID INT NOT NULL,
	ExamID INT NOT NULL,
	CONSTRAINT PK_StudentsExams	PRIMARY KEY(StudentID, ExamID),
	CONSTRAINT FK_StudentsExams_Students FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
	CONSTRAINT FK_StudentsExams_Exams FOREIGN KEY(ExamID) REFERENCES Exams(ExamID)
)

INSERT INTO StudentsExams(StudentID, ExamID)
VALUES 
	(1,101),
	(1,102),
	(2,101),
	(3,103),
	(2,102),
	(2,103)

--SELECT * FROM StudentsExams

--04. Self-Referencing
 
CREATE TABLE Teachers(
	TeacherID INT IDENTITY(101,1) PRIMARY KEY, 
	[Name] VARCHAR(50) NOT NULL, 
	ManagerID INT FOREIGN KEY REFERENCES Teachers(TeacherID)
)

INSERT INTO Teachers
VALUES 
	('John', NULL),
	('Maya', 106),
	('Silvia', 106),
	('Ted', 105),
	('Mark', 101),
	('Greta', 101)


--SELECT * FROM Teachers

-- 05. Online Store Database

CREATE DATABASE OnlineStore

--USE OnlineStore

CREATE TABLE ItemTypes(
	ItemTypeID INT PRIMARY KEY IDENTITY, 
	[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Items(
	ItemID INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50) NOT NULL,
	ItemTypeID INT FOREIGN KEY REFERENCES ItemTypes(ItemTypeId)
)

CREATE TABLE Cities(
	CityID INT PRIMARY KEY IDENTITY, 
	[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50) NOT NULL,
	Birthday DATE, 
	CityID INT FOREIGN KEY REFERENCES Cities(CityId)
)

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY IDENTITY, 
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerId)
)

CREATE TABLE OrderItems(
	OrderID INT FOREIGN KEY(OrderId) REFERENCES Orders(OrderID),
	ItemID INT FOREIGN KEY(ItemId) REFERENCES Items(ItemID),
	CONSTRAINT PK_OrdersItems PRIMARY KEY(OrderID, ItemID)
)

-- 06. University Database

CREATE DATABASE UniversityDatabase
USE UniversityDatabase


CREATE TABLE Subjects(
	SubjectID INT IDENTITY PRIMARY KEY,
	SubjectName VARCHAR(50) NOT NULL
)

CREATE TABLE Majors(
	MajorID INT IDENTITY PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL
)

CREATE TABLE Students(
	StudentID INT IDENTITY PRIMARY KEY,
	StudentNumber INT UNIQUE NOT NULL,
	StudentName VARCHAR(50) NOT NULL,
	MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Payments(
	PaymentID INT IDENTITY PRIMARY KEY,
	PaymentDate DATE,
	PaymentAmount DECIMAL(10,2),
	StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
)

CREATE TABLE Agenda(
	StudentID INT FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
	SubjectID INT FOREIGN KEY(SubjectID) REFERENCES Subjects(SubjectID),
	CONSTRAINT PK_OrdersItems PRIMARY KEY(StudentID, SubjectID)
)

--09. *Peaks in Rila

USE Geography

SELECT * FROM Peaks
SELECT * FROM Mountains

SELECT Mountains.MountainRange, Peaks.PeakName, Peaks.Elevation
FROM Peaks
INNER JOIN Mountains ON Peaks.MountainId = Mountains.Id
WHERE MountainRange = 'Rila'
ORDER BY Peaks.Elevation DESC
