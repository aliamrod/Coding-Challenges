/*
Calculate the percentage contribution of each store to total sales:
*/

SELECR 
  store_id, 
  SUM(sales_amount) / (SELECT SUM(sales_amount) FROM sales) * 100 AS percentage_contribution
FROM
  sales
GROUP BY
  store_id; 
