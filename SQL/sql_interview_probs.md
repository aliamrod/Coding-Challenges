**Difference between SQL and MySQL**

SQL = abstraction or a language; there is no implementation involved. Language used to interact with databases. MySQL = piece of software; database relational management tool. Implements those relational databases. 

**PRIMARY KEYS**

Primary key = Three main components: (1) It can't be duplicated, (2) Cannot be NULL/Blank, (3) Each table can only have one key. Therefore, it's a unique, non-nullible identifier for each record in a table (can be one column or multiple). 

**JOINS**
Way to 'join' two types of tables using logical commands; function allows us to use set of logic. There are four *main ones-- inner, outer, left and right (but in reality there are 7--> left, inner, right, full outer, cross, self, and natural). 


Example: 
List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.
![Screenshot 2025-01-10 at 3 20 12 PM](https://github.com/user-attachments/assets/b38c7fb2-0ea1-46aa-a28d-6477f86cb937)

*Essentially just a JOIN and WHERE statement. 

```sql
SELECT go.player

FROM goal go JOIN game ga ON go.matchid = ga.id
WHERE ga.stadium = 'National Stadium, Warsaw';

```

_INNER JOIN_ : records with matches in both tables. 

Pros: 
- efficient for combining datasaets with only relevant matches.
- eliminates mismatched or NULL rows.

Cons:
- excludes data without matches, which might lead to loss of critical information.
  

Problem 1. Find engineers earning above the average salary. 

```SQL
SELECT e.id, e.name, s.salary

FROM employees e INNER JOIN salaries s ON e.id = s.employee_id

WHERE s.salary > (SELECT AVG(salary) FROM salaries) AND e.department = 'Engineering';

```

Problem 2. How would you identify missing rows in an INNER JOIN result? 

Use LEFT JOIN and filter with WHERE right_table.column is NULL.

***

Problem 3. 

Problem 4. 

Problem 5. 

Problem 6. 

Problem 7. 

Problem 8. 

Problem 9. 


Problem 10. 

Problem 11. 

Problem 12. 

Problem 13. 

Problem 14. 

Problem 15. 

Problem 16. 

Problem 17. 

Problem 18. 
Problem 19. 
Problem 20. 



_OUTER JOIN_ --> records where there is a match in *either table.

Problem 3. 

Problem 4. 

Problem 5. 

Problem 6. 

Problem 7. 

Problem 8. 

Problem 9. 


Problem 10. 

Problem 11. 

Problem 12. 

Problem 13. 

Problem 14. 

Problem 15. 

Problem 16. 

Problem 17. 

Problem 18. 
Problem 19. 
Problem 20. 


_LEFT JOIN_ --> all records from the left table, and matches from the right table.

Problem 3. 

Problem 4. 

Problem 5. 

Problem 6. 

Problem 7. 

Problem 8. 

Problem 9. 


Problem 10. 

Problem 11. 

Problem 12. 

Problem 13. 

Problem 14. 

Problem 15. 

Problem 16. 

Problem 17. 

Problem 18. 
Problem 19. 
Problem 20. 


_RIGHT JOIN_

Problem 3. 

Problem 4. 

Problem 5. 

Problem 6. 

Problem 7. 

Problem 8. 

Problem 9. 


Problem 10. 

Problem 11. 

Problem 12. 

Problem 13. 

Problem 14. 

Problem 15. 

Problem 16. 

Problem 17. 

Problem 18. 
Problem 19. 
Problem 20. 




/////

Basic SELECT Queries. 

1. For each continent show the continent and number of countries with populations at at least 10 million.

![Screenshot 2025-01-10 at 3 32 32 PM](https://github.com/user-attachments/assets/3e1b129a-c393-4d88-96d2-9026a909f48f)

```sql
SELECT continent, sum(name) AS countries

FROM world

WHERE population >= 10000000
GROUP BY continent ; 

```

2. List the continents that have a total population of at least 100 million.
   ```sql
   SELECT continent
   FROM world

   HAVING sum(population) > 100000000

   GROUP BY continent; 
   
   ```

3. What are DDL and DML languages in SQL?
DDL = 'data definition language' and DML = 'data manipulation language'.

*DDL:
Purpose: Used to define and manage the structure of database objects.
Commands:
CREATE: Creates a new database, table, index, or other database objects.
ALTER: Modifies existing database structures like tables or columns.
DROP: Deletes database objects like tables, indexes, or views.
TRUNCATE: Removes all data from a table but keeps the structure.
RENAME: Renames a table, column, or index.

*DML:
Purpose: Used to manipulate and manage data within database tables.
Commands:
SELECT: Retrieves data from one or more tables.
INSERT: Adds new records to a table.
UPDATE: Modifies existing records in a table.
DELETE: Removes records from a table.


5. DELETE vs TRUNCATE. 
`DELETE` can be used to remove either few or all the records from a table. `TRUNCATE` will always remove all the records from the table. Truncate cannot have WHERE condition. Delete is a DML statement hence we will need to commit the transaction in order to save the changes to a database. Whereas truncate is a DDL statement hence no commit is required.
 
Speed: TRUNCATE >>> DELETE. 

DELETE can remove specific rows using a WHERE clause (TRUNCATE cannot). 
```sql DELETE FROM table_name WHERE column_name = 'value'; ```

TRUNCATE removes all rows from the table, without the ability to filer out with a WHERE clause. 
```sql TRUNCATE TABLE table_name;```

   
6. Retrieve only the name and salary columns from the employees table.
   ```sql
    select name, salary
   from employees;
      ```
7. List all the people who have worked with 'Art Garfunkel'.
![Screenshot 2025-01-10 at 4 25 48 PM](https://github.com/user-attachments/assets/02d9ec63-d2ad-4bc7-a590-42b4b0a94839)
```sql
SELECT name FROM actor a
JOIN casting c ON c.actorid = a.id
JOIN movie m ON c.actorid = m.id

WHERE m.id(
SELECT name FROM actor a JOIN casting c ON c.actorid = a.d JOIN movie m ON c.actorid = m.id
WHERE a.name = 'Art Garfunkel'
)
AND name! = 'Art Garfunkel' 
```

6. 




   
7. Obtain a list, in alphabetical order, of actors who ahve had at least 15 starring roles.
   ![Screenshot 2025-01-10 at 4 25 48 PM](https://github.com/user-attachments/assets/420a9a35-3161-4a46-a0f1-5859672741c1)

    ```sql
    SELECT name
    from actor a

    JOIN casting c ON c.actorid = a.id

    WHERE c.ord = 1

    GROUP BY name
    HAVING count(name) >= 15;
    ```
8. Write a query to fetch unique values from the department column in the employees table.
9. Fetch all employees who earn more than $50,000.
10. Write a query to find employees hired after January 1, 2020.
11. Retrieve the top 5 highest-paid employees.
12. Find employees whose names start with the letter "A".
13. Fetch employees who belong to either the "Sales" or "Engineering" department.
14. Write a query to fetch employees with NULL values in the manager_id column.
15. Sort the employees by their hire date in descending order.
16. Write a query to fetch all columns from a table named `employees`.


17. HAVING vs. WHERE. HAVING- used to check conditions *after the aggregation takes place. WHERE- used to check conditins *before aggregation takes place. WHERE does not work with aggregate functions. 

    ```sql
    select City, CNT=Count(1)
    FROM Address
    
    WHERE State = 'MA'
    GROUP BY City
    /*gives you table of all cities in MA and number of address in each city*/

    ```

    ```sql
    SELECT City, CNT = COUNT(1)
    FROM locations
    GROUP BY City; 
    

    ```
