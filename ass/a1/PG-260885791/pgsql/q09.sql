-- Find the number of Comedy movies
-- that was released in the year 2021.
-- Name the output column nummovies.

SELECT count(*) nummovies
FROM movies M
         JOIN moviegenres G ON M.movid = G.movid AND G.genre = 'Comedy' AND EXTRACT(year from releasedate) = 2021
;

