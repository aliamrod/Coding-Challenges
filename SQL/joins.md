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
INNER JOIN Customers on Orders.CustomerID = Customers.CustomerID
```

This consequently produces:

|OrderID | CustomerName | OrderDate | 
| :---         |     :---     |:--- |
| 10308 |Anna Trujillo Emparedados y helados      | 9/18/1996   | 
|  10365 | Antonio Moreno Taquería       | 11/27/1996    | 
| 10383 | Around the Horn | 12/16/1996|

**Different Types of SQL JOINs**

* (INNER) JOIN: Returns records that have matching values in both tables.
* LEFT (OUTER) JOIN: Returns all records from the left table, adn the matched records from the right table.
* RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table.
* FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table.

<img width="510" alt="Screen Shot 2023-10-06 at 12 21 53 PM" src="https://github.com/aliamrod/Coding-Challenges/assets/62684338/45090586-8d41-4134-9f95-fe270c1c72e0">



