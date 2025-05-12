DROP TABLE IF EXISTS Workers;
CREATE TABLE Workers (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE,
    City NVARCHAR(50)
);
INSERT INTO Workers (FirstName, LastName, Department, Salary, HireDate, City) VALUES
('Alice','Anderson','Sales',55000.00,'2018-02-14','New York'),
('Bob','Brown','Engineering',72000.00,'2019-03-01','Los Angeles'),
('Charlie','Clark','HR',60000.00,'2020-07-23','Chicago'),
('Diana','Davis','Marketing',58000.00,'2017-11-19','Houston'),
('Ethan','Edwards','Finance',65000.00,'2016-05-04','Phoenix'),
('Fiona','Flores','IT',70000.00,'2021-01-12','Philadelphia'),
('George','Garcia','Sales',52000.00,'2018-08-30','San Antonio'),
('Hannah','Harris','Engineering',73000.00,'2019-12-15','San Diego'),
('Ian','Ivanov','HR',61000.00,'2020-02-10','Dallas'),
('Jenna','Johnson','Marketing',59000.00,'2017-06-25','San Jose'),
('Kevin','King','Finance',68000.00,'2016-09-17','New York'),
('Laura','Lopez','IT',71000.00,'2021-03-05','Los Angeles'),
('Michael','Martinez','Sales',53000.00,'2018-10-10','Chicago'),
('Nora','Nguyen','Engineering',74000.00,'2022-04-01','Houston'),
('Oliver','Owens','HR',62000.00,'2019-05-22','Phoenix'),
('Patricia','Perez','Marketing',60000.00,'2017-08-14','Philadelphia'),
('Quentin','Quinn','Finance',69000.00,'2016-11-30','San Antonio'),
('Rachel','Robinson','IT',72000.00,'2021-06-18','San Diego'),
('Samuel','Scott','Sales',54000.00,'2019-01-09','Dallas'),
('Tina','Thompson','Engineering',75000.00,'2022-07-27','San Jose'),
('Ulysses','Underwood','HR',63000.00,'2020-03-29','New York'),
('Victoria','Valdez','Marketing',61000.00,'2017-10-21','Los Angeles'),
('William','White','Finance',70000.00,'2016-12-11','Chicago'),
('Xander','Xu','IT',73000.00,'2021-09-02','Houston'),
('Yolanda','Young','Sales',55000.00,'2018-11-03','Phoenix'),
('Zach','Zimmerman','Engineering',76000.00,'2023-02-14','Philadelphia'),
('Amy','Adams','HR',64000.00,'2020-05-06','San Antonio'),
('Brandon','Baker','Marketing',62000.00,'2017-01-15','San Diego'),
('Caroline','Campbell','Finance',71000.00,'2016-03-08','Dallas'),
('David','Diaz','IT',74000.00,'2021-10-21','San Jose'),
('Elena','Evans','Sales',56000.00,'2019-02-25','New York'),
('Frank','Foster','Engineering',77000.00,'2023-05-30','Los Angeles'),
('Grace','Green','HR',65000.00,'2020-07-19','Chicago'),
('Henry','Hughes','Marketing',63000.00,'2017-12-07','Houston'),
('Isabella','Ingram','Finance',72000.00,'2016-06-14','Phoenix'),
('Jack','Jackson','IT',75000.00,'2021-11-11','Philadelphia'),
('Karen','Kelly','Sales',57000.00,'2019-03-19','San Antonio'),
('Leo','Lewis','Engineering',78000.00,'2023-08-22','San Diego'),
('Mia','Mitchell','HR',66000.00,'2020-09-30','Dallas'),
('Noah','Nelson','Marketing',64000.00,'2017-04-05','San Jose'),
('Olivia','Ortiz','Finance',73000.00,'2016-08-09','New York'),
('Peter','Parker','IT',76000.00,'2021-12-01','Los Angeles'),
('Quinn','Quinton','Sales',58000.00,'2019-05-27','Chicago'),
('Rebecca','Reed','Engineering',79000.00,'2023-11-16','Houston'),
('Steven','Smith','HR',67000.00,'2020-11-29','Phoenix'),
('Teresa','Turner','Marketing',65000.00,'2017-02-02','Philadelphia'),
('Victor','Vega','Finance',74000.00,'2016-10-18','San Antonio'),
('Wendy','Williams','IT',77000.00,'2021-08-08','San Diego'),
('Xavier','Xiong','Sales',59000.00,'2019-07-07','Dallas'),
('Zoe','Zimmerman','Engineering',80000.00,'2024-01-12','San Jose');

