/*
For each state, find the alphabetically first and last city. Limit results to a single state.

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
  SELECT CITY, STATE
  FROM STATION 
  WHERE STATE = 'CA'
  ORDER BY CITY ASC
  FETCH FIRST 1 ROW ONLY
)


  UNION ALL


(
  SELECT CITY, STATE
  FROM STATION 
  WHERE STATE = 'CA'
  ORDER BY CITY DESC
  FETCH FIRST 1 ROW ONLY
);
