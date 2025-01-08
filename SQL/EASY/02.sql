/* Query the NAME field for all American cities in the CITY table with populations larger than 120,000.
The CountryCode for America is USA. The CITY table is described as follows:

## CITY
+-------------+--------------+
| Field       | Type         |
+-------------+--------------+
| ID          | NUMBER       |
| NAME        | VARCHAR2(17) |
| COUNTRYCODE | VARCHAR2(3)  |
| DISTRICT    | VARCHAR2(20) |
| POPULATION  | NUMBER       |
+-------------+--------------+
*/

SELECT NAME
FROM CITY
WHERE POPULATION > 120000 AND COUNTRYCODE = "USA"; 

/*
In this query, we use SELECT statement to specify that we want to retrieve the NAME field for each
city that meets the specified criteria. The FROM clause specifies the city table that we want to retrieve
data from. The WHERE clause includes the conditions that we want to apply to filter the results: we want
only those cities where the COUNTRYCODE is 'USA' and the POPULATION is greater than 120,000.
*/

