/* 
Pivot the  Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. 
The output column headers should be Doctor, Professor, Singer, and Actor, respectively. 

+-------------+------------+
| Column      |   Type     |
+-------------+------------+
| employee_id | INTEGER    |
| name        | STRING     |
| months      | INTEGER    |
| salary      | INTEGER    |
+-------------+------------+
*/


SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor, 
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor

FROM (
    SELECT Occupation, Name, ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn /* 'rn' = row number assigned to individual based on theor occupation and alphabetical order of their 'name' */
    FROM OCCUPATIONS
) AS pivot

GROUP BY rn
ORDER AS rn; 



/*
This query performs the following steps:
The inner query uses the ROW_NUMBER() window function to assign a row number to each name within its occupation, ordered by name. This allows us to align
the names with their respective occupations while sorting them alphabetically. 

The outer query uses conditional aggregation to pivot the data. It assigns each name to its respective column based on the occupation.

The GROUP BY rn ensures that the names are aligned correctly with their occupations. 

Finally, we order the result by the row number (rn) to display the names alphabetically underneath their respective occupations. 

"Pivoting" => displaying the data you already have in a different way. 
'MAX' => selelcts the lexicographically greatest name (alphabetically last) from those rows where the 'Occupation' is 'Doctor'. 

*/




