-- list movies (titles) and release dates of movies released in the year 2021
-- that falls into both the genres Comedy and Sci-Fi (i.e., a movie should be part of both the genres and not just one)
-- Order the ouput by release date and then by titles.

SELECT M.title, M.releasedate
FROM Movies M JOIN Moviegenres G ON M.movid = G.movid
WHERE G.genre = 'Comedy'
INTERSECT
SELECT M.title, M.releasedate
FROM Movies M JOIN Moviegenres G ON M.movid = G.movid
WHERE G.genre = 'Sci-Fi'
;

-- SELECT * FROM moviegenres WHERE genre = 'Comedy' OR genre = 'Sci-Fi';