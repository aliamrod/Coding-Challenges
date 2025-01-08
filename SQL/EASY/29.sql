/*
Find the cities whose latitude (LAT_N) is the median value (or closest to the median). If there are two median values, include both. 


Input Format:
The STATION table is described as follows:

      STATION
+-------------+--------------+
| Field       | Type         |
+-------------+--------------+
| ID          | NUMBER       |
| CITY        | VARCHAR2(21) |
| STATE       | VARCHAR2(2)  |
| LAT_N       | NUMBER       |
| LONG_W      | NUMBER       |
+-------------+--------------+

*/


WITH RankedCities AS (
  SELECT CITY, LAT_N, ROW_NUMBER() OVER (ORDER BY LAT_N) AS rn,
         COUNT(*) OVER () AS total_rows
  FROM STATION
)
SELECT CITY, LAT_N
FROM RankedCities
WHERE rn = (total_rows + 1) / 2
   OR rn = (total_rows + 2) / 2;
