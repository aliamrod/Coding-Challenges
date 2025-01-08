/*
Query the names of the cities with the top 5 largest longitudes (LONG_W) and the bottom 5 smallest longitudes, sorted alphabetically within each group.

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


(
  SELECT CITY, ABS(LONG_W) AS ABS_LONG_W
  FROM STATION 
  ORDER BY ABS_LONG_W DESC, CITY
  FETCH FIRST 5 ROWS ONLY
)


UNION ALL 

(
  SELECT CITY, ABS(LONG_W) AS ABS_LONG_W
  FROM STATION 
  ORDER BY ABS_LONG_W ASC, CITY
  FETCH FIRST 5 ROWS ONLY
);
