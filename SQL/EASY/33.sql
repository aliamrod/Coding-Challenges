/*
Query the following two values from the STATION table:
1. The sum of all values in LAT_N rounded to a scale of 2 decimal place.
2. The sum of all values in LONG_W rounded to a scale of 2 decimal places.
*/

SELECT 
  ROUND(SUM(LAT_N), 2) AS SUM_LAT
  ROUND(SUM(LONG_N), 2) AS SUM_LONG
FROM STATION;
