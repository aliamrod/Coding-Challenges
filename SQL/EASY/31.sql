/*Query the sum of the populations for all Japanese cities in the CITY. The COUNTRYCODE for Japan is JPN. */
SELECT SUM(POPULATION) AS TOTAL_POPULATION
FROM CITY
WHERE COUNTRYCODE = 'JPN';



