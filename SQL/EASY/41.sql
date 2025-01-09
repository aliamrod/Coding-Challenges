/*
Query the average population of all cities in CITY, rounded down to the nearest integer. 
*/

select floor(avg(population)) as avg_pop

from city;
