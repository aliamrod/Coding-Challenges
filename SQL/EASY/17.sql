/* 
Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more 
students both have names ending in the same last three characters (i.e. Bobby, Robby, etc.), secondary sort them by ascending ID. 

Given a table STUDENTS that holds data for five fields namely ID, Name, Marks.
+------------+-------------+
| Column     |     Type    |
+------------+-------------+
| ID         | INTEGER     |
| Name       | STRING      |
| Marks      | INTEGER     |
+------------+-------------+

*/

SELECT Name
FROM STUDENTS
WHERE Marks > 75 ORDER BY SUBSTR(NAME, -3), ID;


