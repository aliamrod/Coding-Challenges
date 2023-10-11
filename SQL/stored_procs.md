**STORED PROCEDURES FOR SQL SERVER**

***What is a Stored Procedure?***

A stored procedure is a prepared SQL query that you can save, so the code can be reused. So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it. You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed. 

Stored procedures share many similarities with functions in procedural languages such as JavaScript, Python, etc. They are used to group and execute many tasks in one call. They can be called and executed repeatedly using loops. They can also be nested in one another and executed in parent-stored procedures.

By grouping one or more SQL statements, you can execute the statements in a single call, eliminating network bottlenecks and roundtrips. Also, by moving procedures from the client to the server you are able to free the client's resources and take advantage of the server's computing resources where they will execute even faster. Additionally, stored procedures are compiled once, cached, and stored in an executable form which makes them very quick and efficient whenever they are called, and as a result, lowers memory requirements and increases scalability. Stored procedures are also secure. You can allow users to manipulate data through a stored procedure with predefined privileges. For instance, you can allow users to access a stored procedure that updates a table but deny access to the table itself. 

Stored Procedure Architecture:

```SQL
DELIMITER//

CREATE PROCEDURE procedure_name ([procedure_parameter[,...]])
BEGIN
statements;
END //

DELIMITER;
```

When writing stored procedures:
1) Assign a name for the procedure (_procedure_name_).
2) Specify a comma-separated list of parametes for the procedure, if any.
3) Write your statements that will be executed by the procedure between the `BEGIN` and `END` block. 

A. Stored Procedure with One Parameter

The following SQL statement creates a stored procedure that selects Customers from a particular City from the "Customers" table:

```SQL
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;
```

Now, to call we would execute for instance:

```SQL
EXEC SelectAllCustomer @City = 'Paris'; 
```

B. Stored Procedure with Multiple Parameters

Setting up multiple parameters calls for listing each parameter and the data type separated by a comma. 
The following statement creates a stored procedure that selects Customers from a particular City with a particular PostalCode from the `Customers` table:

```SQL
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode=@PostalCode
GO;
```

Now, if we wanted to select Customers from Paris with the zip code 75002, we execute:

```SQL
EXEC SelectAllCustomers @City = 'Paris', @PostalCode = '75002'; 
```


C. Nested Stored Procedures 

Nested stored procesures help to break up large amounts of SQL statements into smaller reusable pieces. Moving reusable logic pieces into smaller composable pieces can make the procedures more readable and easy to debug. 

Whenever you write a statement that calls a procedure X in the body of another stored procedure Y, you're nesting X in Y. The syntax looks like this:

```SQL
CREATE PROCEDURE parent_procedure

BEGIN
SELECT column FROM table;
//other statements here
//nested stored procedure
CALL nested_procedure;
END
```

Let's demonstrate how nested stored procedures work. For instance, we'd be re-factoring the `film_in_stock` stored procedure 
