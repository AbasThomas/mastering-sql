Create Database store
CREATE TABLE Customers (
  CustomerID    INT            PRIMARY KEY,
  FirstName     NVARCHAR(50)   NOT NULL,
  LastName      NVARCHAR(50)   NOT NULL,
  Email         NVARCHAR(100)  NOT NULL,
  SignupDate    DATE           NOT NULL
);


CREATE TABLE Products (
  ProductID     INT            PRIMARY KEY,
  ProductName   NVARCHAR(100)  NOT NULL,
  Category      NVARCHAR(50)   NOT NULL,
  UnitPrice     DECIMAL(10,2)  NOT NULL
);


CREATE TABLE Orders (
  OrderID       INT            PRIMARY KEY,
  CustomerID    INT            NOT NULL REFERENCES Customers(CustomerID),
  OrderDate     DATE           NOT NULL
);

CREATE TABLE OrderItems (
  OrderItemID   INT            PRIMARY KEY,
  OrderID       INT            NOT NULL REFERENCES Orders(OrderID),
  ProductID     INT            NOT NULL REFERENCES Products(ProductID),
  Quantity      INT            NOT NULL
);
INSERT INTO Customers (CustomerID, FirstName, LastName, Email,       SignupDate) VALUES
 ( 1, 'Alice',    'Adams',    'alice.adams@example.com',    '2024-01-05'),
 ( 2, 'Bob',      'Brown',    'bob.brown@example.com',      '2024-01-12'),
 ( 3, 'Carol',    'Clark',    'carol.clark@example.com',    '2024-01-20'),
 ( 4, 'David',    'Davis',    'david.davis@example.com',    '2024-02-02'),
 ( 5, 'Eve',      'Evans',    'eve.evans@example.com',      '2024-02-15'),
 ( 6, 'Frank',    'Foster',   'frank.foster@example.com',   '2024-03-01'),
 ( 7, 'Grace',    'Green',    'grace.green@example.com',    '2024-03-18'),
 ( 8, 'Henry',    'Hill',     'henry.hill@example.com',     '2024-04-04'),
 ( 9, 'Ivy',      'Ingram',   'ivy.ingram@example.com',     '2024-04-20'),
 (10, 'Jack',     'Johnson',  'jack.johnson@example.com',   '2024-05-05'),
 (11, 'Kelly',    'King',     'kelly.king@example.com',     '2024-05-22'),
 (12, 'Leo',      'Lewis',    'leo.lewis@example.com',      '2024-06-10'),
 (13, 'Mia',      'Martinez', 'mia.martinez@example.com',   '2024-06-28'),
 (14, 'Noah',     'Nelson',   'noah.nelson@example.com',    '2024-07-15'),
 (15, 'Olga',     'Owens',    'olga.owens@example.com',     '2024-08-01'),
 (16, 'Pete',     'Parker',   'pete.parker@example.com',    '2024-08-19'),
 (17, 'Quinn',    'Quincy',   'quinn.quincy@example.com',   '2024-09-04'),
 (18, 'Rita',     'Robinson', 'rita.robinson@example.com',  '2024-09-20'),
 (19, 'Sam',      'Scott',    'sam.scott@example.com',      '2024-10-06'),
 (20, 'Tina',     'Turner',   'tina.turner@example.com',    '2024-10-22');

