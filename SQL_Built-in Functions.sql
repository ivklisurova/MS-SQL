--Part I – Queries for SoftUni Database
-- 01. Find Names of All Employees by First Name

USE SoftUni

SELECT FirstName, LastName FROM Employees
WHERE FirstName LIKE 'SA%'

--02. Find Names of All Employees by Last Name

SELECT FirstName, LastName FROM Employees
WHERE LastName LIKE '%ei%'

--03. Find First Names of All Employess
SELECT FirstName FROM Employees
WHERE DepartmentID = 3 OR DepartmentID = 10 

-- 04. Find All Employees Except Engineers

SELECT FirstName, LastName FROM Employees
WHERE JobTitle NOT LIKE '%engineer%'

-- 05. Find Towns with Name Length

SELECT Name FROM Towns
WHERE LEN([Name]) BETWEEN 5 AND 6
ORDER by [Name] ASC

-- 06. Find Towns Starting With

SELECT * FROM Towns
WHERE [Name] LIKE '[MKBE]%'
ORDER BY [Name] ASC

-- 07. Find Towns Not Starting With
SELECT * FROM Towns
WHERE [Name] NOT LIKE '[RBD]%'
ORDER BY [Name] ASC

-- 08. Create View Employees Hired After

CREATE VIEW v_EmployeesHiredAfter2000 
AS
	SELECT FirstName,LastName 
	FROM Employees
	WHERE DATEPART(YEAR,HireDate) > 2000

-- 09. Length of Last Name

SELECT FirstName,LastName FROM Employees
WHERE LEN(LastName) = 5

-- 10. Rank Employees by Salary


SELECT EmployeeID, FirstName, LastName, Salary,  
	DENSE_RANK() OVER   
		(PARTITION BY Salary ORDER BY EmployeeID ASC) AS Rank
FROM Employees
WHERE Salary BETWEEN 10000 AND 50000
ORDER BY Salary DESC


-- 11. Find All Employees with Rank 2 *

-- Not cleared ????
SELECT EmployeeID, FirstName, LastName, Salary,  
	DENSE_RANK() OVER   
		(PARTITION BY Salary ORDER BY EmployeeID ASC) AS Rank
FROM Employees
WHERE (Salary BETWEEN 10000 AND 50000) 
ORDER BY Salary DESC


-- Part II – Queries for Geography Database 

USE Geography

-- 13. Countries Holding ‘A’ 3 or More Times

SELECT CountryName, IsoCode FROM Countries
WHERE CountryName LIKE '%a%a%a%'
ORDER BY IsoCode

-- 13. Mix of Peak and River Names

SELECT Peaks.PeakName, Rivers.RiverName, CONCAT(LOWER(Peaks.PeakName), LOWER(RIGHT(Rivers.RiverName,LEN(Rivers.RiverName)-1))) AS Mix
FROM Peaks
INNER JOIN Rivers ON LOWER(RIGHT(Peaks.PeakName,1)) = LOWER(LEFT(Rivers.RiverName,1))
ORDER BY Mix

-- Part III – Queries for Diablo Database

USE Diablo

--14. Games From 2011 and 2012 Year

SELECT TOP(50) [Name], FORMAT([Start], 'yyyy-MM-dd') AS [Start]
FROM Games
WHERE DATEPART(YEAR,Start) BETWEEN 2011 AND 2012
ORDER BY [Start], [Name]

-- 15. User Email Providers

SELECT Username, SUBSTRING(Email, CHARINDEX('@', Email)+1, LEN(Email) ) AS [Email Provider]
FROM Users
ORDER BY [Email Provider], Username

-- 16. Get Users with IPAddress Like Pattern
 
SELECT Username, IpAddress FROM Users
WHERE IpAddress LIKE '___.1%.%.___'
ORDER BY Username

-- 17. Show All Games with Duration

SELECT * FROM Games    

SELECT [Name] AS Game,
	CASE 
		WHEN DATEPART(HOUR, Start) BETWEEN 0 AND 11 THEN 'Morning'
		WHEN DATEPART(HOUR, Start) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
		END AS [Part of the Day],
	CASE 
		WHEN Duration <= 3 THEN 'Extra Short'
		WHEN Duration BETWEEN 4 AND 6 THEN 'Short'
		WHEN Duration > 6 THEN 'Long'
		ELSE 'Extra Long'
		END AS Duration
FROM Games
ORDER BY Game, Duration, [Part of the Day] ASC  

-- Part IV – Date Functions Queries
USE Orders
-- 18. Orders Table

SELECT ProductName , OrderDate, DATEADD(DAY, 3, OrderDate) AS [Pay Due], DATEADD(MONTH, 1, OrderDate) AS [Deliver Due]
FROM Orders

-- 19. People Table
USE Test

CREATE TABLE People (
	Id INT IDENTITY, 
	[Name] VARCHAR(50), 
	Birthdate DATETIME 
)

INSERT INTO People([Name], Birthdate)
VALUES 
	('Victor', '2000-12-07 00:00:00.000');
	('Steven', '1992-09-10 00:00:00.000');
	('Stephen', '1910-09-19 00:00:00.000');
	('John', '2010-01-06 00:00:00.000')
 




