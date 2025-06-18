create database commerce
use commerce
CREATE TABLE Employees (
  EmployeeID   INT           IDENTITY(1,1) PRIMARY KEY,
  FirstName    NVARCHAR(50)  NOT NULL,
  LastName     NVARCHAR(50)  NOT NULL,
  Department   NVARCHAR(50)  NOT NULL,
  Salary       DECIMAL(10,2) NOT NULL,
  HireDate     DATE          NOT NULL
);


INSERT INTO Employees (FirstName, LastName, Department, Salary, HireDate) VALUES
('Alice',  'Anderson', 'Sales',       55000, '2018-02-15'),
('Bob',    'Brown',    'Engineering', 72000, '2019-03-10'),
('Carol',  'Clark',    'HR',          60000, '2020-07-22'),
('David',  'Davis',    'Marketing',   58000, '2017-11-05'),
('Eve',    'Evans',    'Finance',     65000, '2016-05-04'),
('Frank',  'Foster',   'IT',          70000, '2021-01-12'),
('Grace',  'Green',    'Sales',       52000, '2018-08-30'),
('Hank',   'Hill',     'Engineering', 73000, '2019-12-15'),
('Ivy',    'Ingram',   'HR',          61000, '2020-02-10'),
('Jack',   'Johnson',  'Marketing',   59000, '2017-06-25'),
('Karen',  'King',     'Finance',     68000, '2016-09-17'),
('Leo',    'Lewis',    'IT',          71000, '2021-03-05'),
('Mia',    'Martinez', 'Sales',       53000, '2018-10-10'),
('Ned',    'Nelson',   'Engineering', 74000, '2022-04-01'),
('Olga',   'Owens',    'HR',          62000, '2019-05-22'),
('Pete',   'Parker',   'Marketing',   60000, '2017-08-14'),
('Quinn',  'Quincy',   'Finance',     69000, '2016-11-30'),
('Rita',   'Robinson', 'IT',          72000, '2021-06-18'),
('Sam',    'Scott',    'Sales',       54000, '2019-01-09'),
('Tina',   'Turner',   'Engineering', 75000, '2022-07-27');

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    Salesperson VARCHAR(50),
    Region VARCHAR(50),
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO Sales (SaleID, Salesperson, Region, SaleAmount, SaleDate) VALUES
(1, 'Alice', 'North', 500.00, '2024-01-01'),
(2, 'Bob', 'North', 300.00, '2024-01-01'),
(3, 'Alice', 'North', 700.00, '2024-01-02'),
(4, 'Bob', 'North', 100.00, '2024-01-02'),
(5, 'Charlie', 'South', 900.00, '2024-01-01'),
(6, 'Charlie', 'South', 850.00, '2024-01-03'),
(7, 'David', 'East', 450.00, '2024-01-01'),
(8, 'David', 'East', 650.00, '2024-01-02'),
(9, 'Alice', 'North', 200.00, '2024-01-03'),
(10, 'Bob', 'North', 400.00, '2024-01-03'),
(11, 'Charlie', 'South', 750.00, '2024-01-02'),
(12, 'David', 'East', 300.00, '2024-01-03'),
(13, 'Eve', 'West', 650.00, '2024-01-01'),
(14, 'Eve', 'West', 700.00, '2024-01-02'),
(15, 'Eve', 'West', 720.00, '2024-01-03'),
(16, 'Alice', 'North', 400.00, '2024-01-04'),
(17, 'Bob', 'North', 380.00, '2024-01-04'),
(18, 'Charlie', 'South', 820.00, '2024-01-04'),
(19, 'David', 'East', 420.00, '2024-01-04'),
(20, 'Eve', 'West', 800.00, '2024-01-04');

select * from Employees

--st all the employees hired after january 1 2020

with  Recent_Hires as (
	select EmployeeID , Firstname , Lastname , HireDate from Employees
	where HireDate >'2020-01-01'
)
select * from Recent_Hires

--compute average slary per depeartment via cte

with Average_salary as (
	select department . Avg(salary) as average salary
)
--list employees earning above department average 

with EarningAboveAvg as(
	select department, avg(salary) as avgsalary 
	from Employees
	group by Department

) 
SELECT e.employeeID , e.firstname, EarningAboveAvg.lastname, EarningAboveAvg.salary 
from Employees e
join EarningAboveAvg a  on a.Department = a.Department
where  e.Salary . a.avg(salary)

--show department headcount and and cummulative hadcounts across departments

with departmmentCount as (
	select Department , 
)

--assign row too each sale by salaeDate

select*from Sales

select *, ROW_NUMBER() OVER(order BY SaleDate ) as rowNumber
from Sales

--rank salesby amount per region
select * from Sales

select*,  RANK() OVER (PARTITION BY region order by SaleAmount desc ) AS RankRegion
from Sales

--compare each salesperson's amount sale with prev sales amount

select*,  Lag(SaleAmount) OVER (PARTITION BY SalesPerson order by SaleDate desc ) AS PrevSales
from Sales

