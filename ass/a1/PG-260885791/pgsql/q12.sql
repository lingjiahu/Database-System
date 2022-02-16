-- List the title, release date and number of reviews
-- of all movies released in 2021.
-- If a movie has no reviews, it should be shown as 0.
-- Name the column with the number of reviews as numreviews.
-- Order the output such that the movies with most reviews are on the top.
-- For movies with same number of reviews, order by their release dates and then by titles.

WITH reviewcnt(mid, cnt) AS
    (
        SELECT r1.movid, COUNT(*)
        FROM review r1 JOIN movies m1 ON r1.movid = m1.movid AND EXTRACT(year from m1.releasedate) = 2021
        GROUP BY r1.movid
        UNION
        SELECT m2.movid, 0
        FROM movies m2
         WHERE EXTRACT(year from m2.releasedate) = 2021 AND m2.movid NOT IN (
             SELECT r2.movid
             FROM review r2
             )
    )
SELECT M.title, M.releasedate, RC.cnt
FROM movies M JOIN reviewcnt RC ON M.movid = RC.mid
ORDER BY RC.cnt DESC, M.releasedate, M.title
;