create database test
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATETIME
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate)
VALUES (1, 'John', 'Doe', 101, 75000.00, '2022-01-01');
SELECT FirstName, LastName FROM Employees;
SELECT * FROM Employees WHERE Salary > 60000;

SELECT * FROM Employees ORDER BY Salary DESC;

SELECT e.FirstName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

SELECT e.FirstName, d.DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

SELECT * FROM Employees
WHERE Salary > 80000 AND DepartmentID = 11;

SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID;

SELECT * FROM Employees
WHERE Salary > (
    --SELECT AVG(Salary) FROM Employees
	--HAVING AVG(Salary) > 70000

);

SELECT FirstName FROM Employees
WHERE DepartmentID IN (
    SELECT DepartmentID FROM Departments WHERE Location = 'Lagos'
);

SELECT FirstName, Salary,
  DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS DeptRank
FROM Employees;

SELECT FirstName, Salary,
  ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS DeptRank
FROM Employees;

WITH HighEarners AS (
    SELECT * FROM Employees WHERE Salary > 80000
)
SELECT * FROM HighEarners WHERE DepartmentID = 5;

