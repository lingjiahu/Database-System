-- This query is a simple attempt of a recommendation system.
-- List the title and release date of movies, their average ratings
-- for Comedy movies not reviewed by cinebuff@movieinfo.com (email)
-- such that the average rating of each movie is the same or higher than
-- the average rating given by cinebuff@movieinfo.com across all Comedy movies.
-- Name the average rating column avgrating.
-- Order the output such that the movies with a higher average rating is at the top.
-- For movies with same average rating, order them by the release date and then by the title.
-- You can assume that there will be some Comedy movies reviewed by this user in the database.

WITH cinebuff(uid, avgrating) AS
         (SELECT u1.userid, AVG(r1.rating) AS avgrating
          FROM users u1
                   JOIN review r1 on u1.userid = r1.userid AND u1.email = 'cinebuff@movieinfo.com' AND
                                     r1.movid IN (SELECT g1.movid
                                                  FROM moviegenres g1
                                                  WHERE g1.genre = 'Comedy')
          GROUP BY u1.userid),
     avgratings(mid, avgrating) AS
         (SELECT r2.movid, AVG(r2.rating) AS avgrating
          FROM review r2
          WHERE r2.movid IN
                (
                    SELECT g2.movid -- comedy
                    FROM moviegenres g2
                    WHERE g2.genre = 'Comedy'
                        EXCEPT -- less
                    SELECT r3.movid -- reviewed by cinebuff
                    FROM review r3
                    WHERE r3.userid IN (SELECT cinebuff.uid FROM cinebuff)
                )
          GROUP BY r2.movid
          HAVING AVG(r2.rating) >= (SELECT cinebuff.avgrating FROM cinebuff)
         )
SELECT M.title, M.releasedate, AR.avgrating AS avgrating
FROM movies M
         JOIN avgratings AR ON M.movid = AR.mid
ORDER BY AR.avgrating DESC, M.releasedate, M.title
;
