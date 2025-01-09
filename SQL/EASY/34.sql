/*
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.
*/

select truncate(sum(lat_n), 4) as sum_lat
from station
where lat_n between 38.7880 and 137.2345;
