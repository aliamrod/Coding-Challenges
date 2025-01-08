/*
Query the names of the cities with the smallest and largest latitudes (LAT_N), along with their latitude values. Resolve ties alphabetically. 

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

/*RESULT1*/
(
  SELECT CITY, LAT_N 
  ORDER BY LAT_N, CITY
  FROM STATION 
  FETCH FIRST 1 ROW ONLY
)

UNION ALL

/*RESULT2*/
(
  SELECT CITY, LAT_N
  ORDER BY LAT_N DESC, CITY
  FETCH FIRST 1 ROW ONLY
);
