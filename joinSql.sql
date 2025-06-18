CREATE DATABASE shops

use shops


CREATE TABLE Customers (
  CustomerID   INT            PRIMARY KEY,
  FirstName    NVARCHAR(50)   NOT NULL,
  LastName     NVARCHAR(50)   NOT NULL,
  Email        NVARCHAR(100)  NOT NULL,
  SignupDate   DATE           NOT NULL
);

CREATE TABLE Products (
  ProductID    INT            PRIMARY KEY,
  ProductName  NVARCHAR(100)  NOT NULL,
  Category     NVARCHAR(50)   NOT NULL,
  UnitPrice    DECIMAL(10,2)  NOT NULL
);

CREATE TABLE Orders (
  OrderID      INT            PRIMARY KEY,
  CustomerID   INT            NOT NULL
    REFERENCES Customers(CustomerID),
  OrderDate    DATETIME2      NOT NULL,
  ShipDate     DATETIME2      NULL
);

CREATE TABLE OrderItems (
  OrderItemID  INT            PRIMARY KEY,
  OrderID      INT            NOT NULL
    REFERENCES Orders(OrderID),
  ProductID    INT            NOT NULL
    REFERENCES Products(ProductID),
  Quantity     INT            NOT NULL
);



INSERT INTO Customers VALUES
 (1,'Alice','Anderson','alice@example.com','2024-01-05'),
 (2,'Bob','Brown','bob@example.com','2024-01-12'),
 (3,'Carol','Clark','carol@example.com','2024-01-20'),
 (4,'David','Davis','david@example.com','2024-02-02'),
 (5,'Eve','Evans','eve@example.com','2024-02-15'),
 (6,'Frank','Foster','frank@example.com','2024-03-01'),
 (7,'Grace','Green','grace@example.com','2024-03-18'),
 (8,'Henry','Hill','henry@example.com','2024-04-04'),
 (9,'Ivy','Ingram','ivy@example.com','2024-04-20'),
 (10,'Jack','Johnson','jack@example.com','2024-05-05'),
 (11,'Kelly','King','kelly@example.com','2024-05-22'),
 (12,'Leo','Lewis','leo@example.com','2024-06-10'),
 (13,'Mia','Martinez','mia@example.com','2024-06-28'),
 (14,'Noah','Nelson','noah@example.com','2024-07-15'),
 (15,'Olga','Owens','olga@example.com','2024-08-01'),
 (16,'Pete','Parker','pete@example.com','2024-08-19'),
 (17,'Quinn','Quincy','quinn@example.com','2024-09-04'),
 (18,'Rita','Robinson','rita@example.com','2024-09-20'),
 (19,'Sam','Scott','sam@example.com','2024-10-06'),
 (20,'Tina','Turner','tina@example.com','2024-10-22');


INSERT INTO Products VALUES
 (1,'Gaming Laptop','Electronics',1200.00),
 (2,'Wireless Mouse','Electronics',25.00),
 (3,'Office Chair','Furniture',150.00),
 (4,'Desk Lamp','Furniture',45.00),
 (5,'Water Bottle','Accessories',20.00),
 (6,'USB-C Cable','Accessories',10.00),
 (7,'Noise-Cancel Headphones','Electronics',200.00),
 (8,'Standing Desk','Furniture',350.00),
 (9,'Monitor 27""','Electronics',300.00),
 (10,'Keyboard','Electronics',50.00),
 (11,'Backpack','Accessories',80.00),
 (12,'Webcam','Electronics',60.00),
 (13,'Notebook','Office Supplies',5.00),
 (14,'Pen Set','Office Supplies',12.00),
 (15,'Coffee Maker','Appliances',85.00),
 (16,'Blender','Appliances',70.00),
 (17,'Smartphone','Electronics',800.00),
 (18,'Tablet','Electronics',400.00),
 (19,'HDMI Cable','Accessories',15.00),
 (20,'Microphone','Electronics',120.00);


