**MODERATE LEVEL PROBLEMS**

Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: 

![image](https://github.com/user-attachments/assets/6d8d10fb-9d42-41ce-8865-82df9d92289b)

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code. 

Note:
- The tables may contain duplicate records.
- The company_code is string, so the sorting should *not* be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

  **Input Format**

  The following tables contain company data:
  - Company: The company_code is the code of the company and founder is the founder of the company.
 ![image](https://github.com/user-attachments/assets/8efac6ec-ce99-4f7e-8d29-fa812783b1c0)
    
 
  - Lead_Manager: The lead_manager_code is the code of the lead manager, and the company_code is the code of the working company.
 
![image](https://github.com/user-attachments/assets/09febafd-5410-4191-81c7-a664394d6b21)


  - Senior_Manager: The senior_manager_code is the code of the senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company.
 
![image](https://github.com/user-attachments/assets/990702f0-f379-4d24-b0c0-11c52373af39)


  - Manager: The manager_code is the code of the manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company.
 
![image](https://github.com/user-attachments/assets/a16003f2-79cf-4c7b-8ca4-58fa479bfb82)


  - Employee: The employee_code is the code of the employee, the manager_code is the code of its manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company.

![image](https://github.com/user-attachments/assets/aa48b164-cf0d-499b-98d3-03d54cf0fd2e)











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
