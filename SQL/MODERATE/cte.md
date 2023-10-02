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
