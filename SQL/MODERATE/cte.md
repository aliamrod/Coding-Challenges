**Common Table Expression (CTE) in SQL**

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

**B. Examples**

In this section, I have presented examples of SQL queries using common table expressions. All examples are based on a database for a chain of cellular phone stores. The table ```sales```, shown below, has one record per product sold:
|branch | date | seller | item| quantity | unit_price|
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

-----------------------
In the next example, we generate a report within the highest daily revenue by branch.
```SQL
WITH daily_revenue AS(
  SELECT
    branch,
    date,
    SUM(unit_price * quantity) AS daily_revenue
FROM sales
WHERE EXTRACT(YEAR FROM date) = 2021
GROUP BY 1, 2
)

SELECT
  branch,
  MAX(daily_revenue) max_daily_revenue
FROM daily_revenue
GROUP BY 1
ORDER BY 2 DESC
```


In this query, a CTE called ```daily_revenue``` has columns branch, date, and ```daily_revenue``` for each date in 2021. Then in the outer query, we obtain the highest amount of revenue for each branch in 2021. The report is ordered by ```max_daily_revenue``` in descending order. 

Below are the results of this query.

|branch | max_daily_revenue | 
| :---         |     :---     |
| London-1 | 575  | 
| London-2     | 240  |
| Paris-1 | 135 |


**C. Using CTEs in Advanced SQL Queries**

You can define two or more CTEs and use them in the main query. In the next example, we show you how to divide and organize a long query using SQL CTEs. By naming different parts of the query, CTEs make the query easy to read.

Support we want a report with the total monthly revenue in London in 2021, but we also want the revenue for each branch in London in the same report. Here, we create two CTEs then join them in the main query. 

```SQL
WITH london1_monthly_revenue AS(
  SELECT
    EXTRACT(MONTH FROM date) as month,
    SUM(unit_price * quantity) AS revenue
  FROM sale
  WHERE EXTRACT(YEAR FROM date) = 2021
    AND branch = 'London-1'
  GROUP BY 1
),
london2_monthly_revenue AS(
  SELECT
    EXTRACT(MONTH FROM date) as month,
    SUM(unit_price * quantity) AS revenue
  FROM sale
  WHERE EXTRACT(YEAR FROM date) = 2021
      AND branch = 'London-2'
  GROUP BY 1
)
SELECT
  l1.month,
  l1.revenue + l2.revenue AS london_revenue,
  l1.revenue AS london1_revenue,
  l2.revenue AS london2_revenue
FROM london1_monthly_revenue l1, london2_monthly_revenue l2
WHERE l1.month = l2.month
```

In the query above, we defined two CTEs, ```london1_monthly_revenue``` and ```london2_monthly_revenue```, to obtain the monthly revenue in 2021 for each branch in London. Finally, we join both CTEs using the month column and calculate the total revenue for London by adding up the revenues of the two branches. 

The result of the query is below:
|month | london_revenue | london1_revenue | london2_revenue| 
| :---         |     :---     | :---| :---|
| 12  | 1055 | 815 | 240| 
