-- Find the movies that fell out of popularity.
-- List the title and release date of all the movies
-- that had an average rating of 7 or above before 2019
-- and an average rating of 5 or lower starting 2019
-- (be careful to take into account movies with no reviews in the later period as 0 rating).
-- Order the output by their release date and then by title.

WITH avgreviewsbefore(mid, avgrating) AS
         (SELECT r1.movid, AVG(r1.rating)
          FROM review r1
          WHERE EXTRACT(year from r1.reviewdate) < 2019
          GROUP BY r1.movid
         ),
     avgreviewsafter(mid, avgrating) AS
         (SELECT r2.movid, AVG(r2.rating)
          FROM review r2
          WHERE EXTRACT(year from r2.reviewdate) >= 2019
          GROUP BY r2.movid
          UNION
          SELECT m1.movid, 0 -- the movie has no review since 2019
          FROM movies m1
          WHERE m1.movid NOT IN (SELECT r3.movid
                                 FROM review r3
                                 WHERE EXTRACT(year from r3.reviewdate) >= 2019))
SELECT m2.title, m2.releasedate
FROM movies m2
         JOIN avgreviewsbefore ab ON m2.movid = ab.mid AND ab.avgrating >= 7
INTERSECT
SELECT m3.title, m3.releasedate
FROM movies m3
         JOIN avgreviewsafter af ON m3.movid = af.mid AND af.avgrating <= 5
ORDER BY releasedate, title
;