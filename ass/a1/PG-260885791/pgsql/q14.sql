-- List the title, release date and average rating of all movies
-- with at the least two reviews.
-- Name the average rating column avgrating.
-- Order the output such that the movies with the highest average ratings are at the top.
-- If two movies have the same average rating, then order them further by their release dates and then by titles.

WITH mreview(mid, avgrating) AS
         (
             SELECT m1.movid, AVG(r.rating)
             FROM movies m1
                      JOIN review r on m1.movid = r.movid
             GROUP BY m1.movid
             HAVING count(*) >= 2
         )
SELECT M.title, M.releasedate, MR.avgrating
FROM movies M JOIN mreview MR ON M.movid = MR.mid
ORDER BY MR.avgrating DESC, M.releasedate, M.title
;
