/*
HOW TO CALCULATE MEDIAN IN SQL
Below is my practice for querying a median with comments explaining what's going on
*/
/* Set up a variable as -1*/
SET @rowindex := -1;

/* chose the average of the subqueried table rounded to 4th decimile place*/
SELECT
   ROUND(AVG(d.distance), 4) as Median 
/* Subquery that orders all the distances and gives an index to each row. So that theres 1 2 3 4 5 6 7 etc, connected to the distances in order*/
FROM
   (SELECT @rowindex:=@rowindex + 1 AS rowindex,
          my_table.row_name AS distance
    FROM my_table
    ORDER BY my_table.row_name) AS d
WHERE
/* Select the index that's right in the middle. The LAT that corresponds with that should be the median*/
d.rowindex IN (FLOOR(@rowindex / 2), CEIL(@rowindex / 2));