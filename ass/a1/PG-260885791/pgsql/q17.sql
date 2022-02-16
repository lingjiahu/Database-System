-- List the email of all the other users
-- who have reviewed at least one movie
-- that was reviewed by cinebuff@movieinfo.com (email) and gave a similar review.
-- You can consider two reviews to be similar if their ratings differ only by a maximum value of 1.
-- Order the output by email.

WITH cinebuff(uid, mid, rate) AS
         (SELECT u1.userid, r1.movid, r1.rating
          FROM users u1
                   JOIN review r1 on u1.userid = r1.userid AND u1.email = 'cinebuff@movieinfo.com'),
     similarreviews(uid) AS
         (
             SELECT r2.userid
             FROM review r2
                      JOIN cinebuff c1 ON r2.movid = c1.mid
                 AND (NOT r2.userid = c1.uid)
                 AND (r2.rating >= (c1.rate - 1) AND r2.rating <= (c1.rate + 1))
         )
SELECT DISTINCT U.email
FROM users U
         JOIN similarreviews S ON U.userid = S.uid
ORDER BY U.email
;