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
