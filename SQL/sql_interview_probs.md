**Difference between SQL and MySQL**

SQL = abstraction or a language; there is no implementation involved. Language used to interact with databases. MySQL = piece of software; database relational management tool. Implements those relational databases. 

**PRIMARY KEYS**

Primary key = Three main components: (1) It can't be duplicated, (2) Cannot be NULL/Blank, (3) Each table can only have one key. Therefore, it's a unique, non-nullible identifier for each record in a table (can be one column or multiple). 

Foreign key = helps you connect data across tables, ensuring that records in one table can reference related information in another (i.e. Course, Degree, etc and Primary key - studentID, roll #).

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

DELETE can remove specific rows using a WHERE clause (TRUNCATE cannot). TRUNCATE is not reversible + if you want to maintain stucture yet remove elements, this works well. DROP removes the structure itself. 

```sql DELETE FROM table_name WHERE column_name = 'value'; 
COMMIT; ```

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
SQL - basic queries to fetch data
Python/R - implementation of a basic clustering algorithm (code doesn't need to be executable but it is meant to assess fundamental concepts and coding skills)



   
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

8. CASE statements in SQL.
```sql
SELECT CASE WHEN gender = 'M' THEN 'Male WHEN gender = 'F' THEN 'Female' ELSE 'Other'
END AS gender

FROM employee;
```

9. Write a query to fetch unique values from the department column in the employees table.


10. Fetch all employees who earn more than $50,000.
```sql
SELECT * 
FROM employees 
WHERE salary > 50000;
```

11.  Write a query to find employees hired after January 1, 2020.
```sql
SELECT *
FROM employees
WHERE hire_date > '2020-01-01';
```
12. Retrieve the top 5 highest-paid employees.
```sql
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 5;
```
13. Find employees whose names start with the letter "A".
```sql
SELECT *
FROM employees
WHERE name LIKE "A%";
```
14. Fetch employees who belong to either the "Sales" or "Engineering" department.
```sql
SELECT *
FROM employees
WHERE department IN ('Sales', 'Engineering');
```
15. Write a query to fetch employees with NULL values in the manager_id column.
```sql
SELECT *
FROM employees
WHERE manager_id IS NULL;
```
16. Sort the employees by their hire date in descending order.
```sql
SELECT *
FROM employees
ORDER BY hire_date DESC; 
```
17. Write a query to fetch all columns from a table named `employees`.
```sql
SELECT *
FROM employees;
```

18. HAVING vs. WHERE. HAVING- used to check conditions *after the aggregation takes place. WHERE- used to check conditins *before aggregation takes place. WHERE does not work with aggregate functions. 

    ```sql
    select City, CNT=Count(1)
    FROM Address
    
    WHERE State = 'MA'
    GROUP BY City
    /*gives you table of all cities in MA and number of address in each city*/
    ```

19. Write a query to find all orders placed between January 1, 2023 and March 31, 2023, with a total amount exceeding $500.

```sql
SELECT OrderID, OrderDate, TotalAmount
FROM Orders
WHERE OrderDate BETWEEN '2023-01-01' AND '2023-03-31' AND TotalAmount > 500;
```

 20. Retrieve all the details of employees who earn more than the average salary of their department.

 21. Find all products that are either out of stock or have a price higher than $100.

 22. Find all customers who have placed at least one order.
```sql
CREATE TABLE Customers(
CustomerID INT PRIMARY KEY,
Name NVARCHAR(50)
);

CREATE TABLE Orders(
OrderID INT PRIMARY KEY,
CustomerID INT
);

INSERT INTO Customers VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Charlie');
INSERT INTO Orders VALUES (1,1), (2,1), (3,2);

/*Query*/
SELECT *
FROM Customers
WHERE CustomerID IN (
SELECT DISTINCT CustomerID 
FROM Orders

);
```
 23. Get all customers whose names start with the letter 'A' and have an email domain of 'gmail.com'.
```sql

```
 24. Find all employees who work in the IT, HR, or Finance departments.

 25. List all customers who have placed more than 5 orders.

 26. Find all memberships that expire within the next 30 days.

 27. Get all students who are not enrolled in any courses.

 28. Find all orders where the total price (quantity x price) exceeds $500.

 29. Find cities with more than 10 addresses.

 30. Find product categories with more than $100,000 in total sales and more than 50 transactions.

 31. Find departments where the maximum employee salary exceeds twice the average salary of all employees.

 32. List customers whose largest and smallest orders differ by more than $1,000.

 33. Find all employees hired after 2020 whose average performance score exceeds 85.

 34. Show the total sales only if the total exceeds $1,000,000.

 35. Find customers who have placed more than 3 large orders (order amount > $1,000).

```sql
SELECT CustomerID, 
```

 36. Identify product categories where the average price exceeds $50 and the total sales exceed $200,000.
     ```sql
     SELECT ProductCategory, AVG(UnitPrice) AS AvgUnitPrice, SUM(SalesAmount) AS SumSalesAmount
     FROM Products
     GROUP BY ProductCategory
     HAVING AVG(UnitPrice) > 50 AND SUM(SalesAmount) > 200000;
     ```

 39. Find suppliers whose total shipment value exceeds $1,000,000.

    ```sql
    SELECT Suppliers.SupplierID, SUM(Orders.OrderTotal) AS TotalShipments
    FROM Suppliers s 
    JOIN Orders o ON s.SupplierID = o.OrderTotal 
    GROUP BY s.SupplierID WHERE SUM(o.OrderTotal) > 1000000;
     ```
     **You cannot use the alias 'TotalShipments' in the WHERE clause since WHERE clause is processed before the GROUP BY and aggregation operations, meaning that the alias TotalShipments (defined using SUM(Orders.OrderTotal)) does not yet exist when the WHERE clause is evaluated.

 38. List customers with an average order value between $100 and $500.
     ```sql
       SELECT CustomerID, AVG(OrderTotal) AS AvgTotal
       FROM Orders
       GROUP BY CustomerID

       HAVING AvgTotal BETWEEN 100 AND 500;
     ```



**Difference between DISTINCT and GROUP BY**

`DISTINCT` = Filters out duplicate rows based on the specified columns, returns unique values directly, and operates on the results before they're returned. 

`GROUP BY` = groups rows that have the same values in specified columns; typically used with aggregate functions (i.e. SUM, COUNT, MAX, etc) to perform calculations for each group. 

1. Retrieve all unique department IDs.

```sql
SELECT DISTINCT department_ids
FROM Employees;
```

or 
```sql
SELECT department_ids
FROM Employees
GROUP BY department_ids;
```
2.  Total salary per department.
```sql
SELECT d.department_name, SUM(e.salary) AS totalSalary
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
GROUP BY department_name;
```

3. List employees working on distinct projects.
```sql
WITH ProjectEmployees AS(
SELECT DISTINCT e.employee_id, p.project_name
FROM Employees e
JOIN Project_Assignments pa ON e.employee_id = pa.employee_id
JOIN Projects p ON pa.employee_id = p.project_id
)
SELECT * FROM ProjectEmplyees;
```

4. Departments with more than 3 employees.
```sql
SELECT d.department_name, COUNT(e.employees) AS employeeCount
FROM Employees e
JOIN Departments d ON d.department_id = e.department_id
GROUP BY department_name
HAVING COUNT(e.employee_id) > 3;
```

5. Count of employees earning above and below 50,000 in each department.
```sql
SELECT d.department(
SUM(CASE WHEN e.salary > 50000 THEN 1 ELSE 0) AS above_50k,
SUM(CASE WHEN e.salary <50000 THEN 1 ELSE 0) AS below_50k
)
FROM Employees e JOIN Departments d ON e.department_id = d.department_id
GROUP BY d.department_name; 
```
6. Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.

In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.


![Screenshot 2025-01-11 at 5 28 43 AM](https://github.com/user-attachments/assets/27020263-1c3f-4d71-b894-fcb1afd2a52c)

```sql
SELECT tweet_count AS tweet_bucket,
COUNT(user_id) as users_num

FROM (
SELECT user_id, COUNT(*) AS tweet_count

FROM tweets
WHERE tweet_date >= '2022-01-01 00:00:00' AND tweet_date < '2022-01-01 00:00:00'
GROUP BY user_id
) subquery

GROUP BY
tweet_count

ORDER BY tweet_count ASC; 
```

6. Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.

Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.

![Screenshot 2025-01-11 at 6 33 51 AM](https://github.com/user-attachments/assets/89bfdf02-883b-4312-ac96-53551884d4e5)

```sql
SELECT candidate_id
FROM candidates

WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3
ORDER BY candidate_id ASC;
```

```sql WHERE skill = 'Python' AND skill = 'Tableau' AND skill = 'PostgreSQL'``` is logically incorrect because a single row in the database cannot simultaneously have all three string values. Instead, you need to use the `IN` operator combined with `GROUP BY` and `HAVING`. 
```sql
SELECT p.page_id
FROM pages p

WHERE page_id NOT IN (
SELECT pl.page_id FROM page_likes pl
);

```

or 
```sql
SELECT p.page_id
FROM pages p

WHERE NOT EXISTS(
SELECT 1
FROM page_likes pl
WHERE p.page_id = pl.page_id);
```

7. Tesla is investigating production bottlenecks and they need your help to extract the relevant data. Write a query to determine which parts have begun the assembly process but are not yet finished.

Assumptions:

parts_assembly table contains all parts currently in production, each at varying stages of the assembly process.
An unfinished part is one that lacks a finish_date.
![Screenshot 2025-01-11 at 7 08 58 AM](https://github.com/user-attachments/assets/e2ef23a9-dc0d-4189-8b88-f16c0cd4ba50)

```sql
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL
ORDER BY parts ASC;
```

8. Assume you're given the table on user viewership categorised by device type where the three types are laptop, tablet, and phone.

Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership. Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.

![Screenshot 2025-01-11 at 7 18 39 AM](https://github.com/user-attachments/assets/9bd71d65-99cd-4eed-b939-1b6b419407c7)


```sql
SELECT

SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views

FROM viewership;
```
9. Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. Output the user and number of the days between each user's first and last post.

    ![Screenshot 2025-01-11 at 10 03 49 AM](https://github.com/user-attachments/assets/85dc75fe-9c15-4a94-a171-31fd569008ea)


```sql
SELECT user_id, MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM  posts

WHERE DATE_PART('year', post_date::DATE) = 2021
GROUP BY user_id
HAVING COUNT(*) >= 2; 
```

10. Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending order based on the count of the messages.

![Screenshot 2025-01-11 at 10 23 26 AM](https://github.com/user-attachments/assets/2a145de3-ec66-4d74-b33b-b587327b22ec)

```sql
SELECT sender_id, COUNT(message_id) AS message_count
FROM messages
WHERE DATE_PART('month', sent_date::DATE) = '08' AND DATE_PART('year', sent_date::DATE) = 2022
GROUP BY sender_id
SORT BY sender_id DESC
LIMIT 2; 
```
11. Assume you are given the table below on Uber transactions made by users. Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date.

![Screenshot 2025-01-11 at 10 36 45 AM](https://github.com/user-attachments/assets/2490d4c7-fd16-469f-a110-36e82c01e9ed)


```sql
WITH trans_num AS(
SELECT user_id, spend, transaction_date,
ROW_NUMBER() OVER( PARTITION BY user_id ORDER BY transaction_date)
)

SELECT user_id, spend, transaction_date
FROM trans_num
WHERE row_num = 3; 
```


12. Tech companies have been laying off employees after a large surge of hires in the past few years. Write a query to determine the percentage of employees that were laid off from each company. Output should include the company and the percentage (to 2 decimal places) of laid off employees. Order by company name alphabetically.

```sql
SELECT company, ROUND((employees_fired / company_size) * 100, 2)AS percentage
FROM tech_layoffs

ORDER BY company ASC; 
/*- - Percentage Calc: Employees fired / Company size * 100 */

```

13. Data was input incorrectly into the database. The ID was combined with the First Name. Write a query to separate the ID and First Name into two separate columns. Each ID is 5 characters long.

```sql
SELECT
  SUBSTRING(id, 1, 5) AS NewID,  
  SUBSTRING(id, 6, LEN(id - 5)) AS FirstName
FROM bad_data; 

```

14. Write a SQL query that outputs department names and their overall revenue over the past 12 months. Sort in order of revenue in descending oder. 

```sql
CREATE TABLE order(

  order_id INT PRIMARY KEY,
  customer_id INT
  order_date TIMESTAMP
  order_amount INT
  department_Id INT
);

CREATE TABLE departments(
  department_id PRIMARY KEY,
  department_name VARCHAR(50)
);

CREATE TABLE customers(
  customer_id INT PRIMARY KEY,
  last_name VARCHAR(255),
  first_name VARCHAR(255)
);

```

Notes:
-- department names, total revenue per dept , time: 12 months
-- order by revenue DESC;
-- order o, departments d, customers c

-- Use a WHERE clause to take last 12 months.. 

```sql
SELECT
  d.department_name,
  sum(o.order_amount) AS total_revenue
FROM o

JOIN department d
ON
  o.deparment_id = d.department_id
WHERE
  o.order_date >= CURRENT_DATE - INTERVAl 12 MONTH
GROUP BY d.department_name

ORDER BY total_revenue DESC; 

```

or 


```sql
SELECT
  d.department_name,
  sum(o.order_amount) as total_revenue
FROM
  d.department_id
JOIN
  d.department_Id = o.department_id

WHERE
  o.order_date >= (date_sub() - interval 12 month)

ORDER BY
  total_revenue DESC; 
```

Now how many customers ordered from the "Fashion" and "Electronics" department in 2022. 

NOTES: 
-- We essentially have two WHERE clauses// year and string match department name. 


```sql
SELECT
  COUNT(DISTINCT o.customer_id) AS unique_customers

FROM
  order o
JOIN
  department d
ON
  o.department_id = d.department_id
WHERE
  d.department_name = ('Fashion', 'Electronics')
  AND YEAR(o.order_date) = 2022; 


```

or 

```sql
select
  count(distinct o.customer_id) as unique_id,
  d.department_name
from
  order o
join
  department d
on
  o.customer_id = d.customer_id
where
  year(o.order_date) = 2022
and
  d.department_name in ('Fashion', 'Electronics')
group by
  d.department_name asc; 
```

Now, write a query that can generate Customer IDs belonging to customers with the most orders in each of the last 5 last years. So output should have the individual 5 years, 5 first names, 5 last names, and amount of orders per customer of those years. 

NOTES:
-- list of cust_id w most orders in the last 5 years
-- 5 years, 5 last_name, 5 first_name, total amount of orders per customer (NOT a summation clause, but rather a COUNT clause)
-- customers c, order o

```sql
with ordercounts as(
  select
    c.customer_id,
    c.first_name,
    c.last_name,
    year(o.order_date)
    count(o.order_id) as total_orders

from
  customers c
join
  order o
on
  c.customer_id = o.order_id
where
  o.order_date in (2025, 2024, 2023, 2022, 2021)
group by
  c.customer_id, c.first_name, c.last_name, year(o.order_date)

),

rankedorders as(
  select *,
  rank() over (partition by order_year order by total_orders desc) as rank_per_year

  from ordercounts

)

SELECT 
    order_year,
    customer_id,
    first_name,
    last_name,
    total_orders
FROM 
    RankedOrders
WHERE 
    rank_per_year = 1
ORDER BY 
    order_year;

```

or 

```sql

with ordersperyear as(
select
  c.customer_id,
  c.first_name,
  c.last_name, 
  year(o.order_date) as years,
  count(o.order_id) as total_orders, 
  rank() over (partition by year(order_date) order by count(o.order_id) desc) order_rankings

from
  order o
join
  customers c
on
  o.customer_id = c.customer_id
where
  o.order_date in (2025, 2024, 2023, 2022, 2021)

group by
  year(o.order_date), c.customer_id, c.first_name, c.last_name
)

select
  first_name, last_name, total_orders, year
from
  orders
where orders_ranked = 2
order by years asc
```


Now write query that selects the second highest order amount in the 'Fashion' Department. 

NOTES:
-- revenue amount 
-- orders o, department d

```sql
select
  cte as(
select
  d.deparment_name,
  o.order_amount,
  rank() over (partition by d.department_name order by o.order_amount desc) as amount_ranking

from
  orders o
join
  departments d
on
  o.department_Id = d.department_id
where
  d.department_name = 'Fashion'

)

select
  order_amount

from
  cte
where amount_ranking = 2; 


```
Also can use the generic query: 
```sql
select * from employee
where salary = (select distinct(salary) from employee order by salary DESC LIMIT n-1, 1);
```


Lastly, show the department that had the highest month-over-month increase in order amount in December 2022.

NOTES:
- so highest order amount different from nov->dec)
- cte1: go through and filter out for orders in nov2022 and dec2022
- cte2: now that you have totals, subtract this difference

```sql

with nov_to_dec_amounts(

select
  department_id,
  sum(order_amount) as order_amount_per_month, 
  date_format(order_date, '%Y-%M') as y_m_date
from
  orders
where date_format(order_date, '%Y-%M') in ('2022-11', '2022-12')
group by
  department_id,
  date_format(order_date, '%Y-%M')
),

mom_totals(

select
  department_id,
  (order_amount_per_month - lag(order_amount_per_month) over (partition by department_id order by y_m_date) month_to_month_increase

from nov_to_dec_amounts
where y_m_date = '2022-12'

order by y_m_date, department_id
)

select
from mom_totals m

join
  departments d
on
  m.department_id = d.department_id

```





15. Client spends money across 4 different marketing channels and they want to know which are the most effect. Two tables we're starting with:

--attribution table
*session_id, str
* marketing_channel, str
* purchasing_value, float

--user_sessions table
* session_id, str
* ad_click_timestamp, datetime
* user_id, str

Now, what is the average purchase value by marketing channel. 

```sql
select
  marketing_channel,
  avg(purchasing_value) as avg_purchase_value
from
  attribution_table
group by
  marketing_channel
order by
  avg_purchase_value DESC;
```

Now, what percentage of link clicks convert to a purchase for each marketing channel?

```sql
WITH clicks_and_purchases AS(
  SELECT
    us.marketing_channel,
    COUNT(DISTINCT us.session_id) AS total_clicks
    COUNT(DISTINCT CASE WHEN at.purchasing_value > 0 THEN us.session_id END) AS total_purchases
FROM
  user_sessions us
JOIN
  attribution_table at
ON
  us.session_id = at.session_id
GROUP BY
  us.marketing_channel
)

SELECT
  marketing_channel,
  total_clicks,
  total_purchases,
  (total_purchases * 100.0 / total_clicks) AS conversion_rate
FROM
  clicks_and_purchases
ORDER BY
  conversion_rate DESC; 
```

```sql
SELECT
  marketing_channel,
  AVG(purchasing_value) AS avg_purchase,
  AVG(CASE WHEN purchasing_value > 0 THEN 1 ELSE 0 END) AS conversion_rate
FROM attribution_table

ORDER BY
  AVG(CASE WHEN purchasing_value > 0 THEN 1 ELSE 0 END) DESC; 
```

Now, what is the customer lifetime value for each user. 
NOTES: 
- - summation of their purchase value -> so perform inner join on session_id --> consequently aggregate on user_id.

```sql
select
  u.user_id, sum(a.purchasing_value) as clv
from
  user_sessions u
inner join 
  attribution
on
  u.session_id = a.session_id

group by
  u.user_id
order by
  sum(a.purchasing_value) desc; 
```

Now, define high value users as CLV > 100. 

```sql
select
  u.user_id, sum(a.purchasing_value) as clv
from
  user_sessions u
inner join
  attribution a
on
  u.session_id = a.session_id
group by
  u.user_id
having
  sum(a.purchasing_value) > 100
order by
  sum(a.purchasing_value) desc; 
```

**Since 'clv' comes after GROUP BY clause, we follow with 'having sum(a.purchasing_value) > 100... 

Now, first touch attribution is an analysis through which the user first encounters the product. Perform first touch attribution for all 'high value customers'. 

NOTES:
-- first attribution -> what marketing channel they first encountered the product
-- requires 2 queries--> q1 => figure out who are the high value users are ; q2=> figure out the 1st touch for each user by datetime();



```sql
/*determine high value users*/

/*create subquery within this query...*/

/*SOLUTION 1*/

WITH high_value_users AS(
  SELECT u.user_id, SUM(a.purchasing_vaule) AS clv
  FROM user_sessions u
  INNER JOIN attribution_table a
  ON u.session_id = a.session_id

  GROUP BY u.user_id
  HAVING SUM(a.purchasing_value) > 100

  ORDER BY SUM(a.purchasing_value) > 100 DESC

), 

first_touch AS(
SELECT u.user_id, MIN(u.ad_click_timestamp) AS first_touch_time
FROM user_sessions u

INNER JOIN high_value_users hv
ON u.user_id = hv.user_id

GROUP BY u.user_id
),

first_touch_attributions AS(

/*Associate the first touch with the marketing channel*/
SELECT
  ft.user_id,
  us.marketing_channel,
  ft.first_touch_time
FROM
  first_touch fg
INNER JOIN
  user_sessions u
ON
ft.user_id = u.user_id

AND
ft.first_touch_time = us.ad_click_timestamp

),

SELECT
fta.marketing_channel,
COUNT(DISTINCT fta.user_id) AS high_value_users_count

FROM first_touch_attribution fta
GROUP BY fta.marketing_channel
ORDER BY high_value_users_count DESC; 


```



-attribution table
*session_id, str
* marketing_channel, str
* purchasing_value, float

--user_sessions table
* session_id, str
* ad_click_timestamp, datetime
* user_id, str


Now, what percentage of users came from each marketing channel?

NOTES:
-- add from previous query
```sql

WITH high_value_users AS(
  SELECT u.user_id, SUM(a.purchasing_vaule) AS clv
  FROM user_sessions u
  INNER JOIN attribution_table a
  ON u.session_id = a.session_id

  GROUP BY u.user_id
  HAVING SUM(a.purchasing_value) > 100

  ORDER BY SUM(a.purchasing_value) > 100 DESC

), 

first_touch AS(
SELECT u.user_id, MIN(u.ad_click_timestamp) AS first_touch_time
FROM user_sessions u

INNER JOIN high_value_users hv
ON u.user_id = hv.user_id

GROUP BY u.user_id
),

first_touch_attributions AS(

/*Associate the first touch with the marketing channel*/
SELECT
  ft.user_id,
  us.marketing_channel,
  ft.first_touch_time
FROM
  first_touch fg
INNER JOIN
  user_sessions u
ON
ft.user_id = u.user_id

AND
ft.first_touch_time = us.ad_click_timestamp

),

SELECT
fta.marketing_channel,
COUNT(DISTINCT fta.user_id) / (COUNT (*) FROM high_value) AS percentage

FROM first_touch_attribution fta
GROUP BY fta.marketing_channel
ORDER BY high_value_users_count DESC; 
```





13. Assume you work as a Data Scientist at an eCommerce company. We have three tables in the database:

    /*
    transactions table
    Column Type
    id INTEGER
    user_id INTEGER
    created_at DATETIME
    product_id INTEGER
    quantity INTEGER


    products table
    Column Type
    id INTEGER
    name VARCHAR
    price FLOAT


    users table
    Column Type
    id INTEGER
    name VARCHAR
    sex VARCHAR
    */

```sql

    Write a query that reports the number of users, number of transaction  placed, and total amount per month in the year 2020.

-- Monthly reporting of KPIs
SELECT
  date_part('month', created_at) as month_date,
  count(distinct user_id) num_customers, 
--each row in transactions table pertains to an order
   num_orders


--each row in transactions table pertains to an order
  count(txn.id) num_orders,
  
-- order amount is price*quantity
  sum(p.price*txn.quantity) order amount
  
FROM
  transactions txn
JOIN 
  products p
ON
  txn.id = p.id
WHERE
  date_part('year', created_at)
GROUP BY 
  date_part('month', created_at);


********



14. Find the employees earning more than their managers. Output the employee's first name along with their corresponding salary.

/*

employees
id: Int
first_name: varchar
last_name: varchar
age: int
sex: varchar
employee_title: varchar
department: varchar
salary: int
target: int
bonus: int
email: varchar
city: varchar
address: varchar
manager_id: int
*/

Solution 1: 

```sql
SELECT
  e.first_name AS EmployeeName,
  e.salary AS EmployeeSalary
FROM
  employees e
LEFT JOIN
  employees m
ON
  e.manager_id = m.id
WHERE
  e.salary > m.salary;

```

Solution 2: 

```sql
(select id, first_name, salary, manager_id from employees)a

left JOIN
(select id as manager_id, salary as manager_salary from employees) b

on a.manager_id = b.manager_id

where a.salary > b.manager_salary

```






15. This is a social media company interested in 'growth hacking'-- interested in how frequently people post and how successful these posts are. They intend to increase the usage of the post feature as a proxy of User Engagement.

Write a query to output the total number of successful posts per user type in the last month. 

/*

post_user
user_id : int
user_type : varchar 
age : int

post
post_id : Int
post_date : datetime
user_id : int
interface : varchar
is_successful_post : int

-- social media company - engagement - posting success
-- output: by user, post success rate. 

-- user
-- # of successful post
-- 

*/

    ```sql



    ```



```sql
SELECT
  user_id

```



8


16. l3
17. l4
18. l5
19. l6
20. l7
21. l8
22. l9
23. l10
24. l11
  
