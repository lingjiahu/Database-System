-- List the name and email address of all the users
-- who have written a review for a movie that was released ONLY in French
-- (they are free to write reviews for any other movies).
-- Order the output by the email.

WITH fr(mid) AS
         (
             SELECT M.movid
             FROM movies M
                      JOIN releaselanguages rl on M.movid = rl.movid AND rl.language = 'French' AND M.movid NOT IN
                          (SELECT rl1.movid -- select movie if released in !french
                                       FROM releaselanguages rl1
                                            WHERE M.movid = rl1.movid AND NOT rl1.language = 'French')
         ),
     id(uid) AS
         (
             SELECT R.userid
             FROM fr JOIN review R on fr.mid = R.movid
         )
SELECT DISTINCT U.uname, U.email
FROM users U JOIN id ON U.userid = id.uid
ORDER BY U.email
;
