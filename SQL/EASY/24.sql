/*
Query the city closest to the equator (absolute value of LAT_N is smallest) and the city farthest from the equator (absolute value of LAT_N is largest). 
Include the absolute latitude in the output.

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
  SELECT CITY, ABS(LAT_N) AS ABS_LAT_N
  FROM STATION
  ORDER BY ABS_LAT_N ASC, CITY
  FETCH FIRST 1 ROW ONLY
)

  UNION ALL

(
  SELECT CITY, ABS(LAT_N) AS ABS_LAT_N
  FROM STATION 
  ORDER BY ABS_LAT_N DESC, CITY
  FETCH FIRST 1 ROW ONLY
);
