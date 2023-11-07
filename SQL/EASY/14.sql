/*
Query the list of CITY names from STATION that do not end in vowels. Your result cannot end in duplicates. 


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

SELECT DISTINCT CITY
FROM STATION 
WHERE LOWER(SUBSTR(CITY, -1, 1)) not in ('a', 'e', 'i', 'o', 'u'); 
