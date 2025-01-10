**Difference between SQL and MySQL**

SQL = abstraction or a language; there is no implementation involved. Language used to interact with databases. MySQL = piece of software; database relational management tool. Implements those relational databases. 

**PRIMARY KEYS**

Primary key = Three main components: (1) It can't be duplicated, (2) Cannot be NULL/Blank, (3) Each table can only have one key. Therefore, it's a unique, non-nullible identifier for each record in a table (can be one column or multiple). 

**JOINS**
Way to 'join' two types of tables using logical commands; function allows us to use set of logic. There are four *main ones-- inner, outer, left and right (but in reality there are 7--> left, inner, right, full outer, cross, self, and natural). 


Example: 
List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'.
![Screenshot 2025-01-10 at 3 20 12 PM](https://github.com/user-attachments/assets/b38c7fb2-0ea1-46aa-a28d-6477f86cb937)

*Essentially just a JOIN and WHERE statement. 

```sql
SELECT go.player

FROM goal go JOIN game ga ON go.matchid = ga.id
WHERE ga.stadium = 'National Stadium, Warsaw';

```

_INNER JOIN_ : records with matches in both tables. 

Pros: 
- efficient for combining datasaets with only relevant matches.
- eliminates mismatched or NULL rows.

Cons:
- excludes data without matches, which might lead to loss of critical information.
  

Problem 1. Find engineers earning above the average salary. 

```SQL
SELECT e.id, e.name, s.salary

FROM employees e INNER JOIN salaries s ON e.id = s.employee_id

WHERE s.salary > (SELECT AVG(salary) FROM salaries) AND e.department = 'Engineering';

```

Problem 2. How would you identify missing rows in an INNER JOIN result? 

Use LEFT JOIN and filter with WHERE right_table.column is NULL.

***

Problem 3. 

Problem 4. 

Problem 5. 

Problem 6. 

Problem 7. 

Problem 8. 

Problem 9. 


Problem 10. 

Problem 11. 

Problem 12. 

Problem 13. 

Problem 14. 

Problem 15. 

Problem 16. 

Problem 17. 

Problem 18. 
Problem 19. 
Problem 20. 



_OUTER JOIN_ --> records where there is a match in *either table.

Problem 3. 

Problem 4. 

Problem 5. 

Problem 6. 

Problem 7. 

Problem 8. 

Problem 9. 


Problem 10. 

Problem 11. 

Problem 12. 

Problem 13. 

Problem 14. 

Problem 15. 

Problem 16. 

Problem 17. 

Problem 18. 
Problem 19. 
Problem 20. 


_LEFT JOIN_ --> all records from the left table, and matches from the right table.

Problem 3. 

Problem 4. 

Problem 5. 

Problem 6. 

Problem 7. 

Problem 8. 

Problem 9. 


Problem 10. 

Problem 11. 

Problem 12. 

Problem 13. 

Problem 14. 

Problem 15. 

Problem 16. 

Problem 17. 

Problem 18. 
Problem 19. 
Problem 20. 


_RIGHT JOIN_

Problem 3. 

Problem 4. 

Problem 5. 

Problem 6. 

Problem 7. 

Problem 8. 

Problem 9. 


Problem 10. 

Problem 11. 

Problem 12. 

Problem 13. 

Problem 14. 

Problem 15. 

Problem 16. 

Problem 17. 

Problem 18. 
Problem 19. 
Problem 20. 
