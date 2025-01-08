/*
Query the two cities in STATION with the shortest and longest CITY names , as well as their respective lengths(i.e.: number of characters in the name). If there is
more than one smallest or largest city, choose the one that comes first when ordered alphabetically. The STATION table is described as follows:

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
  SELECT CITY, LENGTH(CITY) AS CITY_LENGTH 
  FROM STATION 
  ORDER BY LENGTH(CITY), CITY
  FETCH FIRST 1 ROW ONLY
)

UNION ALL 

/*RESULT2*/
(
  SELECT CITY, LENGTH(CITY) AS CITY_LENGTH
  FROM STATION
  ORDER BY LENGTH(CITY) DESC, CITY
  FETCH FIRST 1 ROW ONLY
 
)


/*AS-> 'alias' for column in the result set; easier interpretation

UNION ALL-> combine results of two subqueries into one result set. 

*/
