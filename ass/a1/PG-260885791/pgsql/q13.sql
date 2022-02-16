-- List the title and release date of all movies
-- with the maximum number (count) of reviews.
-- Order the output by release date and then by title.

SELECT M.title, M.releasedate
FROM movies M
         JOIN review r on M.movid = r.movid
GROUP BY M.title, M.releasedate
HAVING COUNT(*) = (SELECT MAX(T.c)
                   FROM (SELECT count(*) c
                         FROM review R1
                         GROUP BY R1.movid) T
)
ORDER BY M.releasedate, M.title
;
