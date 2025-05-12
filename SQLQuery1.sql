
CREATE Database company;
CREATE TABLE Departments (
  DepartmentID   INT            PRIMARY KEY,
  DepartmentName NVARCHAR(50)   NOT NULL
);
CREATE TABLE Employees (
  EmployeeID     INT            IDENTITY(1,1) PRIMARY KEY,
  FirstName      NVARCHAR(50)   NOT NULL,
  LastName       NVARCHAR(50)   NOT NULL,
  DepartmentID   INT            NOT NULL
    CONSTRAINT FK_Employees_Departments FOREIGN KEY REFERENCES Departments(DepartmentID),
  Salary         DECIMAL(10,2)  NOT NULL,
  HireDate       DATE           NOT NULL
);
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
  (1, 'Human Resources'),
  (2, 'Information Technology'),
  (3, 'Sales'),
  (4, 'Marketing');
  INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary,   HireDate) VALUES
  ('John',    'Smith',    1,  55000.00, '2019-01-15'),
  ('Jane',    'Doe',      2,  75000.00, '2018-03-22'),
  ('Alice',   'Johnson',  3,  65000.00, '2020-07-10'),
  ('Bob',     'Brown',    4,  60000.00, '2017-11-05'),
  ('Carol',   'Davis',    1,  58000.00, '2021-02-14'),
  ('Daniel',  'Martinez', 2,  80000.00, '2016-08-30'),
  ('Emily',   'Wilson',   3,  67000.00, '2019-05-23'),
  ('Frank',   'Clark',    4,  62000.00, '2020-12-01'),
  ('Grace',   'Lee',      1,  59000.00, '2018-09-17'),
  ('Henry',   'Walker',   2,  78000.00, '2019-10-10'),
  ('Irene',   'Hall',     3,  71000.00, '2021-03-29'),
  ('Jack',    'Allen',    4,  63000.00, '2017-06-12'),
  ('Kelly',   'Young',    1,  60000.00, '2018-02-08'),
  ('Larry',   'Hernandez',2,  82000.00, '2016-04-19'),
  ('Monica',  'King',     3,  69000.00, '2020-01-27'),
  ('Nathan',  'Scott',    4,  65000.00, '2019-07-07');

  use company
  
  select * from employees;
  select * from Departments;
  
  --list every firstname lastnamr amd their department
  select FirstName,DepartmentName 
  from employees INNER JOIN Departments
  On Employees.DepartmentID  = Departments.DepartmentID
 -- retrieve first name and Department name if any of the the employees earn more than $70k
select FirstName,DepartmentName 
  from employees INNER JOIN Departments
  On Employees.DepartmentID  = Departments.DepartmentID
  where salary > 70000
  
  --find employes hire after jan 1 2019 and include department name
  select FirstName,LastName,DepartmentName 
  from employees INNER JOIN Departments
  On Employees.DepartmentID  = Departments.DepartmentID
  where HireDate > '2019-01-01'
  -- list employees whose department name end with ing
   select FirstName,LastName,DepartmentName 
  from employees INNER JOIN Departments
  On Employees.DepartmentID  = Departments.DepartmentID
  where Departments.DepartmentName like '%ing'

  --display employees in sales with a salry below 68,000 showing manes and hireDate
   select FirstName,LastName,DepartmentName 
  from employees INNER JOIN Departments
  On Employees.DepartmentID  = Departments.DepartmentID
  where Salary > 68000

 -- return all employees and department odered by department name then lastNAme

  select LastName,DepartmentName 
  from employees 
  INNER JOIN Departments
  On Employees.DepartmentID  = Departments.DepartmentID
  Order by LastName , DepartmentName
	
	--show each departments avg salry
	
  select DepartmentName , AVG(employees.salary) as AverageSalary 
  From employees
  inner join Departments
  on Employees.DepartmentID = Departments.DepartmentID
  group by DepartmentName

  --list employees hire between 2018-01-01 and 2020-12-31 by department name
  select FirstName, LastName ,DepartmentDate, HireDate from employees inner join departments on employees.DepartId

  -- for each department show the the employee with the higest salary and and higherdate
     select FirstName,LastName,DepartmentName 
  from employees INNER JOIN Departments
  On Employees.DepartmentID  = Departments.DepartmentID
order by desc