INSERT INTO Orders VALUES
 (101,1,'2025-01-10 09:00','2025-01-12 14:00'),
 (102,2,'2025-01-11 11:30','2025-01-13 16:30'),
 (103,3,'2025-01-12 15:45','2025-01-14 10:20'),
 (104,4,'2025-01-13 08:20','2025-01-15 12:50'),
 (105,5,'2025-01-14 13:10','2025-01-16 17:00'),
 (106,6,'2025-01-15 10:05','2025-01-17 11:30'),
 (107,7,'2025-01-16 14:25','2025-01-18 15:45'),
 (108,8,'2025-01-17 16:00','2025-01-19 09:10'),
 (109,9,'2025-01-18 09:40','2025-01-20 13:00'),
 (110,10,'2025-01-19 12:55','2025-01-21 18:20'),
 (111,11,'2025-01-20 08:15','2025-01-22 14:30'),
 (112,12,'2025-01-21 14:35','2025-01-23 16:05'),
 (113,13,'2025-01-22 10:50','2025-01-24 12:15'),
 (114,14,'2025-01-23 11:20','2025-01-25 15:40'),
 (115,15,'2025-01-24 15:30','2025-01-26 10:25'),
 (116,16,'2025-01-25 09:00','2025-01-27 13:10'),
 (117,17,'2025-01-26 13:45','2025-01-28 11:55'),
 (118,18,'2025-01-27 17:10','2025-01-29 14:45'),
 (119,19,'2025-01-28 08:30','2025-01-30 12:00'),
 (120,20,'2025-01-29 16:20','2025-01-31 17:30');



INSERT INTO OrderItems VALUES
 (1001,101,1, 1),
 (1002,101,2, 2),
 (1003,102,3, 1),
 (1004,102,5, 1),
 (1005,103,7, 1),
 (1006,103,9, 2),
 (1007,104,2, 1),
 (1008,104,6, 3),
 (1009,105,8, 1),
 (1010,105,10,2),
 (1011,106,11,1),
 (1012,106,12,2),
 (1013,107,13,5),
 (1014,107,14,2),
 (1015,108,15,1),
 (1016,108,16,1),
 (1017,109,17,1),
 (1018,109,18,2),
 (1019,110,19,3),
 (1020,110,20,1);

 select *from Customers;
 select *from Products;
 select *from Orders;
 select *from OrderItems;


 -- list every order line with order with customer name date quantity and line total//

 select 
 c.FirstName + ' ' + c.LastName as customer,

 O.OrderDate,
 P.ProductName,
 OI.Quantity,
 OI.Quantity * P.UnitPrice As LineTotal

 from Customers C
 join orders O  on C.CustomerId = O.CustomerID
 join OrderItems OI  on O.OrderID = O.OrderID
 join Products P  on OI.ProductId = P.ProductID


--find total spent per customer across all orders
select
 c.CustomerID,
 C.FirstName + ' ' + C.LastName AS Customer,
 Sum(OI.Quantity * P.UnitPrice) as TotalSpent
 from customers C
 join Orders O  on C.CustomerID = O.CustomerId
  join OrderItems OI  on O.OrderID = O.OrderId
  join Products P  on OI.ProductID = P.ProductID
	group by C.customerID, C.FirstName, C.LastName;



CREATE TABLE Orders (
  OrderID      INT            PRIMARY KEY,
  CustomerID   INT            NOT NULL
    REFERENCES Customers(CustomerID),
  OrderDate    DATETIME2      NOT NULL,
  ShipDate     DATETIME2      NULL
);

CREATE TABLE OrderItems (
  OrderItemID  INT            PRIMARY KEY,
  OrderID      INT            NOT NULL
    REFERENCES Orders(OrderID),
  ProductID    INT            NOT NULL
    REFERENCES Products(ProductID),
  Quantity     INT            NOT NULL
);



select
o.OrderID,
 C.FirstName + ' ' + C.LastName AS Customer,
o.ShipDate,
o.orderDate
from Customers C
join Orders O on C.CustomerID = O.CustomerID
where DATEDIFF(day, o.OrderDate, O.ShipDate) > 2
group by o.OrderID, C.FirstName, C.LastName, O.OrderDate,O.ShipDate


--list the top 5 best selling by quaitites sold
select top 5
P.ProductID,
P.ProductName,
sum(OI.Quantity) as TOtalQtySOld
from Customers C

join Orders O on c.customerID = O.customerID
join orderItems OI on O.OrderID = OI.OrderID
join Products P on OI.ProductID = P.ProductID
Group By p.productID, p.productName
Order By TotalQTySold Desc

--monthly revenue for jan 2025
select
P.ProductID,
P.ProductName,
--sum(OI.Quantity) as TOtalQtySOld
--sum(TotalQtySOld * UnitPrice) as totalRev
sum(OI.Quantity * P.UnitPrice) as totalRevenue
from Orders o
join
  OrderItems OI On OrderID= OI.OrderID
join
Products P On OI.ProductID = P.ProductID

where O.OrderDate between '2025-01-01' And '2025-02-01 '

--store procedure

--indexing
--cte
--window functions
--store procedure
--truncate
triggers


		