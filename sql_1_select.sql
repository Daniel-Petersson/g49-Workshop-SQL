# SQL select query exercise
#
# World database layout:
# To use this database from a default MySQL install, type: use world;
#
# Table: City
# Columns: Id,Name,CountryCode,District,Population
#
# Table: Country
# Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital
#
# Table: CountryLanguage
# Columns: CountryCode, Language, IsOfficial,Percentage
#
#
# 1: Get a query to return "Hello World", 123
# (Hint: 1 row, 2 columns)
SELECT "hello world" as message , 123 as id;
#
# 2: Get everything from the city table
# (Hint: Many many rows)
select * from city;
#
# 3: Get everything on the cities whose district is "aceh"
# (Hint: 2 rows)
select * 
from city
where District = 'Aceh'; 
#
# 4: Get only the name of the cities where the countrycode is "bfa"
select *
from city
where CountryCode = 'bfa';
#
#
# 5: Get both the name and district of the cities where the countrycode is "tto"
select Name, District
from city
where CountryCode = 'tto';
#
#
# 6: Get the name and district named as nm,dist from the cities where the countrycode is "arm"
select Name as nm, District as dist
from city
where CountryCode = 'arm';
#
#
# 7: Get the cities with a name that starts with "bor"
select *
from city
where Name like 'bor%';
#
#
# 8: Get the cities with a name that contains the string "orto"
select *
from city
where Name like '%orto%';
#
#
# 9: Get the cities that has a population below 1000
select *
from city
where Population < 1000;
#
# 10: Get the unique countrycodes from the cities that has a population below 1000
select distinct CountryCode
from city
where Population <1000;
#
# 11: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population
SELECT *
FROM city
WHERE CountryCode = 'UKR' AND Population > 1000000;
#
#
# 12: Get the cities with a population of below 200 or above 9500000 (9.5 million)
select *
from	city
where Population <200 or Population >9500000;
#
#
# 13: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM
select * 
from	city
where	CountryCode in	('TJK', 'MRT', 'PNG', 'SJM');
#
#
# 14: Get the cities with a population between 200 and 700 inclusive
select*
from	city
where Population between 200 and 700;
#
#
# 15: Get the countries with a population between 8000 and 20000 inclusive
SELECT country.Name, SUM(city.Population) AS total_population
FROM country
JOIN city ON country.Code = city.CountryCode
GROUP BY country.Name
HAVING total_population BETWEEN 8000 AND 20000;

#
#
# 16: Get the name of the countries with a independence year (indepyear) before year 0
SELECT Name
FROM country
WHERE indepyear < 0;

#
#
# 17: Get the countries that has no recorded independence year and a population above 1000000
SELECT country.Name
FROM country
LEFT JOIN city ON country.Code = city.CountryCode
GROUP BY country.Name
HAVING MAX(city.Population) > 1000000 AND COUNT(city.Population) = 0;

#
#
# 18: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy
SELECT c.Name
FROM country c
JOIN countrylanguage cl ON c.Code = cl.CountryCode
WHERE c.SurfaceArea < 10
AND c.LifeExpectancy IS NOT NULL;

#
