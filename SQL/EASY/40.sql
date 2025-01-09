/*
Consider a table COORDINATES with columns X and Y. Compute the maximum Euclidean distance between any two points in the table.
*/

select(
  round(sqrt(
  power(max(x) - min(x), 2),
  power(max(y) - min(y), 2)
  
  ), 4) as euclidean_distance
  
)
from coordinates;
