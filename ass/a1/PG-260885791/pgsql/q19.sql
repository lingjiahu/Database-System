-- Find the movies that fell out of popularity.
-- List the title and release date of all the movies
-- that had an average rating of 7 or above before 2019
-- and an average rating of 5 or lower starting 2019
-- (be careful to take into account movies with no reviews in the later period as 0 rating).
-- Order the output by their release date and then by title.

WITH avgreviews(mid, avgrating) AS
    (SELECT r.movid, AVG(r.rating)
        FROM review r
        GROUP BY r.movid)
SELECT m1.title, m1.releasedate
FROM movies m1 JOIN avgreviews ar1 ON m1.movid = ar1.mid AND EXTRACT(year from m1.releasedate) < 2019 AND ar1.avgrating >= 7
INTERSECT
