-- Databases Introduction

-- 07. Create Table People
 

CREATE TABLE People
(
  Id  INT IDENTITY UNIQUE,
  [Name] NVARCHAR(200) NOT NULL,
  Picture VARBINARY(2000),
  Height  FLOAT(2),
  [Weight] FLOAT(2),
  Gender VARCHAR(1) NOT NULL CHECK (Gender = 'm' OR Gender = 'f'),
  Birthdate DATETIME NOT NULL,
  Biography NVARCHAR(MAX),
)

INSERT INTO People([Name], Height, [Weight], Gender, Birthdate, Biography)
	VALUES('Iv', 1.23, 65.0, 'f', 05/01/1986, 'sshhshshshhshsshsh' ), 
	('Iv', 1.23, 65.0, 'f', 05/01/1986, 'sshhshshshhshsshsh' ), 
	('Iv', 1.23, 65.0, 'f', 05/01/1986, 'sshhshshshhshsshsh' ), 
	('Iv', 1.23, 65.0, 'f', 05/01/1986, 'sshhshshshhshsshsh' ),
	('Iv', 1.23, 65.0, 'f', 05/01/1986, 'sshhshshshhshsshsh' )

SELECT * FROM People

-- 08. Create Table Users

CREATE TABLE Users(
	Id BIGINT IDENTITY UNIQUE,
	Username VARCHAR(30) NOT NULL, 
	[Password] VARCHAR (26) NOT NULL, 
	ProfilePicture VARBINARY(900),
	LastLoginTime DATETIME, 
	IsDeleted VARCHAR(5) NOT NULL CHECK (IsDeleted = 'TRUE' OR IsDeleted = 'FALSE')
)

INSERT INTO Users(Username, Password, IsDeleted)
VALUES('GAGAGAG', 'SSJSJS','FALSE'),
('GAGAGAG', 'SSJSJS','FALSE'),
('GAGAGAG', 'SSJSJS','FALSE'),
('GAGAGAG', 'SSJSJS','FALSE'),
('GAGAGAG', 'SSJSJS','FALSE')

SELECT * FROM Users

CREATE DATABASE Movies

CREATE TABLE Directors(
	Id INT IDENTITY UNIQUE, 
	DirectorName VARCHAR(50) NOT NULL, 
	Notes VARCHAR(MAX)
)

INSERT INTO Directors (DirectorName, Notes)
VALUES ('GAGAGA GAGAGG', 'GAGAGAGAGGAGAGAGAGAGGA'),
('KAKKAKAK KAKKAK', 'GAGAGAGAGGAGAGAGAGAGGA'),
('HSLSLSL KSKSKKSK', 'GAGAGAGAGGAGAGAGAGAGGA'),
('PAPPAP AKKAKKA', 'GAGAGAGAGGAGAGAGAGAGGA'),
('KAKKDII KSKSKKS', 'GAGAGAGAGGAGAGAGAGAGGA')

CREATE TABLE Genres(
	Id INT IDENTITY UNIQUE, 
	GenreName VARCHAR(50) NOT NULL, 
	Notes VARCHAR(MAX)
)

INSERT INTO Genres (GenreName, Notes)
VALUES ('HOROR', 'GAGAGAGAGGAGAGAGAGAGGA'),
('DRAMA', 'GAGAGAGAGGAGAGAGAGAGGA'),
('COMEDY', 'GAGAGAGAGGAGAGAGAGAGGA'),
('OTHER', 'GAGAGAGAGGAGAGAGAGAGGA'),
('FANTASY', 'GAGAGAGAGGAGAGAGAGAGGA')

CREATE TABLE Categories(
	Id INT IDENTITY UNIQUE, 
	CategoryName VARCHAR(50) NOT NULL, 
	Notes VARCHAR(MAX)
)

INSERT INTO Categories (CategoryName, Notes)
VALUES ('SJSJJS', 'GAGAGAGAGGAGAGAGAGAGGA'),
('JSJSJJS', 'GAGAGAGAGGAGAGAGAGAGGA'),
('KSKSLL', 'GAGAGAGAGGAGAGAGAGAGGA'),
('XKXXKLXL', 'GAGAGAGAGGAGAGAGAGAGGA'),
('XXJXJJJ', 'GAGAGAGAGGAGAGAGAGAG')

