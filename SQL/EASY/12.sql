/*
Query the list of CITY names ending with vowels (a,e,i,o,u) from STATION. Your result cannot contain duplicates. 

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



SELECT DISTINCT CITY FROM STATION
WHERE SUBSTR(CITY(-1,1)) IN ('a', 'e', 'i', 'o', 'u'); 



/*

or Case 2

*/

SELECT DISTINCT CITY
FROM STATION 
WHERE REGEXP '^[aeiou]$'
