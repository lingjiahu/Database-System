-- List the title of the movie and the number of reviews
-- for the latest (release date) movie (There could possibly be more than one movie that qualifies).
-- Movies with no reviews yet should not be ignored in the output.
-- Name the number of reviews as numreviews.
-- Order the output based on the title of the movie.

WITH numreview(mid, numreviews) AS
         (
             SELECT m1.movid, count(*) AS numreviews
             FROM movies m1
                      JOIN review r1 on m1.movid = r1.movid
             GROUP BY m1.movid
             UNION
             SELECT m2.movid, 0 AS numreviews
             FROM movies m2
             WHERE m2.movid NOT IN (SELECT r2.movid
                                    FROM review r2)
         )
SELECT M.title, NR.numreviews AS numreviews
FROM movies M
         JOIN numreview NR ON M.movid = NR.mid AND M.releasedate = (SELECT MAX(m3.releasedate)
                                                                    FROM movies m3)
ORDER BY M.title
;