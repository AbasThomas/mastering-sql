create database examprep2

-- Table: Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);

-- Table: Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
    Salary INT,
    HireDate DATE
);

-- Table: Projects
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName NVARCHAR(100),
    StartDate DATE,
    EndDate DATE
);

-- Table: EmployeeProjects (Many-to-Many)
CREATE TABLE EmployeeProjects (
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    ProjectID INT FOREIGN KEY REFERENCES Projects(ProjectID),
    AssignedDate DATE,
    PRIMARY KEY (EmployeeID, ProjectID)
);
-- Sample Departments
INSERT INTO Departments VALUES 
(1, 'HR'), (2, 'Finance'), (3, 'Engineering'), (4, 'Marketing');

-- Sample Employees
INSERT INTO Employees VALUES
(1, 'Alice', 'Smith', 2, 90000, '2020-01-01'),
(2, 'Bob', 'Brown', 3, 75000, '2022-06-01'),
(3, 'Carol', 'Jones', 3, 85000, '2023-02-15'),
(4, 'Dave', 'Wilson', 1, 60000, '2021-09-01'),
(5, 'Eve', 'Taylor', 2, 95000, '2019-12-10'),
(6, 'Frank', 'Miller', 4, 70000, '2024-03-01');

-- Sample Projects
INSERT INTO Projects VALUES
(101, 'Project Alpha', '2023-01-01', '2023-12-31'),
(102, 'Project Beta', '2024-02-01', '2024-11-30');

-- Sample EmployeeProjects
INSERT INTO EmployeeProjects VALUES
(1, 101, '2023-01-15'),
(2, 101, '2023-02-01'),
(3, 102, '2024-02-10'),
(5, 102, '2024-03-05');

--Show the top 2 highest-paid employees in each department

select FirstName , Salary  
	Rank() Over(Partition by DepartmentID order by salary desc ) as RankedEarners
from Employees

SELECT D.DepartmentName, COUNT(*) AS NumRecentHires
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE E.HireDate > '2021-01-01'
GROUP BY D.DepartmentName
HAVING COUNT(*) > 1;

SELECT E.EmployeeID, E.FirstName, E.LastName
FROM Employees E
LEFT JOIN EmployeeProjects EP ON E.EmployeeID = EP.EmployeeID
WHERE EP.ProjectID IS NULL;

SELECT E.EmployeeID, E.FirstName, E.LastName
FROM Employees E
LEFT JOIN EmployeeProjects EP ON E.EmployeeID = EP.EmployeeID
WHERE EP.ProjectID IS NULL;

SELECT 
    P.ProjectName,
    COUNT(E.EmployeeID) AS TotalEmployees,
    AVG(E.Salary) AS AvgSalary
FROM Projects P
JOIN EmployeeProjects EP ON P.ProjectID = EP.ProjectID
JOIN Employees E ON EP.EmployeeID = E.EmployeeID
GROUP BY
P.ProjectName;