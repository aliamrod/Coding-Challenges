/*
Consider a table POINTS with columns X, Y, and Z, representing coordinates of points in 3D space. Write a query to compute the Euclidean distance between two points:
- Point P1(x1, y1, z1): The point with the smallest 'x' value
- Point P2(x1, y1, z1): The point with the largest 'z' value
*/

select round(sqrt(
  power(min(x) - max(x), 2) + 
  power(min(x) - max(y), 2) + 
  power(min(z) - max(z), 2)
  
), 4) as distance
from points;