INSERT INTO Products (ProductID, ProductName,Category, UnitPrice) VALUES
 ( 1, 'Gaming Laptop',            'Electronics',     1200.00),
 ( 2, 'Wireless Mouse',           'Electronics',       25.00),
 ( 3, 'Office Chair',             'Furniture',        150.00),
 ( 4, 'Desk Lamp',                'Furniture',         45.00),
 ( 5, 'Water Bottle',             'Accessories',       20.00),
 ( 6, 'USB-C Cable',              'Accessories',       10.00),
 ( 7, 'Noise-Cancel Headphones',  'Electronics',      200.00),
 ( 8, 'Standing Desk',            'Furniture',        350.00),
 ( 9, '27\" Monitor',             'Electronics',      300.00),
 (10, 'Keyboard',                 'Electronics',       50.00),
 (11, 'Backpack',                 'Accessories',       80.00),
 (12, 'Webcam',                   'Electronics',       60.00),
 (13, 'Notebook (Pack of 5)',     'Office Supplies',    5.00),
 (14, 'Pen Set (10 pens)',        'Office Supplies',   12.00),
 (15, 'Coffee Maker',             'Appliances',        85.00),
 (16, 'Blender',                  'Appliances',        70.00),
 (17, 'Smartphone',               'Electronics',      800.00),
 (18, 'Tablet',                   'Electronics',      400.00),
 (19, 'HDMI Cable',               'Accessories',       15.00),
 (20, 'Microphone',               'Electronics',      120.00);

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
 (101,  1, '2025-01-10'),
 (102,  2, '2025-01-11'),
 (103,  3, '2025-01-12'),
 (104,  4, '2025-01-13'),
 (105,  5, '2025-01-14'),
 (106,  6, '2025-01-15'),
 (107,  7, '2025-01-16'),
 (108,  8, '2025-01-17'),
 (109,  9, '2025-01-18'),
 (110, 10, '2025-01-19'),
 (111, 11, '2025-01-20'),
 (112, 12, '2025-01-21'),
 (113, 13, '2025-01-22'),
 (114, 14, '2025-01-23'),
 (115, 15, '2025-01-24'),
 (116, 16, '2025-01-25'),
 (117, 17, '2025-01-26'),
 (118, 18, '2025-01-27'),
 (119, 19, '2025-01-28'),
 (120, 20, '2025-01-29');

INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity) VALUES
 (1001, 101,  1, 1),
 (1002, 102,  2, 2),
 (1003, 103,  3, 1),
 (1004, 104,  4, 3),
 (1005, 105,  5, 2),
 (1006, 106,  6, 1),
 (1007, 107,  7, 2),
 (1008, 108,  8, 1),
 (1009, 109,  9, 2),
 (1010, 110, 10, 1),
 (1011, 111, 11, 3),
 (1012, 112, 12, 1),
 (1013, 113, 13, 5),
 (1014, 114, 14, 2),
 (1015, 115, 15, 1),
 (1016, 116, 16, 4),
 (1017, 117, 17, 1),
 (1018, 118, 18, 2),
 (1019, 119, 19, 3),
 (1020, 120, 20, 1);
 
 CREATE VIEW viewOrderName AS
SELECT o.orderId, c.FirstName + '' + c.LastName as customerName,
p.productName, oi.quantity, (oi.quantity * p.Unitprice) as LineTotal

From Orders o
join Customers c  ON  o.customerID = C.CustomerID
join orderItems as oi ON o.orderID = oi.OrderID
join products p ON oi.productID = p.productID


select * from viewOrderName
where Quantity = 1

--display customers that placed an order

CREATE VIEW viewCustomerOrder AS
SELECT Distinct 
C.customerID, c.FirstName + ' ' + c.LastName as customerName
from Orders o
Join Customers c on o.CustomerID = c.CustomerID

select * from viewCustomerOrder

-- view that summarizes total revenue per product then list the top 5 best selling product by revenue

CREATE VIEW viewTotalRevenue AS 
SELECT p.productId, p.productName, oi.quantity as TotalQuantity, (oi.quantity * p.Unitprice) as	TotalRevenue

From Orders o
Join orderItems as oi ON o.orderID = oi.OrderID
join products p ON oi.productID = p.productID
select * from viewTotalRevenue
Select Top 5*  from viewTotalRevenue

order by TotalRevenue DESC

--showing each customer total spend spend

CREATE VIEW viewCustomerSpend AS
CREATE VIEW viewCustomerSpend AS
SELECT
    C.customerID,
    C.FirstName + ' ' + C.LastName AS customerName,
    SUM(oi.quantity * p.UnitPrice) AS TotalSpend
FROM Orders o
JOIN Customers C ON o.customerID = C.customerID
JOIN OrderItems oi ON o.orderID = oi.orderID
JOIN Products p ON oi.productID = p.productID
GROUP BY C.customerID, C.FirstName, C.LastName
HAVING SUM(oi.quantity * p.UnitPrice) > 500;



 --create vidwlisting ech category total sales ( category, totalQuantity, TotalRevenue).find the categories woth revenue above N1000
 -- view that shows customers first order date then list order date then list sutomers whoe have never placed an order

 CREATE VIEW CatgegTotal AS
 SELECT  p.Category, SUM(oi.quantity) AS TotalQuantity,SUM(oi.quantity * p.UnitPrice) AS TotalRevenue
 FROM Orders o
 JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
 GROUP BY p.Category;

 select * from CatgegTotal