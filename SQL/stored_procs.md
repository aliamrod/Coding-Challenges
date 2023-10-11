**STORED PROCEDURES FOR SQL SERVER**

***What is a Stored Procedure?***

A stored procedure is a prepared SQL query that you can save, so the code can be reused. So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it. You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed. 

A. Stored Procedure Syntax



B. Stored Procedure with One Parameter


C. Stored Procedure with Multiple Parameters

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
