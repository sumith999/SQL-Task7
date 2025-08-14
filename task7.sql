-- Use the Sales database
USE Sales;

--  View: CustomerOrdersView - shows each customer with their orders
CREATE VIEW CustomerOrdersView AS
SELECT 
    c.CustomerID, 
    c.CustomerName, 
    c.Country, 
    o.ProductName, 
    o.OrderDate, 
    o.Price, 
    o.Quantity
FROM Customers c
INNER JOIN Orders o 
    ON c.CustomerID = o.CustomerID;

-- Verify the view
SELECT * FROM CustomerOrdersView;


--  View: HighValueOrdersView - orders with Price > 20000
CREATE VIEW HighValueOrdersView AS
SELECT 
    o.OrderID,
    c.CustomerName,
    o.ProductName,
    o.Price,
    o.Quantity
FROM Orders o
JOIN Customers c 
    ON o.CustomerID = c.CustomerID
WHERE o.Price > 20000;

-- Verify the view
SELECT * FROM HighValueOrdersView;


--  View: CountryWiseCustomersView - count customers per country
CREATE VIEW CountryWiseCustomersView AS
SELECT 
    Country, 
    COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;

-- Verify the view
SELECT * FROM CountryWiseCustomersView;


-- 4. Updating an existing view (example using OR REPLACE)
CREATE OR REPLACE VIEW HighValueOrdersView AS
SELECT 
    o.OrderID,
    c.CustomerName,
    o.ProductName,
    o.Price,
    o.Quantity,
    (o.Price * o.Quantity) AS TotalAmount
FROM Orders o
JOIN Customers c 
    ON o.CustomerID = c.CustomerID
WHERE o.Price > 20000;

-- Verify updated view
SELECT * FROM HighValueOrdersView;