CREATE TABLE Movies(
Id INT IDENTITY UNIQUE, 
Title VARCHAR(MAX) NOT NULL, 
DirectorId INT FOREIGN KEY REFERENCES Directors(Id) NOT NULL, 
CopyrightYear INT NOT NULL , 
[Length] FLOAT(2) NOT NULL, 
GenreId INT FOREIGN KEY REFERENCES Genres(Id) NOT NULL, 
CategoryId INT FOREIGN KEY REFERENCES Categories (Id) NOT NULL, 
Rating FLOAT(1) NOT NULL, 
Notes VARCHAR(MAX)
)

INSERT INTO Movies ( Title, DirectorId, CopyrightYear, [Length], GenreId, CategoryId, Rating, Notes)
VALUES ('FSFSFSF', 2, 2020, 2.23, 3, 4, 1.1, 'GGGGGGGGGGGGGGGGGGGGG'),
('FSFSFSF', 2, 2020, 2.23, 3, 4, 1.1, 'GGGGGGGGGGGGGGGGGGGGG'),
('FSFSFSF', 2, 2020, 2.23, 3, 4, 1.1, 'GGGGGGGGGGGGGGGGGGGGG'),
('FSFSFSF', 2, 2020, 2.23, 3, 4, 1.1, 'GGGGGGGGGGGGGGGGGGGGG'),
('FSFSFSF', 2, 2020, 2.23, 3, 4, 1.1, 'GGGGGGGGGGGGGGGGGGGGG')
       
SELECT * FROM Directors
SELECT * FROM Genres
SELECT * FROM Categories
SELECT * FROM Movies

-- 14. Car Rental Database
CREATE DATABASE CarRental

USE CarRental

CREATE TABLE Categories(
	Id INT IDENTITY UNIQUE, 
	CategoryName VARCHAR(50) NOT NULL, 
	DailyRate FLOAT(2) NOT NULL, 
	WeeklyRate FLOAT(2) NOT NULL, 
	MonthlyRate FLOAT(2) NOT NULL, 
	WeekendRate FLOAT(2) NOT NULL
)       

