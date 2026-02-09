CREATE TABLE Products (
ProductID INT PRIMARY KEY,
Name VARCHAR(100),
Category VARCHAR(50),
UnitPrice DECIMAL(10, 2)
);

CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Region VARCHAR(50),
PaymentMethod VARCHAR(50)
);

CREATE TABLE Sales (
SaleID INT PRIMARY KEY, 
CustomerID INT,
ProductID INT,
SaleDate DATE,
Quantity INT,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products VALUES
(1, 'Mouse', 'Tech', 1000.00),
(2, 'Earphones', 'Tech', 1000.00),
(3, 'Headphones', 'Tech', 1750.00),
(4, 'Microphone', 'Tech', 2000.00),
(5, 'Laptop', 'Tech', 1000.00),
(6, 'Phone', 'Tech', 1000.00),
(7, 'T-Shirt', 'Fashion', 600.00),
(8, 'Sweat pants', 'Fashion', 1100.00),
(9, 'Smart Watch', 'Tech', 1250.00),
(10, 'Shoes', 'Fashion', 1300.00),
(11, 'Scarf', 'Fashion', 1250.00),
(12, 'Ring', 'Fashion', 1200.00),
(13, 'Glasses', 'Fashion', 2800.00),
(14, 'USB', 'Tech', 300.00),
(15, 'Belt', 'Fashion', 450.00),
(16, 'Keyboard', 'Tech', 250.00),
(17, 'TV', 'Tech', 3000.00),
(18, 'Powerbank', 'Tech', 450.00),
(19, 'Bracelet', 'Fashion', 1750.00);

INSERT INTO Customers VALUES
(101, 'Ali', 'Hassan', 'North', 'DebitCard'),
(102, 'Moeez', 'Muddasar', 'South', 'Cash'),
(103, 'Nadia', 'Khan', 'East', 'Cash'),
(104, 'Mehar', 'Bano', 'East', 'CreditCard'),
(105, 'Sobia', 'Hussain', 'North', 'Cash'),
(106, 'Subhan', 'Chaudry', 'North','CreditCard'),
(107, 'Jack', 'Sole', 'South', 'Cash'),
(108, 'Henry', 'Dun', 'West', 'Cash'),
(109, 'Elizabeth', '', 'East', 'DebitCard'),
(110, 'Jane', 'Austin', 'North', 'DebitCard'),
(111, 'Toby', '', 'West', 'DebitCard'),
(112, 'Mohammed', 'Amir', 'West', 'Cash'),
(113, 'Lara', 'Benz', 'South', 'CreditCard'),
(114, 'Hania', 'Sohail', 'East', 'CreditCard'),
(115, 'Sehar', '', 'West', 'DebitCard'),
(116, 'Jenefer', 'Holland', 'North', 'Cash'),
(117, 'Nate', 'Crane', 'South', 'DebitCard'),
(118, 'Tom', 'Diaz', 'West', 'CreditCard'),
(119, 'Brian', 'Collins', 'East', 'Cash'),
(120, 'Conor', 'Boyle', 'North', 'Cash');

INSERT INTO Sales VALUES
(1001, 101, 1, '2025-01-10', 2),
(1002, 102, 2, '2025-01-11', 1),
(1003, 103, 3, '2025-02-12', 2),
(1004, 104, 4, '2025-03-13', 1),
(1005, 105, 5, '2025-03-14', 1),
(1006, 106, 6, '2025-04-15', 2),
(1007, 107, 7, '2025-05-16', 2),
(1008, 108, 8, '2025-05-17', 4),
(1009, 109, 9, '2025-06-18', 2),
(1010, 110, 10, '2025-06-19', 3),
(1011, 111, 11, '2025-07-20', 5),
(1012, 112, 12, '2025-07-21', 2),
(1013, 113, 13, '2025-08-22', 1),
(1014, 114, 1, '2025-08-22', 1),
(1015, 115, 14, '2025-09-24', 2),
(1016, 116, 15, '2025-10-25', 1),
(1017, 117,  16, '2025-10-26', 1),
(1018, 118, 17, '2025-10-27', 1),
(1019, 119, 18, '2025-11-28', 1),
(1020, 120, 19, '2025-11-29', 3);

SELECT * FROM Customers WHERE PaymentMethod LIKE '%Card%';
SELECT * FROM Sales WHERE SaleDate BETWEEN '2025-01-01' AND '2025-12-31';
SELECT * FROM Customers WHERE Region='North' OR Region='South';
SELECT s.*, p.Name FROM Sales s
JOIN Products p ON s.ProductID=p.ProductID WHERE p.Name LIKE '%a%';
SELECT * FROM Customers WHERE LastName LIKE '%A%';
SELECT * FROM Products WHERE UnitPrice> 2000 AND Category= 'Tech';
SELECT p.Name, SUM(s.Quantity) AS TotalQuantity FROM Sales s
Join Products p ON s.ProductID=p.ProductID GROUP BY p.ProductID, p.Name;
SELECT paymentMethod, COUNT(CustomerID) AS CustomerCount FROM Customers GROUP BY PaymentMethod;
SELECT c.Region, AVG(s.Quantity) AS AvgQuantity FROM Sales s
JOIN Customers c ON s.CustomerID=c.CustomerID GROUP BY c.Region;
SELECT p.Category, SUM(s.Quantity) AS TotalSold FROM Sales s
JOIN Products p ON s.ProductID=p.ProductID GROUP BY p.Category HAVING TotalSold>10;
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, p.Name AS ProductName
FROM Sales s JOIN Customers c ON s.CustomerID=c.CustomerID
JOIN Products p ON s.ProductID=p.ProductID;
SELECT p.Name, p.Category, s.Quantity, s.SaleDate FROM Sales s
JOIN Products p ON s.ProductID=p.ProductID
WHERE p.Category IN ('Tech', 'Fashion') AND s.Quantity BETWEEN 1 AND 50
ORDER BY p.Name ASC, s.SaleDate DESC;
SELECT c.Region, SUM(Quantity) AS TotalQuantity FROM Sales s
JOIN Customers c ON s.CustomerID=c.CustomerID WHERE c.Region IS NOT NULL
GROUP BY c.Region HAVING TotalQuantity >=5 ORDER BY TotalQuantity DESC;
SELECT s.*, c.Region FROM Sales s JOIN Customers c ON s.CustomerID=c.CustomerID
WHERE c.Region= 'North';
SELECT s.*, p.Name, p.Category FROM Sales s JOIN Products p ON s.ProductID= p.ProductID
WHERE p.Category = 'Tech';
SELECT DISTINCT c.*,s.Quantity FROM Customers c JOIN Sales s ON c.CustomerID=s.CustomerID
WHERE s.Quantity >3;
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS FullName, c.Region, p.Name, p.Category, s.Quantity, s.SaleDate
 FROM Sales s JOIN Customers c ON s.CustomerID=c.CustomerID JOIN Products p ON s.ProductID= p.ProductID
 WHERE c.Region IN ('North', 'East', 'West') AND p.Category NOT LIKE '%Test%' AND s.Quantity BETWEEN 1 AND 20
 ORDER BY c.Region ASC, s.SaleDate DESC;
 SELECT s.SaleDate, SUM(s.Quantity* p.UnitPrice) AS DailyRevenue FROM Sales s
 JOIN Products p ON s.ProductID=p.ProductID 
 GROUP BY s.SaleDate; 
SELECT s.SaleID, s.SaleDate, CONCAT(c.FirstName, ' ', c.LastName) AS FullName, c.Region, p.Name, P.Category, s.Quantity
FROM Sales s
 JOIN Customers c ON s.CustomerID JOIN Products p ON s.ProductID=p.ProductID
 WHERE c.Region= 'South' AND p.Category= 'Fashion' AND p.Name LIKE '%Glass%'
 ORDER BY s.SaleDate DESC;
 SELECT c.Region, p.ProductID, p.Name, SUM(s.Quantity) AS TotalUnitsSold FROM Sales s
 JOIN Customers c ON s.CustomerID=c.CustomerID JOIN Products p ON s.ProductID=p.ProductID
 GROUP BY c.Region, p.ProductID, p.Name ORDER BY c.Region ASC, SUM(s.Quantity) DESC;