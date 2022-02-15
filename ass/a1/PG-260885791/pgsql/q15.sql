-- List the title of the movie and the number of reviews
-- for the latest (release date) movie (There could possibly be more than one movie that qualifies).
-- Movies with no reviews yet should not be ignored in the output.
-- Name the number of reviews as numreviews.
-- Order the output based on the title of the movie.

WITH numreview(mid, num) AS
         (
             SELECT m1.movid, count(*) AS numreviews
             FROM movies m1
                      JOIN review r1 on m1.movid = r1.movid
             GROUP BY m1.movid
             UNION
             SELECT m2.movid, 0 AS numreviews
             FROM movies m2
             WHERE m2.movid NOT IN (SELECT m3.movid
                                    FROM movies m3
                                             JOIN review r3 on m3.movid = r3.movid
                                    GROUP BY m3.movid)
         )
SELECT M.title, NR.num AS numreviews
FROM movies M
         JOIN numreview NR ON M.movid = NR.mid
WHERE M.releasedate = (SELECT MAX(M4.releasedate)
                       FROM movies m4
)
ORDER BY M.title
;