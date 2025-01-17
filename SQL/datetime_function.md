
The most difficult part when working with dates is to verify that the format of the date you are trying to insert, matches the format of the date column in the database. 

`DATE` - format YYYY-MM-DD
`DATETIME` -- format: YYYY-MM-DD HH:MI:SS
`TIMESTAMP` -- format: YYYY-MM-DD HH:MI:SS
`YEAR` -- format YYYY or YY


1. Tracking task durations and deadlines. You are given a table, `Table`, with the following schema:

```sql/*
Column Name	Data Type	Description
task_id	INT	Unique identifier for each task.
assigned_date	DATETIME	The date and time when the task was assigned.
deadline_date	DATETIME	The date and time when the task is due.
completion_date	DATETIME	The date and time when the task was completed. Can be NULL if not completed.*/
```

Write a SQL query to answer the following. 

* Tasks completed on time.
* Average duration for completed tasks.
* Overdue tasks by Month. 
