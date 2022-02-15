-- List the name and email address of all the users
-- who have written a review for a movie that was released ONLY in French
-- (they are free to write reviews for any other movies).
-- Order the output by the email.


WITH fr(mid) AS
         (
             SELECT M.movid
             FROM movies M
                      JOIN releaselanguages rl on M.movid = rl.movid AND rl.language = 'French' AND M.movid NOT IN
                          (SELECT M1.movid
                              FROM movies M1
                                       JOIN releaselanguages rl
                                            on M1.movid = rl.movid AND NOT rl.language = 'French')
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

-- TODO check this and all later ones with data

