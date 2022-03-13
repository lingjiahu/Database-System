-- list user id of all the users
-- who have reviewed the movie (title) Casablanca
-- ordered by the user id
-- You may assume that there is only one movie with this title.

WITH id(cid) AS
(
    SELECT movid
    FROM movies
    WHERE title = 'Casablanca'
)
SELECT R.userid
FROM Review R, id
WHERE R.movid = id.cid
ORDER BY userid
;