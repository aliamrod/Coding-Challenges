/*Determine the month with the highest number of orders in the past year.*/

SELECT 
  MONTH(order_date) AS highest_order_month, 
  COUNT(*) AS order_count
FROM
  orders
WHERE
  YEAR(order_date) = YEAR(CURRENT_DATE - INTERVAL 1 YEAR)
GROUP BY 
  order_count DESC
LIMIT 1; 


/* Find the books that have not been published in the last six months.*/
SELECT 
  book_id, 
  title, 
  publication_date
FROM
  books
WHERE
  publication_date < CURDATE() - INTERVAL 6 MONTH; 




/*Calculate the cumulative sum of the quantity column in the table.*/
SELECT
  order_id, 
  quantity, 
  SUM(quantity) OVER(ORDER BY order_id) AS cumulative_quantity
FROM
  order_details; 

/*Retrieve the most recent order for each store.*/
SELECT
  store_id,
  MAX(order_date) AS most_recent_order_date
FROM
  orders
GROUP BY
  store_id; 

/*Calculate the average order amount for each month in the year 1993.*/
SELECT
  MONTH(order_date) AS order_month, 
  AVG(order_amount) AS average_order_amount
FROM
  orders
WHERE
  YEAR(order_date) = 1993
GROUP BY
  order_month;


/*Find the stores that have sold at least 3 products in May 1993.*/
SELECT
  store_id
FROM   
  sales
WHERE
  YEAR(order_date) = 1993 
  AND MONTH(order_date) = 5
GROUP BY
  store_id
HAVING
  COUNT(DISTINCT product_id) >=3; 
