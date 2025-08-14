# SQL Task 7- Creating Views

This task focuses on **Views** in SQL, using the `Sales` database created in **Task 5**.  
The goal is to create, modify, and query views to simplify complex queries and present data efficiently.

---

## Files Included
- `task7.sql` – SQL script containing:
  - Creation of multiple views (`CREATE VIEW`)
  - Updating existing views (`CREATE OR REPLACE VIEW`)
  - Sample `SELECT` queries to verify the views

---

## Views Created

1. ## CustomerOrdersView -
Displays customer details along with the orders they have placed.

**Query**:
```sql
CREATE VIEW CustomerOrdersView AS
SELECT c.CustomerID, c.CustomerName, c.Country,
       o.ProductName, o.OrderDate, o.Price, o.Quantity
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;
```

---

2. ## HighValueOrdersView -
Shows orders where the Price is greater than 20,000.

**Query**:
```sql
CREATE VIEW HighValueOrdersView AS
SELECT o.OrderID, c.CustomerName, o.ProductName, o.Price, o.Quantity
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.Price > 20000;
```

---

3. ## CountryWiseCustomersView - 
Groups customers by country and shows the total count per country.

**Query**:
```sql
CREATE VIEW CountryWiseCustomersView AS
SELECT Country, COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country;
```
---

4. ## Updated HighValueOrdersView with Total Amount
Adds a computed column showing the total order amount (Price × Quantity).

**Query**:
```sql
CREATE OR REPLACE VIEW HighValueOrdersView AS
SELECT o.OrderID, c.CustomerName, o.ProductName,
       o.Price, o.Quantity,
       (o.Price * o.Quantity) AS TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE o.Price > 20000;
```
---

 ## How to Run

1. Open **MySQL Workbench**.
2. Connect to your local MySQL server.
3. Make sure the Sales database from Task 5 is selected:
USE Sales;
4. Run the `task7.sql` file.
5. Use `SELECT * FROM view_name;` to see the results.

---

 ## Notes
- The database and tables must exist from **Task 5** before running this script.
- Views are virtual tables and do not store data physically; they represent saved queries.
- CREATE OR REPLACE VIEW is used to modify an existing view without deleting it.

---
 ## Author
 
**Sumith Poojary**

GitHub: [sumith999](https://github.com/sumith999)

