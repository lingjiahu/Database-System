-- List the user id of all the users
-- who gave a favourable review (rating 7 and above) for the 1959 version of the movie (title) Ben-Hur
-- but did not review or gave an unfavourable review (rating 4 and below) for the 2016 version of the movie
-- (except who gave a rating > 4)
-- The output should be ordered by the user id.

WITH id(bid, version) AS
         (
             SELECT movid, EXTRACT(year from releasedate)
             FROM movies
             WHERE title = 'Ben-Hur'
         )
SELECT R1.userid
FROM Review R1,
     id
WHERE R1.movid = id.bid
  AND id.version = 1959
  AND rating >= 7
    EXCEPT
SELECT R2.userid
FROM Review R2,
     id
WHERE R2.movid = id.bid
  AND id.version = 2016
  AND rating > 4
ORDER BY userid
;