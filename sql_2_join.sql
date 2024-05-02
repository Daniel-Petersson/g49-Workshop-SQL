# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
#
SELECT 
    *
FROM
    city
WHERE
    Name LIKE 'ping%'
ORDER BY Population ASC;

#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
#
SELECT 
    *
FROM
    city
WHERE
    Name LIKE 'ran%'
ORDER BY Population DESC;

#
# 3: Count all cities
SELECT 
    COUNT(*) AS total_cities
FROM
    city;
#
#
# 4: Get the average population of all cities
#
SELECT 
    AVG(Population) AS average_population
FROM
    city;

#
# 5: Get the biggest population found in any of the cities
SELECT 
    Name AS city_name, Population AS largest_population
FROM
    city
WHERE
    Population = (SELECT 
            MAX(Population)
        FROM
            city);
#
#
# 6: Get the smallest population found in any of the cities
#
SELECT 
    name AS city_name, population AS smalest_population
FROM
    city
WHERE
    Population = (SELECT 
            MIN(Population)
        FROM
            city);
#
# 7: Sum the population of all cities with a population below 10000
#
SELECT 
    SUM(Population) AS total_population_below_1000
FROM
    city
WHERE
    Population < 1000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
SELECT 
    COUNT(*) AS total_cities
FROM
    city
WHERE
    CountryCode IN ('moz' , 'vnm');
#
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT 
    CountryCode, COUNT(*) AS city_count
FROM
    city
WHERE
    CountryCode IN ('moz' , 'vnm')
GROUP BY CountryCode;
#
#
# 10: Get average population of cities in MOZ and VNM
SELECT 
    CountryCode, AVG(Population) AS average_population
FROM
    city
WHERE
    CountryCode IN ('MOZ' , 'VNM')
GROUP BY CountryCode;

#
#
# 11: Get the countrycodes with more than 200 cities
SELECT 
    CountryCode, COUNT(*) AS city_count
FROM
    city
GROUP BY CountryCode
HAVING COUNT(*) > 200;

#
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
SELECT 
    CountryCode, COUNT(*) AS city_count
FROM
    city
GROUP BY CountryCode
HAVING COUNT(*) > 200
ORDER BY city_count DESC;

#
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT 
    cl.Language
FROM
    city c
        JOIN
    countrylanguage cl ON c.CountryCode = cl.CountryCode
WHERE
    c.Population BETWEEN 400 AND 500;


#
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
#
SELECT 
    c.Name AS CityName, cl.Language
FROM
    city c
        JOIN
    countrylanguage cl ON c.CountryCode = cl.CountryCode
WHERE
    c.Population BETWEEN 500 AND 600;


#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT 
    c.Name AS CityName
FROM
    city c
WHERE
    c.CountryCode = (SELECT 
            CountryCode
        FROM
            city
        WHERE
            Population = 122199);

#
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT 
    c.Name AS CityName
FROM
    city c
WHERE
    c.CountryCode = (SELECT 
            CountryCode
        FROM
            city
        WHERE
            Population = 122199)
        AND c.Population != 122199;

#
#
# 17: What are the city names in the country where Luanda is capital?
SELECT 
    c.Name AS CityName
FROM
    city c
        JOIN
    country co ON c.CountryCode = co.Code
WHERE
    co.Capital = (SELECT 
            ID
        FROM
            city
        WHERE
            Name = 'Luanda');

#
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT 
    c.Name AS CapitalCity
FROM
    city c
        JOIN
    country co ON c.ID = co.Capital
WHERE
    co.Region = (SELECT 
            Region
        FROM
            city
        WHERE
            Name = 'Yaren');

#
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT
    cl.Language
FROM
    countrylanguage cl
        JOIN
    country co ON cl.CountryCode = co.Code
WHERE
    co.Region = (SELECT 
            Region
        FROM
            city
        WHERE
            Name = 'Riga');

#
#
# 20: Get the name of the most populous city
SELECT 
    Name AS MostPopulousCity
FROM
    city
ORDER BY Population DESC
LIMIT 1;


#
