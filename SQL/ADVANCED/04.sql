
/* Calculate the toal sales for each store, considering only orders in the year 1993.*/

SELECT
  store_id, 
  SUM(sales_amount) AS total_sales_1993
FROM
  sales
WHERE
  YEAR(order_date) = 1993
GROUP BY
  store_id; 
