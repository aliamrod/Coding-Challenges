/*
Samantha interviews many candidates from different colleges using coding challenges and contests. Write a query to print the
contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and 
total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are zero.

Note: A specific contest can be used to screen candidates at more than one
college, but each college only holds screening contest.

* Contests: The contest_id is the id of the contest, hacker_id is the id of the hacker who created the contest, 
and name is the name of the 
+-------------+--------------+
| Column      | Type         |
+-------------+--------------+
| contest_id  | Integer      |
| hacker_id   | Integer      |
| name        | String       |  
+-------------+--------------+

* Colleges: The college_id is the id of the college, and the contest_id is the id of the contest that Samantha
used to screen the candidates. 
+-------------+--------------+
| Column      | Type         |
+-------------+--------------+
| college_id  | Integer      |
| contest_id  | Integer      |
+-------------+--------------+

Challenges: The challenge_id is the id of the challenge that belongs to one of the contests whose
contest_id Samantha forgot,and college_id is the id of the college where the challenge was given to
candidates. 
+-------------+--------------+
| Column      | Type         |
+-------------+--------------+
| challenge_id| Integer      |
| college_id  | Integer      |
+-------------+--------------+

* View_Stats: The challenge_id is the id of the challenge, total_views is the number of times the challenge
was viewed by candidates, and total_unique_views is the number of times the challenge was viewed by unique
candidates. 
+-------------+--------------+
| Column      | Type         |
+-------------+--------------+
| challenge_id      | Integer|
| total_views       | Integer|
| total_unique_views| Integer|
+-------------+--------------+

* Submission_Stats: The challenge_id is the id of the challenge, total_submissions is the number of submissions
for the challenge, and total_accepted_submission is the number of submissions that achieved full scores. 
+-------------+----------------------+
| Column                    | Type   |
+-------------+----------------------+
| challenge_id              | Integer|
| total_submissions         | Integer|
| total_accepted_submissions| Integer|
+-------------+----------------------+

*/

/* Objective-- query to print contest_id, hacker_id, name, and sums of total_submissions, total_accepted_submissions,
total_views, and total_unique_views for each contest sorted by contest_id. Thus, 7 columns in total.
*/

SELECT con.contest_id, con.hacker_id, con.name, 
SUM(sg.total_submissions), SUM(sg.total_accepted_submissions),
  SUM(vg.total_views), SUM(vg.total_unique_views)
  FROM CONTESTS as con /* aliasing Contests table as 'con'*/
  ON con.contest_id = col_contest_id 
 FROM Contests AS con 
JOIN Colleges AS col
ON con.contest_id = col.contest_id
JOIN Challenges AS cha 
ON cha.college_id = col.college_id
LEFT JOIN
(SELECT ss.challenge_id, SUM(ss.total_submissions) AS total_submissions, SUM(ss.total_accepted_submissions) AS total_accepted_submissions FROM 
Submission_Stats AS ss GROUP BY ss.challenge_id) AS sg
ON cha.challenge_id = sg.challenge_id
LEFT JOIN
(SELECT vs.challenge_id, SUM(vs.total_views) AS total_views, SUM(total_unique_views) AS total_unique_views FROM View_Stats AS vs GROUP BY vs.challenge_id) AS vg
ON cha.challenge_id = vg.challenge_id
GROUP BY con.contest_id, con.hacker_id, con.name
HAVING SUM(sg.total_submissions)+
       SUM(sg.total_accepted_submissions)+
       SUM(vg.total_views)+
       SUM(vg.total_unique_views) > 0




  ORDER BY con.contest_id; 



