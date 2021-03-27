-- Practice for SQL zoo exercises on Sum, Max, Distinct, & Order By

-- 1.Show the total population of the world.
SELECT SUM(population)
FROM world

-- 2. List all the continents - just once each.
SELECT DISTINCT continent
FROM world

-- 3. Give the total GDP of Africa
SELECT SUM(gdp)
FROM world
WHERE continent = 'africa';

-- 4. How many countries have an area of at least 1000000
SELECT COUNT(name)
FROM world
WHERE area >= 1000000;

-- 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- 6. For each continent show the continent and number of countries.
SELECT continent, count(name)
FROM world
GROUP BY continent;

-- 7. For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent;

-- 8. List the continents that have a total population of at least 100 million.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000;

-- using noble table
--1. Show the total number of prizes awarded.
SELECT COUNT(winner) FROM nobel;

-- 2. List each subject - just once
SELECT DISTINCT subject
FROM nobel;

-- 3. Show the total number of prizes awarded for Physics.
SELECT COUNT(subject)
FROM nobel
WHERE subject = 'physics';

-- 4. For each subject show the subject and the number of prizes.
SELECT subject, COUNT(subject)
FROM nobel
GROUP BY subject;

-- 5. For each subject show the first year that the prize was awarded.
SELECT subject, MIN(yr)
FROM nobel
GROUP BY subject;

-- 6. For each subject show the number of prizes awarded in the year 2000.
SELECT subject, count(subject)
FROM nobel
WHERE yr = 2000
GROUP BY subject;

-- 7. Show the number of different winners for each subject.
SELECT subject, COUNT(DISTINCT winner)
FROM nobel
GROUP BY subject;

-- 8. 