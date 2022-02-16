-- This query is a simple attempt of a recommendation system.
-- List the title and release date of movies, their average ratings
-- for Comedy movies not reviewed by cinebuff@movieinfo.com (email)
-- such that the average rating of each movie is the same or higher than
-- the average rating given by cinebuff@movieinfo.com across all Comedy movies.
-- Name the average rating column avgrating.
-- Order the output such that the movies with a higher average rating is at the top.
-- For movies with same average rating, order them by the release date and then by the title.
-- You can assume that there will be some Comedy movies reviewed by this user in the database.

WITH cinebuff(uid, avg) AS
         (SELECT u1.userid, AVG(r1.rating)
          FROM users u1
                   JOIN review r1 on u1.userid = r1.userid AND u1.email = 'cinebuff@movieinfo.com' AND
                                     r1.movid IN (SELECT m1.movid
                                                  FROM movies m1
                                                           JOIN moviegenres g1 ON m1.movid = g1.movid AND g1.genre = 'Comedy')
          GROUP BY u1.userid),
     avgratings(mid, avg) AS
         (SELECT m2.movid, AVG(r2.rating) AS avgrating
          FROM movies m2
                   JOIN review r2 on m2.movid = r2.movid AND m2.movid IN
                                     (
                                         SELECT m3.movid -- comedy
                                         FROM movies m3 JOIN moviegenres g2 ON m3.movid = g2.movid AND g2.genre = 'Comedy'
                                         EXCEPT -- not reviewed by cinebuff
                                         SELECT m4.movid
                                         FROM movies m4 JOIN review r2 ON m4.movid = r2.movid AND r2.userid IN (SELECT cinebuff.uid FROM cinebuff)
                                         )
          GROUP BY m2.movid
          HAVING AVG(r2.rating) > (SELECT cinebuff.avg FROM cinebuff)
         )
SELECT M.title, M.releasedate, AR.avg AS avgrating
FROM movies M
         JOIN avgratings AR ON M.movid = AR.mid
ORDER BY AR.avg DESC, M.releasedate, M.title
;
