-- list movie id and title of all movies
-- released on or after the year 2021
-- ordered by the movie id.

SELECT movid, title
FROM Movies
WHERE EXTRACT(year from releasedate) >= 2021
ORDER BY movid
;