
/* 

You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. 
Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend).
Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them.
Names must be ordered by the salary amount offered to the best friends.
It is guaranteed that no two students got same salary offer.
## 

# Students
+-------------+--------------+
| ID          | Name         |
+-------------+--------------+
| 1           | Ashley       |
| 2           | Samantha     |
| 3           | Julia        |
| 4           | Scarlet      |
+-------------+--------------+

# Friends
+-------------+--------------+
| ID          | Friend_ID    |
+-------------+--------------+
| 1           | 2            |
| 2           | 3            |
| 3           | 4            |
| 4           | 1            |
+-------------+--------------+

# Packages
+-------------+--------------+
| ID          | Salary       |
+-------------+--------------+
| 1           | 15.20        |
| 2           | 10.06        |
| 3           | 11.55        |
| 4           | 12.12        |
+-------------+--------------+
*/

Select S.Name
From (Students S join Friends F using(ID)
  join Packages P1 on S.ID = P1.ID
  join Packages P2 on F.Friend_ID = P2.ID)
Where P2.Salary > P1.Salary
Order By P2.Salary; 

