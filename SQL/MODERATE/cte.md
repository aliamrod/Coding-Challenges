Common Table Expression (CTE) in SQL. 

A. Introduction
The common table expression (CTE) is a powerful construct in SQL that helps simplify a query. CTEs
work as virtual tables (with records and columns), created during the execution of a query, 
used by the query, and eliminated after query execution. CTEs often act as a bridge to transform the data in source tables to the fortmat expected by the query. 

A common table expression, or CTE, is a temporary named result set created from a simple SELECT statement that can be used in a subsequent SELECT statement. Each SQL CTE is like a named query, whose result is stored in a virtual table (a CTE) to be referenced later in the main query. 

```SQL
WITH my_cte AS(
  SELECT a, b, c
  FROM T1
)

SELECT a, c
FROM my_cte
WHERE ...
```
The name of this CTE is ```my_cte```, and the CTE query is ```SELECT a,b,c FROM T1```. The CTE starts with the ```WITH``` keyword, after which you specify the name of your CTE, then the content of the query in parentheses. The main query comes after the closing parenthesis and refers to the CTE. Here, the main query (also known as the outer query) is ```SELECT a,c FROM my_cte WHERE...```

B. Examples
In this section, I have presented examples of SQL queries using common table expressions. All examples are based on a database for a chain of cellular phone stores. The table ```sales```, shown below, has one record per product sold:
|branch | date | seller | item| quantity | unit_price
| :---         |     :---     |:--- | :---| :---| :---|
| Paris-1   | 2021-12-07     | Charles    | Headphone A2 | 1 | 80|
| London-1     | 2021-12-06       | John      | Cell Phone X2 | 2 | 120|
| London-2 | 2021-12-07 | Mary | Headphones A1 | 1 | 60|
| Paris-1 | 2021-12-07 | Charles | Battery Charger | 1 | 50 |
| London-2 | 2021-12-07 | Mary | Cell Phone B2 | 2 | 90|
| London-1 | 2021-12-07 | John | Headphones A0 | 5 | 75|
| London-1 | 2021-12-07 | Sean | Cell Phone X1 | 2 | 100 |

In the first example, we obtain a  report from the ```sales``` table but add an extra column with the price of the most expensive item sold in the same branch that day. To obtain the price of the most expensive item, we use a common table expression like this:

```SQL
WITH highest AS(
  SELECT
  branch,
  date,
  MAX(unit_price) as highest_price
FROM sales
GROUP BY branch, date
)
SELECT
  sales.*,
  h.highest_price
FROM sales
JOIN highest h
  on sales.branch = h.branch
    AND sales.date = h.date
)
```
