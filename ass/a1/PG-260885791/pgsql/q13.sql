-- List the title and release date of all movies
-- with the maximum number (count) of reviews.
-- Order the output by release date and then by title.

SELECT M.title, M.releasedate, COUNT(*)
FROM movies M
         JOIN review r on M.movid = r.movid
GROUP BY M.title, M.releasedate
HAVING COUNT(*) = (SELECT MAX(T.c)
                   FROM (SELECT M1.movid, count(*) c
                         FROM movies M1
                                  JOIN review R1 ON M1.movid = R1.movid
                         GROUP BY M1.movid, M1.title, M1.releasedate) T
)
ORDER BY M.releasedate, M.title
;
