-- Find the number of movies
-- Comedy & released in the year 2021.
-- Name the output column nummovies.

SELECT count(*) AS nummovies
FROM movies M
         JOIN moviegenres G ON M.movid = G.movid AND G.genre = 'Comedy' AND EXTRACT(year from releasedate) = 2021
;