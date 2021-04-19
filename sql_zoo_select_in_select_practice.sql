--  ~~~~ SQL zoo practice SELECT within SELECT ~~~~ 

-- 1. List each country name where the population is larger than that of 'Russia'.
-- world(name, continent, area, population, gdp)

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT
name
FROM world
WHERE continent = 'Europe' AND (gdp/population) > 
    (SELECT (gdp/population) FROM world
    WHERE name = 'United Kingdom');

-- 3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT
name,
continent
FROM world
WHERE continent IN 
    (SELECT continent
    FROM world
    WHERE name = 'Argentina' or name = 'Australia');

-- 4.  Which country has a population that is more than Canada but less than Poland? 
-- Show the name and the population.

SELECT name,
population
from world 
WHERE population >
    (SELECT population
    FROM world
    WHERE name = 'canada')
AND population <
    (SELECT population
    FROM world
    WHERE name = 'poland')

-- 5. Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany. 
-- Show the name and the population of each country in Europe. 
-- Show the population as a percentage of the population of Germany.

The format should be Name, Percentage for example:
SELECT 
name,
CONCAT(Round 
    (population * 100 / 
        (SELECT population
        FROM world
        WHERE name = 'germany') , 0 ), 
    '%') 
FROM world
WHERE continent = 'europe';
-- This returns the format 3.000000000 % not sure why
-- it's exactly the same as the solution given by SQL zoo in the video

-- 6. Which countries have a GDP greater than every country in Europe? 
-- [Give the name only.] (Some countries may have NULL gdp values)
SELECT name
FROM world
WHERE gdp >
    (SELECT max(gdp)
    FROM world
    WHERE continent = 'Europe');

-- 7. Find the largest country (by area) in each continent, show the continent,
-- the name and the area:

SELECT continent,
name,
area
FROM world
WHERE area IN
    (SELECT max(area)
    FROM world
    GROUP BY continent);

-- 8. List each continent and the name of the country that comes first alphabetically.



