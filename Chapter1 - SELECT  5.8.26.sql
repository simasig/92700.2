---Chapter 1 - SELECT
USE Northwind

SELECT *
FROM Categories


SELECT *
FROM Products


SELECT *
FROM dbo.Products

SELECT * 
FROM Employees



SELECT LastName 
FROM Employees


SELECT LastName , HireDate , ReportsTo, EmployeeID , HomePhone,Country
FROM Employees


SELECT EmployeeID ,LastName , HireDate , ReportsTo,  HomePhone,Country
FROM Employees

SELECT productid , ProductName ,UnitPrice
from Products


SELECT *
FROM Products


SELect prODUCTID , PRODUctName ,             UnitPrice from Products



SELECT productid 
	,ProductName 
	,UnitPrice
	--,UnitsInStock
	--,UnitsOnOrder
	--,CategoryID
FROM Products


--- + - * /

SELECT productid 
	,ProductName 
	,UnitPrice
	,(UnitPrice+10)*2
FROM Products

--Disallowed implicit conversion from data type datetime to data type int, table 'Employees', column 'HireDate'. Use the CONVERT function to run this query.

SELECT EmployeeID 
	,LastName 
	,HireDate 
	,HireDate *2
FROM Employees


SELECT EmployeeID 
	,LastName 
	,HireDate 
	,HireDate +2
	,HireDate -2
FROM Employees

--- Concatenate  +

SELECT EmployeeID 
	,LastName 
	,FirstName
	,LastName + FirstName
FROM Employees


SELECT EmployeeID 
	,LastName 
	,FirstName
	,LastName +' '+ FirstName
FROM Employees



SELECT EmployeeID 
	,LastName 
	,FirstName
	,LastName +' - '+ FirstName
FROM Employees


SELECT EmployeeID 
	,LastName 
	,FirstName
	,LastName +' and the first name is:) '+ FirstName
FROM Employees


---ALIAS


SELECT EmployeeID  ID
	,LastName AS LN
	,FirstName
	,LastName +' '+ FirstName AS FullName
FROM Employees


SELECT EmployeeID  ID
	,LastName AS LN
	,FirstName
	,LastName +' '+ FirstName AS Full_Name
FROM Employees


SELECT EmployeeID  ID
	,LastName AS LN
	,FirstName AS "SELECT"
	,LastName +' '+ FirstName AS "Full Name"
FROM Employees


---DISTINCT

SELECT EmployeeID  
	,LastName 
	,Country
	,City
FROM Employees


SELECT Country
--	,City
FROM Employees


SELECT DISTINCT Country
--	,City
FROM Employees


SELECT DISTINCT Country ,City
FROM Employees


SELECT DISTINCT Country ,City,EmployeeID
FROM Employees