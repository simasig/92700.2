--Chapter 7 -- Subqueries


SELECT  AVG(unitprice)
FROM products



SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice >28


--An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a HAVING clause or a select list, and the column being aggregated is an outer reference.
SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice >AVG(unitprice)

---Single Row Subqueries
--- = , > , < ,>= ,<= ,<>  -- simple operator
--Subquery return only  1 value

SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice >(SELECT  AVG(unitprice)
					FROM products)


SELECT unitprice
FROM products
WHERE ProductID = 3


SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice <(SELECT unitprice
					FROM products
					WHERE ProductID = 3)


--The ORDER BY clause is invalid in views, inline functions, derived tables, subqueries, and common table expressions, unless TOP, OFFSET or FOR XML is also specified.
SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice <=(SELECT unitprice
					FROM products
					WHERE ProductID = 3
					ORDER BY unitprice)


SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice <=(SELECT top 1 unitprice
					FROM products
					WHERE ProductID = 3
					ORDER BY unitprice)



SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice <=(SELECT unitprice
					FROM products
					WHERE ProductID = 3)
ORDER BY unitprice




SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice <=(SELECT unitprice
					FROM products
					WHERE ProductID = 0)

--Only one expression can be specified in the select list when the subquery is not introduced with EXISTS.
SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice <=(SELECT unitprice,ProductName
					FROM products
					WHERE ProductID = 3)



SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice <=(SELECT unitprice
					FROM products
					WHERE ProductID = 3)
AND p.ProductName LIKE '%A%'



--Cannot convert a char value to money. The char value has incorrect syntax.

SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice <=(SELECT ProductName
					FROM products
					WHERE ProductID = 3)

--Subquery returned more than 1 value.
SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice <=(SELECT UnitPrice
					FROM products
					WHERE p.ProductID = 3)



SELECT p1.ProductID , p1.ProductName ,p1.CategoryID ,p1.UnitPrice
FROM  Products p1
WHERE p1.UnitPrice <=(SELECT p2.UnitPrice
					FROM products p2
					WHERE p2.ProductID = 3)


SELECT *
FROM employees
WHERE HireDate <= (SELECT HireDate
				  FROM employees
				  WHERE ReportsTo IS NULL)

SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.CategoryID =8


SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.CategoryID = (SELECT CategoryID
						FROM Categories
						WHERE CategoryName ='seafood')
AND p.UnitPrice >(SELECT  AVG(unitprice)
					FROM products)




--Subquery returned more than 1 value
SELECT *
FROM employees e
WHERE e.HireDate < (SELECT HireDate
				  FROM employees
				  WHERE e.ReportsTo IS NULL)



SELECT *
FROM employees e
WHERE e.HireDate < (SELECT e1.HireDate
				  FROM employees e1
				  WHERE e1.ReportsTo IS NULL)




SELECT unitprice
FROM products
WHERE ProductID = 3



SELECT unitprice
FROM products
WHERE ProductID = 3,1



---Multi[le Row Subqueries
--Subquery can return more than   1 value
-- Complex operator : IN , NOT IN , ANY ,ALL , EXISTS , NOT EXISTS



----- IN   
SELECT unitprice
FROM products
WHERE ProductID IN ( 3,1)



SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice <=(SELECT unitprice
					FROM products
					WHERE ProductID = 3)
ORDER BY unitprice


--Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.

SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice =(SELECT unitprice
					FROM products
					WHERE ProductID IN ( 3,1))

---IN ( = OR)
SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice IN (SELECT unitprice
					FROM products
					WHERE ProductID IN ( 3,1,20,7))


SELECT p.ProductID , p.ProductName ,p.CategoryID ,p.UnitPrice
FROM  Products p
WHERE p.UnitPrice NOT  IN (SELECT unitprice
							FROM products
							WHERE ProductID IN ( 3,1,20,7))


--Subquery returned more than 1 value
SELECT *
FROM Products p
WHERE P.UnitPrice = (SELECT UnitPrice
					FROM Products
					WHERE categoryid =5)


SELECT *
FROM Products p
WHERE P.UnitPrice IN (SELECT P1.UnitPrice
					FROM Products P1
					WHERE P1.categoryid =5)


SELECT *
FROM employees


SELECT e1.EmployeeID ,e1.LastName,e2.EmployeeID ,e2.LastName
FROM employees e1 JOIN employees e2
ON e1.ReportsTo = e2.EmployeeID

SELECT e1.EmployeeID ,e1.LastName,e2.EmployeeID ,e2.LastName
FROM employees e1  LEFT JOIN employees e2
ON e1.ReportsTo = e2.EmployeeID


SELECT DISTINCT  E2.EmployeeID ,e2.LastName
FROM employees e1 JOIN employees e2
ON e1.ReportsTo = e2.EmployeeID

SELECT *
FROM employees 
WHERE employeeid IN (SELECT ReportsTo
					FROM Employees
					WHERE ReportsTo IS NOT NULL
					)


SELECT *
FROM employees 
WHERE employeeid NOT IN (SELECT ReportsTo
					FROM Employees
					WHERE ReportsTo IS NOT NULL)


SELECT P1.UnitPrice
FROM Products P1
WHERE P1.categoryid =5


SELECT *
FROM Products p
WHERE P.UnitPrice IN (SELECT P1.UnitPrice
					FROM Products P1
					WHERE P1.categoryid =5)
--->ALL (> MAX)  , < ALL  (< MIN)

--Subquery returned more than 1 value
SELECT *
FROM Products p
WHERE P.UnitPrice >(SELECT P1.UnitPrice
					FROM Products P1
					WHERE P1.categoryid =5)


SELECT *
FROM Products p
WHERE P.UnitPrice >ALL(SELECT P1.UnitPrice
					FROM Products P1
					WHERE P1.categoryid =5)
SELECT *
FROM Products p
WHERE P.UnitPrice >(SELECT MAX(P1.UnitPrice)
					FROM Products P1
					WHERE P1.categoryid =5)

SELECT *
FROM Products p
WHERE P.UnitPrice <ALL(SELECT P1.UnitPrice
					FROM Products P1
					WHERE P1.categoryid =5)


SELECT *
FROM Products p
WHERE P.UnitPrice <(SELECT MIN(P1.UnitPrice)
					FROM Products P1
					WHERE P1.categoryid =5)



--->ANY  , < ANY  

SELECT P1.UnitPrice
FROM Products P1
WHERE P1.categoryid =5


SELECT *
FROM Products p
WHERE P.UnitPrice >ANY(SELECT P1.UnitPrice
					FROM Products P1
					WHERE P1.categoryid =5)
SELECT *
FROM Products p
WHERE P.UnitPrice >(SELECT MIN(P1.UnitPrice)
					FROM Products P1
					WHERE P1.categoryid =5)

SELECT *
FROM Products p
WHERE P.UnitPrice <ANY(SELECT P1.UnitPrice
					FROM Products P1
					WHERE P1.categoryid =5)


SELECT *
FROM Products p
WHERE P.UnitPrice <(SELECT MAX(P1.UnitPrice)
					FROM Products P1
					WHERE P1.categoryid =5)


