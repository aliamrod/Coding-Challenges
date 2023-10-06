**SQL JOIN**

A `JOIN` clause is used to combine rows from two or more tables, based on a related column between them. For instance in this "Orders" table:

|OrderID | CustomerID | OrderDate | 
| :---         |     :---     |:--- |
| 10308 | 2    | 1996-09-18    | 
|  10309     | 37       | 1996-09-19      | 
| 10310 | 77 | 1996-09-20 |

Then, look at the "Customers" table: 

|CustomerID | CustomerName | ContactName | Country| 
| :---         |     :---     |:--- |:---|
| 1 | Alfreds Futterkiste    | Maria Anders | Germany|
|  2     | Anna Trujillo Emparedados y helados       | Ana Trujillo| Mexico| 
| 3 | Antonio Moreno Taqueria| Antonio Moreno | Mexico|

Notice that the "CustomerID" column in the "Orders" table refers to the "CustomerID" in the "Customers" table. The relationship between the two tables above is the "CustomerID" column. Then, we can create the following SQL statement (that contains an `INNER JOIN`), that selects records that have matching values in both tables:
```SQL
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers on Orders.CustomerID = Customers.CustomerID;
```

This consequently produces:

|OrderID | CustomerName | OrderDate | 
| :---         |     :---     |:--- |
| 10308 |Anna Trujillo Emparedados y helados      | 9/18/1996   | 
|  10365 | Antonio Moreno Taquería       | 11/27/1996    | 
| 10383 | Around the Horn | 12/16/1996|

**Different Types of SQL JOINs**

* (INNER) JOIN: Returns records that have matching values in both tables.
* LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table.
* RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table.
* FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table.

<img width="510" alt="Screen Shot 2023-10-06 at 12 21 53 PM" src="https://github.com/aliamrod/Coding-Challenges/assets/62684338/45090586-8d41-4134-9f95-fe270c1c72e0">



------------------------------------
Challenges:

**Using `Orders` and `Customers` table above:
1. RIGHT JOIN. Retrieve a list of all orders and their associated customer information (OrderID, OrderDate, TotalAmount, CustomerName). Include orders where the customer information is missing (i.e., there's no matching customer record). If the customer information is missing, display NULL values for CustomerName.

```sql
SELECT Orders.OrderID, Orders.OrderDate, Orders.TotalAmount, Customers.CustomerName
FROM Orders
RIGHT JOIN Customers ON Orders.CustomerID = Customers.CustomerID; 
```
2. FULL JOIN (OUTER). Retrieve a list of all customers and their order information (CustomerName, OrderID, OrderDate, TotalAmount), including customers who have not placed any orders and orders where the customer information is missing. If either the customer or order information is missing, display NULL values in the respective columns.

```sql
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.TotalAmount
FROM Customers
FULL JOIN Orders on Customers.CustomerID = Orders.CustomerID; 
```
3. LEFT JOIN (OUTER). Retrieve a list of all customers and their order information (CustomerName, OrderID, OrderDate, TotalAmount). Include customers who have not placed any orders. If a customer has not placed an order, display NULL values for OrderID, OrderDate, and TotalAmount.

```sql
SELECT Customers.CustomerName, Orders.OrderID, Orders.OrderDate, Orders.TotalAmount
FROM Orders
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID; 
```
4. Recursive CTE. Suppose you have a table named `Employees` with columns `EmployeeID`, `EmployeeName`, and `ManagerID`. Write an SQL query to find all employees who report directly or indirectly to a specific manager (identified by `ManagerID`). 
5. Pivot Table. Given a table named `Sales` with columns `SaleID`, `ProductID`, and `SaleAmount`, write an SQL queury to pivot the data and display the total sales amount for each product as columns. 
6. Running Total. You have a table named `Transactions` with columns `TransactionID`, `TransactionDate`, and `Amount`. Write an SQL query to calculate the running total of the `Amount` column over time, orderd by `TransactionDate`. 
7. Hierarchical Data. Imagine you have a table called `Categories` with columns `CategoryID`, `CategoryName`, and `ParentCategoryID`, where `ParentCategoryID` references the `CategoryID` of the parent category. Write a query to retrieve all categories and their subcategories, displaying the hierarchy. 
8. Window Functions. Given a table `Sales` with columns `SaleID`, `ProductID`, `SaleDate`, and `SaleAmount`, write an SQL query to find the top-selling product for each month along with the total sales amount for that product in that month.

```sql
WITH MonthlyRanking AS (
  SELECT
    ProductID,
    DATE_TRUNC('month', SaleDate) AS Month,
    SUM(SaleAmount) AS TotalSales,
    ROW_NUMBER() OVER (PARTITION BY DATE_TRUNC('month', SaleDate) ORDER BY SUM(SaleAmount) DESC) AS Rank
  FROM Sales
  GROUP BY ProductID, DATE_TRUNC('month', SaleDate)
)
SELECT ProductID, Month, TotalSales
FROM MonthlyRanking
WHERE Rank = 1; 

```
10. Geospatial Query. Suppose you have a table named `Locations` with columns `LocationID`, `Latitude`, and `Longitude`. Write an SQL query to find the nearest location to a given set of coordinates (latitude and longitude) using the Haversine formula.

```sql
SELECT
  LocationID,
  Latitude,
  Longitude
FROM Locations

ORDER BY
  ACOS(SIN(RADIANS(@TargetLatitude)) * SIN(RADIANS(Latitude)) +
      COS(RADIANS(@TargetLatitude)) * COS(RADIANS(Latitude)) *
      COS(RADIANS(@TargetLongitude - Longitude)) * 6371 -- Earth's radius in km
LIMIT 1; 
```

11. Analytic Functions. In a table called `Employees` with columns `EmployeeID`, `Salary`, and `DepartmentID`, write an SQL query to rank employees within each department based on their salary, using dense ranking.

```sql
SELECT
  EmployeeID,
  Salary,
  DepartmentID,
  DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS Salary_Rank
FROM Employees;
```

11. *

