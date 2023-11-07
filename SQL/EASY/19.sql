/*
Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who 
have been employees for less than 10 months. Sort your result by ascending employee_id. 

+-------------+------------+
| Column      |   Type     |
+-------------+------------+
| employee_id | INTEGER    |
| name        | STRING     |
| months      | INTEGER    |
| salary      | INTEGER    |
+-------------+------------+
 
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
*/

SELECT name 
FROM Employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC; 


/*ANOTHER SUGGESTED ANSWER*/
SELECT name
  FROM Employee
  WHERE salary > 2000
  AND DATEDIFF(CURDATE(), join_date)< 10
  ORDER BY employee_id ASC; 
