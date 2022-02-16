-- list movies (titles) and release dates of movies
-- released in the year 2021
-- that falls into both the genres Comedy and Sci-Fi (i.e., a movie should be part of both the genres and not just one)
-- Order the ouput by release date and then by titles.

SELECT M1.title, M1.releasedate
FROM Movies M1
         JOIN Moviegenres G1 ON M1.movid = G1.movid AND EXTRACT(year from M1.releasedate) = 2021 AND G1.genre = 'Comedy'
INTERSECT
SELECT M2.title, M2.releasedate
FROM Movies M2
         JOIN Moviegenres G2 ON M2.movid = G2.movid AND EXTRACT(year from M2.releasedate) = 2021 AND G2.genre = 'Sci-Fi'
ORDER BY releasedate, title
;