create database examPrep
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    HireDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    AccountHolder VARCHAR(100),
    Balance DECIMAL(10,2)
);

CREATE TABLE DeleteLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    Message VARCHAR(255),
    DeletedAt DATETIME
);

-- Insert Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

-- Insert Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate) VALUES
(1, 'John', 'Doe', 1, 75000.00, '2020-01-01'),
(2, 'Alice', 'Smith', 2, 82000.00, '2021-04-15'),
(3, 'Bob', 'Johnson', 1, 56000.00, '2022-06-10'),
(4, 'Sarah', 'Lee', 3, 92000.00, '2020-09-05'),
(5, 'James', 'Brown', 2, 48000.00, '2019-11-11'),
(6, 'Emma', 'Davis', 1, 61000.00, '2023-01-20'),
(7, 'David', 'Clark', 3, 105000.00, '2021-02-28'),
(8, 'Olivia', 'Lewis', 2, 73000.00, '2022-12-10'),
(9, 'Noah', 'White', 3, 89000.00, '2020-03-03'),
(10, 'Mia', 'Hall', 1, 66000.00, '2023-05-06');

-- Insert Accounts
INSERT INTO Accounts (AccountID, AccountHolder, Balance) VALUES
(1, 'John Doe', 5000.00),
(2, 'Alice Smith', 3000.00);

-- Optional: Insert sample delete log
INSERT INTO DeleteLog (Message, DeletedAt)
VALUES ('An employee was deleted', GETDATE());

select * from Employees
SELECT * FROM Employees WHERE DepartmentID = 1;

--1?? Get the highest-paid employee in each department

select Top 1 FirstName + ' ' + LastName as Fullname, DepartmentID, salary from Employees
order by Salary Desc

ALTER TABLE Employees
ADD DepartmentName NVARCHAR(50);

SELECT 
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    D.DepartmentName,
    E.Salary,
    E.HireDate
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID;

SELECT * FROM Departments;

-- Find employees who earn more than the average salary of their department
SELECT 
    E.FirstName,
    E.LastName,
    D.DepartmentName,
    E.Salary
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID

Where Salary > (
 SELECT AVG(Salary)
    FROM Employees
);
SELECT 
    E.FirstName,
    E.LastName,
    D.DepartmentName,
    E.Salary
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE E.Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DepartmentID = E.DepartmentID
);

--3?? Find departments that have at least 3 employees hired after 2021
select top 3 DepartmentID ,HireDate from Employees 
	where HireDate > '2021-01-01'

	SELECT D.DepartmentName, COUNT(*) AS NumEmployees
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE HireDate > '2021-01-01'
GROUP BY D.DepartmentName
HAVING COUNT(*) >= 3;

--Show top 2 earners per department
	Select top 2 FirstName,  Salary,
	Rank() Over(Partition by DepartmentID order by salary desc ) as RankedEarners
	from Employees


	WITH Ranked AS (
  SELECT FirstName, Salary, DepartmentID,
         RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS RankedEarners
  FROM Employees
)
SELECT * FROM Ranked
WHERE RankedEarners <= 2;

	--List employees who were hired more recently than everyone in HR

SELECT FirstName, LastName, HireDate
FROM Employees
WHERE HireDate > (
    SELECT MAX(HireDate)
    FROM Employees
    WHERE DepartmentID = (
        SELECT DepartmentID FROM Departments WHERE DepartmentName = 'HR'
    )
);
		--Rank() Over(Partition by Hiredate order by HireDate desc ) as Hireearlier
	from Employees
	

	--6?? List all departments, including those with no employees
	select DepartmentID , Count(*) as totalemployees
	from employees

	SELECT D.DepartmentName, COUNT(E.EmployeeID) AS TotalEmployees
FROM Departments D
LEFT JOIN Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName;

	--7?? Find all employees whose salary is higher than any Finance employee
	Select FirstName, Salary from Employees
	where Salary = (
		Select MAX(Salary) from Employees
	)
	-- Show all employees who are not the highest earners in their department

		Select FirstName, Salary from Employees
	where Salary = (
		Select min(Salary) from Employees
	)

	--Create a view v_HighEarners with employees earning > 80k and hired after 2021
	Create View v_HighEarners as 
	select FirstName , Salary, HireDate from Employees
	Where Salary > 80000 and HireDate> '2021-01-01'

	select * from v_HighEarners
	--from employees