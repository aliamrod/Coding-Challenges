/*
For each state, find the alphabetically first and last city. Limit results to a single state. Separately extend this to all 50 states, you 

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

/*SOLUTION 1*/

(
  SELECT CITY, STATE 
  FROM STATION 
  WHERE STATE = 'AL'
  ORDER BY CITY ASC, STATE
  FETCH FIRST 1 ROW ONLY
)

UNION ALL

(
  SELECT CITY, STATE
  FROM STATION 
  WHERE STATE = 'AL'
  ORDER BY CITY DESC, STATE
  FETCH FIRST 1 ROW ONLY
);



/*SOLUTION 2*/

/*Use recursive CTE (Common Table Expression) to avoid repeating the same structure for all states.*/

WITH StatePositions(
  SELECT /*FIRST CITY*/ CITY, STATE, 'FIRST' AS POSITION
  FROM STATION 
  ORDER BY CITY ASC, STATE
  FETCH FIRST 1 ROW ONLY


  UNION ALL

  SELECT /*LAST*/ CITY, STATE , 'LAST' AS POSITION
  FROM STATE
  ORDER BY CITY DESC, STATE
  FETCH FIRST 1 ROW ONLY


)

SELECT * 
FROM StatePositions
ORDER BY STATE ASC, Position; 
  