/*SELECT FirstName ,LastName ,Department
from Workers*/

--count the number on employees in each departments
SELECT Department, Count(*) as total_no_of_employees
from Workers
Group by Department

--Calculate average salary for each department
SELECT avg(Salary)
from Workers

--Min salary
Select min(Salary)
from workers


--Max salary
Select max(Salary)
from workers

--Average slart for each depart
SELECT Department ,AVG(Salary)
from Workers
Group by Department


--Find all employees hired after jan 1 2022
SELECT * from Workers
where HireDate > '2022-01-01'

--list the top 5 highest paid employees across the company

SELECT TOP 5 *
from Workers
order by salary Desc

--total payroll cost for egineering department
SELECT SUM(Salary) as total_payroll 
from Workers
where Department = 'Engineering'

-- display each city once along with the count of the employee in that sity
SELECT City, COUNT(*) as Employee_count
from Workers
group by Department

--filter by a
SELECT * FROM Workers
Where LastName LIKE '%A'

--select employee wwith the slary btw 60,000 and 70,00

Select * from Workers
where salary between 60000 and 70000

--department with the highest paid salary 
SELECT Top 1 Department, avg(salary)
from Workers 
group by Department
order by avg(salary) desc

-- get all employees earning above the company-wde average salary
SELECT * from Workers
where Salary > (select avg(salary)
from Workers)


SELECT DISTINCT Department
from Workers
Group by Department

--department with more than 8 employees
SELECT DISTINCT Department , COUNT(*) as no_of_emp
from Workers 
Group by Department

SELECT Department
from Workers
HAVING COUNT(*) > 8
Group by Department

SELECT DISTINCT City
from Workers
where City in (SELECT City from Workers
group by City having COUNT(*) >=5);
 --employes hired after the earliest hire date in the company
Select *
from Workers
Where HireDate > (Select MIN(HireDate)
from Workers);

select * from Workers
order by Salary desc
--list the third highest salry
Select * from 
Workers
where Salary =
(select MIN(salary) as thirdhighestsalary
from (select distinct salary from Workers) as  s
where Salary in 
(select distinct Salary 
from Workers order by salary desc
OFFSET 8 rows fetch next 3 rows only))

--delte all employee with salary below the company average	
Delete from Workers
where Salary <(select AVG (salary)from Workers)

 

 --find employees whose salry ranks in the top 10% ofall employees
 --count how many employees are in each department
SELECT Department, Count(*) as total_no_of_employees
from Workers
Group by Department

--how many employees where hired each year
Select Year(HireDate) as HireYear , COUNT(*) as NumHire
from workers
group by HireDate

--how many employees were hired each month of 2017
select MONTH(HireDate) as HireMonth , COUNT(*) as NumHired
from Workers
where YEAR(hireDate) = 2021
group by MONTH(HireDate)
order by HireMonth


-- group employees into 10k naira salary bands and count each bount
Select (Salary/10000)*10000 as salaryBand, COUNT(*) as numEmployee
from Workers 
group by (Salary/10000)*10000
order by salaryBand
--explain 


--show payroll subtotal by department and city plus grandtotal
SELECT SUM(Salary) as total_payroll 
from Workers
group by Department 


-- list the third highest sslary in the company
	/*diff btw rdbms and dbms
	what are the rules od dba 
	BCNF
	how to improve db performance*/ 
