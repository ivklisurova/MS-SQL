-- Subqueries and Joins

-- 01. Employee Address

USE SoftUni

SELECT TOP(5) e.EmployeeID, e.Jobtitle, e.AddressID, a.AddressText 
FROM Employees AS e
JOIN Addresses AS a ON e.AddressID = a.AddressID
ORDER BY e.AddressID ASC

-- 02. Addresses with Towns


SELECT TOP(50) e.FirstName, e.LastName, t.[Name], a.AddressText
FROM Employees AS e
JOIN Addresses AS a ON e.AddressID = a.AddressID
JOIN Towns AS t ON a.TownID = t.TownID
ORDER BY FirstName, LastName

-- 03. Sales Employees
SELECT * FROM Departments

SELECT e.EmployeeID, e.FirstName, e.LastName, d.[Name]
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE d.[Name] = 'Sales'

-- 04. Employee Departments

SELECT TOP(5) e.EmployeeID, e.FirstName, e.Salary, d.[Name]
FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 15000
ORDER BY e.DepartmentID

-- 05. Employees Without Projects

SELECT * FROM EmployeesProjects


SELECT TOP(3) e.EmployeeID, e.FirstName FROM Employees as e
LEFT JOIN EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID
WHERE ep.ProjectID IS NULL
ORDER BY EmployeeID ASC

-- 06. Employees Hired After

SELECT e.FirstName, e.LastName, e.HireDate, d.[Name] FROM Employees AS e
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
WHERE e.HireDate > '1.1.1999' AND d.[Name] IN ('Sales', 'Finance')
ORDER BY e.HireDate ASC


-- 07. Employees With Project

select * from Projects

SELECT TOP(5) e.EmployeeID,e.FirstName, p.[Name] FROM Employees AS e
LEFT JOIN EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID
JOIN Projects as p ON p.ProjectID = ep.ProjectID
WHERE (p.StartDate > '2002-08-13' AND p.EndDate IS NULL) AND ep.ProjectID IS NOT NULL
ORDER BY EmployeeID ASC

-- 08. Employee 24

SELECT e.EmployeeID, e.FirstName,
	CASE 
		WHEN DATEPART(YEAR, p.StartDate) >= 2005 
		THEN NULL
		ELSE p.[Name]
	END AS ProjectName
FROM Employees AS e
	LEFT JOIN EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID
	JOIN Projects as p ON p.ProjectID = ep.ProjectID
	WHERE ep.EmployeeID = '24' 

-- 09. Employee Manager

SELECT * FROM Employees

SELECT e.EmployeeID, e.FirstName, e.ManagerID, em.FirstName AS ManagerName 
FROM Employees AS e
JOIN Employees AS em ON e.ManagerID = em.EmployeeID
WHERE e.ManagerID IN ( '3', '7')
ORDER BY e.EmployeeID

--10. Employees Summary

SELECT * FROM Employees

SELECT TOP(50) e.EmployeeID, e.FirstName + ' ' + e.LastName AS EmployeeName, 
	   em.FirstName + + ' ' + em.LastName AS ManagerName, 
       d.[Name] AS DepartmentName
FROM Employees AS e
JOIN Employees AS em ON e.ManagerID = em.EmployeeID
JOIN Departments AS d ON e.DepartmentID = d.DepartmentID
ORDER BY EmployeeID

-- 11. Min Average Salary

SELECT * FROM Employees    

SELECT TOP(1) AVG(Salary) AS MinAverageSalary
FROM Employees   
GROUP BY DepartmentID 
ORDER BY AVG(Salary) ASC

-- 12. Highest Peaks in Bulgaria

USE [Geography] 

SELECT c.CountryCode, m.MountainRange, p.PeakName, p.Elevation FROM Countries AS c
JOIN  MountainsCountries as mc ON c.CountryCode = mc.CountryCode
JOIN Mountains AS m ON mc.MountainId = m.Id
JOIN Peaks AS p ON p.MountainId = m.Id
WHERE c.CountryCode = 'BG' AND p.Elevation >2835
ORDER BY p.Elevation DESC
 
-- 13. Count Mountain Ranges

SELECT  c.CountryCode, 
		COUNT(m.MountainRange) AS MountainRanges
	FROM Countries AS c 
	JOIN  MountainsCountries as mc ON c.CountryCode = mc.CountryCode
	JOIN Mountains AS m ON mc.MountainId = m.Id
WHERE c.CountryName IN ( 'United States', 'Russia', 'Bulgaria')
GROUP BY c.CountryCode

-- 14. Countries With or Without Rivers

SELECT TOP(5) c.CountryName, r.RiverName 
FROM Countries AS c
	JOIN Continents AS cn ON c.ContinentCode = cn.ContinentCode
	LEFT JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
	LEFT JOIN Rivers AS r ON cr.RiverId = r.Id
WHERE cn.ContinentName = 'Africa'
ORDER BY c.CountryName 

-- 16. Countries Without any Mountains

SELECT COUNT(*) AS [Count]
FROM Countries AS c
LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
WHERE mc.MountainId IS NULL

-- 17. Highest Peak and Longest River by Country

SELECT TOP(5) c.CountryName, 
       MAX(p.Elevation) AS HighestPeakElevation,
	   MAX(r.[Length]) AS LongestRiverLength
FROM Countries AS c

LEFT JOIN  MountainsCountries as mc ON c.CountryCode = mc.CountryCode
LEFT JOIN Mountains AS m ON mc.MountainId = m.Id
LEFT JOIN Peaks AS p ON p.MountainId = m.Id
LEFT JOIN CountriesRivers AS cr ON c.CountryCode = cr.CountryCode
LEFT JOIN Rivers AS r ON cr.RiverId = r.Id
GROUP BY c.CountryName
ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, c.CountryName ASC

-- 15. Continents and Currencies (not included in final score)

-- 18. Highest Peak Name and Elevation by Country (not included in final score)