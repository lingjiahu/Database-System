-- Find the genre that is most liked by cinebuff@movieinfo.com (email).
-- In order to find this, start by computing the average rating this user has given to movies of different genres.
-- Keep in mind that a movie may fall into multiple genres and therefore its rating would contribute to all of those genres.
-- You may also end up with a situation where more than one genre might have the same highest average rating.
-- In such cases, order the output by the genre.
-- You can assume that this user has made some movie reviews.

WITH ureviews(mid, rate) AS -- all reviews from cinebuff
         (SELECT r1.movid, r1.rating
          FROM review r1
          WHERE r1.userid IN (SELECT U.userid FROM users U WHERE U.email = 'cinebuff@movieinfo.com')
         ),
     genreratings(genre, rate) AS   -- avg rating by genre from cinebuff
         (
             SELECT g1.genre, AVG(UR.rate)
             FROM moviegenres g1
                      JOIN ureviews UR ON g1.movid = UR.mid
             GROUP BY g1.genre
         )
SELECT GR.genre
FROM genreratings GR
WHERE GR.rate = (SELECT MAX(gr1.rate)
                 FROM genreratings gr1)
ORDER BY GR.genre
;