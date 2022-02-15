-- Find the number of Comedy movies
-- that was released in the year 2021.
-- Name the output column nummovies.

SELECT count(*) nummovies
FROM review R JOIN movies m on R.movid = m.movid AND EXTRACT(year from releasedate) = 2021
JOIN moviegenres G ON R.movid = G.movid AND G.genre = 'Comedy'
;