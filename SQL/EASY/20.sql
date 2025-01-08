/* 

Generate the following two result sets:
1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed
in parantheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S). 
2. Query the number of occurences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format: 

'There are a total of [occupation_count] [occupation]s. 
...where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one
Occupation has the same [occupation_count], they should be ordered alphabetically. 
+-------------+------------+
| Column      |   Type     |
+-------------+------------+
| employee_id | INTEGER    |
| name        | STRING     |
| months      | INTEGER    |
| salary      | INTEGER    |
+-------------+------------+
 
*/




/*RESULT1*/
SELECT CONCAT(Name, '(', LEFT(Occupation ,1), ')')
 FROM OCCUPATIONS
 ORDER BY Name;

/*RESULT2*/

SELECT CONCAT('There is a total of', COUNT(Occupation), ' ' , LOWER(Occupation), 's.')
FROM OCCUPATIONS
ORDER BY Name; 
