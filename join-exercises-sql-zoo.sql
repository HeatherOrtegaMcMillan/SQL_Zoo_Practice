-- ~~~ Join Exercises from SQL Zoo~~~ -- 

-- 1.List the films where the yr is 1962 [Show id, title]

SELECT id, title
FROM movie
WHERE yr=1962;

-- 2. Give year of 'Citizen Kane'.
SELECT yr
FROM movie
WHERE title LIKE '%citizen kane';

-- 3. List all of the Star Trek movies, include the id, title and yr 
-- (all of these movies include the words Star Trek in the title). 
-- Order results by year.
SELECT 
id,
title,
yr
FROM movie
WHERE title LIKE '%star trek%';

-- 4. What id number does the actor 'Glenn Close' have?
SELECT id
FROM actor
WHERE name LIKE 'glenn close';

-- 5. What is the id of the film 'Casablanca';
SELECT id
FROM movie
WHERE title LIKE 'casablanca';

-- 6. Obtain the cast list for 'Casablanca'. what is a cast list? Use movie ID(or whatever value you got from the previous question)

SELECT 
a.name
FROM casting AS c
JOIN actor AS a on a.id = c.actorid
WHERE c.movieid = 27;

-- 7. Obtain the cast list for the film 'Alien'

SELECT 
a.name
FROM casting AS c
JOIN actor as a ON a.id = c.actorid
JOIN movie as m ON m.id = c.movieid
WHERE m.title = 'Alien';

-- 8. List the films in which 'Harrison Ford' has appeared
SELECT
m.title
FROM casting as c
JOIN actor as a on a.id = c.actorid
JOIN movie as m on m.id = c.movieid
WHERE a.name = 'Harrison Ford';

-- 9. List the films where 'Harrison Ford' has appeared - but not in the starring role. 
-- [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
SELECT 
m.title
FROM casting as c
JOIN actor as a on a.id = c.actorid
JOIN movie as m on m.id = c.movieid
WHERE ord != 1 AND a.name = 'Harrison Ford';

-- 10. List the films together with the leading star for all 1962 films.
SELECT 
m.title,
a.name
FROM casting as c
JOIN actor as a on a.id = c.actorid
JOIN movie as m on m.id = c.movieid
WHERE ord = 1 AND m.yr = '1962';

-- 11. Which were the busiest years for 'Rock Hudson', 
-- show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1;

-- 12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.

SELECT 
m.title,
a.name
FROM casting as c
JOIN actor as a ON a.id = c.actorid
JOIN movie as m on m.id = c.movieid
WHERE c.ord  = 1 AND c.movieid IN (
    SELECT c.movieid FROM casting as c
    JOIN actor AS a ON a.id = c.actorid ​
   ​WHERE a.name = 'Julie Andrews');

-- 13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
-- WORKING ON
SELECT a.name
FROM casting as c
JOIN actor as a ON a.id = c.actorid
WHERE ord = 1
GROUP BY a.name
HAVING COUNT(c.ord) >= 15;

-- 14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT m.title, COUNT(c.actorid)
FROM casting as c
JOIN movie as m ON m.id = c.movieid
WHERE m.yr = 1978
GROUP BY m.title
ORDER BY COUNT(c.actorid) DESC, m.title;

-- 15. List all the people who have worked with 'Art Garfunkel'.
SELECT a.name
FROM casting as c
JOIN actor as a ON a.id = c.actorid
WHERE c.movieid IN
      (SELECT c.movieid
      FROM casting as c
      JOIN actor as a ON a.id = c.actorid
      WHERE a.name = 'Art Garfunkel')
  AND a.name NOT LIKE 'Art Garfunkel';