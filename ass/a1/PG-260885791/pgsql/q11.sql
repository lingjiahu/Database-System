-- List the title and release date of all movies
-- with less than 2 reviews (make sure to take into account the movies with zero reviews).
-- Order the output by release date and then by title.

SELECT M.title, M.releasedate, M.movid
FROM movies M JOIN review R ON M.movid = R.movid
GROUP BY M.movid, M.title, M.releasedate
HAVING count(*) < 2
ORDER BY M.releasedate, M.title
;