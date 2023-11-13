/*
Find the second expensive order in a table.
*/

SELECT
  order_id, 
  order_amount, 
FROM
  orders

ORDER BY
  order_amount DESC
LIMIT 1 OFFSET 1; 

/*modifying query to LIMIT 1 OFFSET 1 removes first row (OFFSET) and demonstrates 1 row (LIMIT) */
