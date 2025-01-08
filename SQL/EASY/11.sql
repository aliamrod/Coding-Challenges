/*
Query the list of CITY names starting with vowels (i.e., a, e, i, o or u) from STATION. Your result cannot contain duplicates. 

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

SELECT DISTINCT CITY FROM STATION /* 'STATION' table selection */
      WHERE CITY REGEXP '^[aeiouAEIOU]'
      ORDER BY CITY; 


/*
This query selects distinct CITY names from the STATION table where the CITY name starts with a vowel (either lowercase or uppercase), and
it orders the result in ascending order of CITY names
*/


/*
'REGEXP' stands for 'regular expression'. In the context of SQL, it is used to perform pattern matching within strings. Regular expressions are powerful
tools for searching, matching, and manipulating text based on patterns.

When you use 'REGEXP' in SQL, you can specify a regular expression pattern to search for within a string column. The pattern defines a set of characters or
sequences of characters that you want to match. This allows you to perform more complex and flexible searches than simple string equality or partial matching.
*/