INSERT INTO Categories(CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES ('DJJDJD', 2.23, 2.56, 1.25, 5.63), 
('XXSS', 2.23, 2.56, 1.25, 5.63),
('DJSSSJDJD', 2.23, 2.56, 1.25, 5.63)


CREATE TABLE Cars (
	Id INT IDENTITY UNIQUE, 
	PlateNumber INT NOT NULL, 
	Manufacturer VARCHAR(50), 
	Model VARCHAR(50) NOT NULL, 
	CarYear INT NOT NULL, 
	CategoryId INT NOT NULL FOREIGN KEY REFERENCES Categories(Id), 
	Doors INT, 
	Picture VARBINARY(2000), 
	Condition VARCHAR(50), 
	Available VARCHAR(5) NOT NULL CHECK (Available = 'TRUE' OR Available = 'FALSE') 
)

INSERT INTO Cars(PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors,  Condition, Available)
VALUES (1234, 'BABBA', 'GAGAGAG' , 2525, 2, 4, 'N', 'FALSE'),
(1234, 'BABBA', 'GAGAGAG' , 2525, 2, 4, 'N', 'FALSE'),
(1234, 'BABBA', 'GAGAGAG' , 2525, 2, 4, 'N', 'FALSE')      

CREATE TABLE Employees(
	Id INT IDENTITY UNIQUE, 
	FirstName NVARCHAR(50) NOT NULL, 
	LastName NVARCHAR(50) NOT NULL, 
	Title NVARCHAR(50), 
	Notes NVARCHAR(MAX)
)

INSERT INTO Employees (FirstName, LastName, Title, Notes)
VALUES ('PESHO', 'PESHOV', 'JJSJSJS' , 'GDGDGDGDGGDDGDGGD'), 
('PESHO', 'PESHOV', 'JJSJSJS' , 'GDGDGDGDGGDDGDGGD'), 
('PESHO', 'PESHOV', 'JJSJSJS' , 'GDGDGDGDGGDDGDGGD')

CREATE TABLE Customers(
	Id INT IDENTITY UNIQUE, 
	DriverLicenceNumber INT NOT NULL, 
	FullName NVARCHAR(50) NOT NULL, 
	Address NVARCHAR(MAX)NOT NULL, 
	City NVARCHAR(50) NOT NULL, 
	ZIPCode NVARCHAR(20) NOT NULL, 
	Notes NVARCHAR(MAX)
)

INSERT INTO Customers(DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
VALUES (451544455, 'DHDHDHHDHDDH', 'GSSGGSGSGSG','FDFDF','HSHSHSH', 'JXJJSJSJSJJSJSJS'),
(451544455, 'DHDHDHHDHDDH', 'GSSGGSGSGSG','FDFDF','HSHSHSH', 'JXJJSJSJSJJSJSJS'),
(451544455, 'DHDHDHHDHDDH', 'GSSGGSGSGSG','FDFDF','HSHSHSH', 'JXJJSJSJSJJSJSJS')


CREATE TABLE RentalOrders (
Id INT IDENTITY UNIQUE, 
EmployeeId INT NOT NULL FOREIGN KEY REFERENCES Employees(Id), 
CustomerId INT NOT NULL FOREIGN KEY REFERENCES Customers(Id), 
CarId INT NOT NULL FOREIGN KEY REFERENCES Cars(Id), 
TankLevel INT NOT NULL, 
KilometrageStart INT NOT NULL, 
KilometrageEnd INT NOT NULL, 
TotalKilometrage INT NOT NULL, 
StartDate DATE NOT NULL, 
EndDate DATE NOT NULL, 
TotalDays INT NOT NULL, 
RateApplied FLOAT(2) NOT NULL, 
TaxRate FLOAT(2) NOT NULL, 
OrderStatus VARCHAR(50) NOT NULL, 
Notes VARCHAR(MAX) 
)

INSERT INTO RentalOrders(EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
VALUES (2, 3, 2, 12, 125252,135353, 22222222, '2008-11-11', '2008-11-11', 1, 2.23,3.33,'JSJSJ','HSHSHSHSSHSH'),   
(2, 3, 2, 12, 125252,135353, 22222222, '2008-11-11', '2008-11-11', 1, 2.23,3.33,'JSJSJ','HSHSHSHSSHSH'),
(2, 3, 2, 12, 125252,135353, 22222222, '2008-11-11', '2008-11-11', 1, 2.23,3.33,'JSJSJ','HSHSHSHSSHSH')

SELECT * FROM Categories
SELECT * FROM Cars
SELECT * FROM Employees
SELECT * FROM Customers
SELECT * FROM RentalOrders

-- 15. Hotel Database

CREATE DATABASE Hotel

USE Hotel

CREATE TABLE Employees(
Id INT IDENTITY UNIQUE, 
FirstName VARCHAR(50) NOT NULL, 
LastName VARCHAR(50) NOT NULL, 
Title VARCHAR(50) NOT NULL, 
Notes VARCHAR(MAX)   
)

INSERT INTO Employees(FirstName, LastName, Title, Notes)
VALUES ('DDDDD', 'DFFFFFF', 'DDDD', 'FFFFFFFFFFFFFFFFFFFF'),
('DDDDD', 'DFFFFFF', 'DDDD', 'FFFFFFFFFFFFFFFFFFFF'),
('DDDDD', 'DFFFFFF', 'DDDD', 'FFFFFFFFFFFFFFFFFFFF')

CREATE TABLE Customers(
AccountNumber INT UNIQUE, 
FirstName VARCHAR(50) NOT NULL, 
LastName VARCHAR(50) NOT NULL, 
PhoneNumber VARCHAR(50) NOT NULL, 
EmergencyName VARCHAR(50) NOT NULL, 
EmergencyNumber VARCHAR(50) NOT NULL,
Notes VARCHAR(MAX)
)

INSERT INTO Customers(AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
VALUES (124545455, 'DDDDDD', 'FFFFFF', '5541124445', 'FFFFFFF', 'FFFFFFFF', 'DDDDDDDDD'),
(124545456, 'DDDDDD', 'FFFFFF', '5541124445', 'FFFFFFF', 'FFFFFFFF', 'DDDDDDDDD'),
(124545457, 'DDDDDD', 'FFFFFF', '5541124445', 'FFFFFFF', 'FFFFFFFF', 'DDDDDDDDD')

CREATE TABLE RoomStatus(
RoomStatus VARCHAR(50) PRIMARY KEY,
Notes VARCHAR(MAX)
)

INSERT INTO RoomStatus(RoomStatus, Notes)
VALUES ('FREE', 'JSJSJJSJ'),
('OCUPIED', 'JSJSJJSJ'),
('OOO', 'JSJSJJSJ')

CREATE TABLE RoomTypes(
RoomType VARCHAR(50) PRIMARY KEY,
Notes VARCHAR(MAX)
)
INSERT INTO RoomTypes(RoomType, Notes)
VALUES ('MEDIUM', 'JSJSJJSJ'),
('LOW', 'JSJSJJSJ'),
('HIGH', 'JSJSJJSJ')

CREATE TABLE BedTypes(
BedType VARCHAR(50) PRIMARY KEY,
Notes VARCHAR(MAX)
)

INSERT INTO BedTypes(BedType, Notes)
VALUES ('MEDIUM', 'JSJSJJSJ'),
('LOW', 'JSJSJJSJ'),
('HIGH', 'JSJSJJSJ')

CREATE TABLE Rooms(
RoomNumber INT PRIMARY KEY, 
RoomType VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES RoomTypes(RoomType), 
BedType VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES BedTypes(BedType), 
Rate FLOAT(2) NOT NULL, 
RoomStatus VARCHAR(50) NOT NULL FOREIGN KEY REFERENCES RoomStatus(RoomStatus), 
Notes VARCHAR(MAX)
)

INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
VALUES (123, 'LOW', 'LOW', 2.2, 'FREE', 'HSSHHSHSHS'),
(124, 'LOW', 'LOW', 2.2, 'FREE','HSSHHSHSHS' ),
(125, 'LOW', 'LOW', 2.2, 'FREE' , 'HSSHHSHSHS')


CREATE TABLE Payments(
Id INT IDENTITY UNIQUE, 
EmployeeId INT NOT NULL FOREIGN KEY REFERENCES Employees(Id), 
PaymentDate DATE NOT NULL, 
AccountNumber INT NOT NULL FOREIGN KEY REFERENCES Customers(AccountNumber), 
FirstDateOccupied DATE NOT NULL, 
LastDateOccupied DATE NOT NULL, 
TotalDays INT NOT NULL, 
AmountCharged FLOAT(2) NOT NULL, 
TaxRate FLOAT(2) NOT NULL, 
TaxAmount FLOAT(2) NOT NULL, 
PaymentTotal FLOAT(2) NOT NULL, 
Notes VARCHAR(MAX)
)


INSERT INTO Payments(EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
VALUES (2, '2018-01-01', 124545455, '2018-01-01', '2018-01-01', 1, 2.22, 1.22,1.22,3.55,'KDKKDKDKD' ),
(2, '2018-01-01', 124545455, '2018-01-01', '2018-01-01', 1, 2.22, 1.22,1.22,3.55,'KDKKDKDKD' ),
(2, '2018-01-01', 124545455, '2018-01-01', '2018-01-01', 1, 2.22, 1.22,1.22,3.55,'KDKKDKDKD' )

CREATE TABLE Occupancies(
Id INT IDENTITY UNIQUE, 
EmployeeId INT NOT NULL FOREIGN KEY REFERENCES Employees(Id), 
DateOccupied DATE NOT NULL, 
AccountNumber INT NOT NULL FOREIGN KEY REFERENCES Customers(AccountNumber), 
RoomNumber INT NOT NULL FOREIGN KEY REFERENCES Rooms(RoomNumber), 
RateApplied FLOAT(1) NOT NULL, 
PhoneCharge FLOAT(2), 
Notes VARCHAR(MAX))

INSERT INTO Occupancies (EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
VALUES (2, '2018-01-01', 124545455, 123, 2.2, 2.23, 'JDJDJDJ' ),
(2, '2018-01-01', 124545455, 123, 2.2, 2.23, 'JDJDJDJ' ),
(2, '2018-01-01', 124545455, 123, 2.2, 2.23, 'JDJDJDJ' )

SELECT * FROM Employees  
SELECT * FROM Customers
SELECT * FROM RoomStatus   
SELECT * FROM Rooms
SELECT * FROM Payments

-- 19. Basic Select All Fields
USE SoftUni

SELECT * FROM Towns
SELECT * FROM Departments
SELECT * FROM Employees

-- 20. Basic Select All Fields and Order Them
SELECT * FROM Towns
ORDER BY Name ASC

SELECT * FROM Departments
ORDER BY Name ASC

SELECT * FROM Employees
ORDER BY Salary DESC

-- 21. Basic Select Some Fields

SELECT Name FROM Towns
ORDER BY Name ASC

SELECT Name FROM Departments
ORDER BY Name ASC

SELECT FirstName, LastName, JobTitle, Salary FROM Employees
ORDER BY Salary DESC

-- 22. Increase Employees Salary

SELECT * FROM Employees

UPDATE Employees
SET Salary += Salary * 0.1

SELECT Salary FROM Employees

-- 23. Decrease Tax Rate
USE Hotel
SELECT * FROM Payments

UPDATE Payments
SET TaxRate -= TaxRate * 0.03

SELECT TaxRate FROM Payments

-- 24. Delete All Records

SELECT * FROM Occupancies 
DELETE FROM Occupancies