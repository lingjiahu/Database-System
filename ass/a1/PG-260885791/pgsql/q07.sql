-- List the title, release date and language(s) of all the movies
-- that were released in French or Italian (it may also have releases in other languages but should have been released in at least one of these languages).
-- The output should be ordered by release date and then by title.
-- If a movie is released in both French and Italian then it should be listed only once in the output
-- as a single output in the form French,Italian (specifically in that alphabetical order of languages and comma separated,
-- but no spaces between the values).
-- DO NOT output it as Italian,French Do not include other languages in the output listing (only the above two).
-- Name this ouput column languages.

-- A sample output format is shown below.
-- title | releasedate | languages
-- ----------------------+-------------+----------------
-- Movie1 | 1946-01-16 | French,Italian
-- Movie3 | 1967-02-23 | Italian
-- Movie2 | 1975-05-10 | French
-- Movie4 | 2011-03-13 | French,Italian

WITH bilingual(mid) AS
         (
             SELECT M.movid
             FROM Movies M
                      JOIN Releaselanguages LF ON M.movid = LF.movid AND LF.language = 'French'
             INTERSECT
             SELECT M.movid
             FROM Movies M
                      JOIN Releaselanguages LI ON M.movid = LI.movid AND LI.language = 'Italian'
         ),
     uni(mid, language) AS (
         SELECT M.movid, LF.language
         FROM Movies M
                  JOIN Releaselanguages LF ON M.movid = LF.movid AND LF.language = 'French'
             AND M.movid NOT IN
                 (SELECT B.mid FROM bilingual B)
         UNION
         SELECT M.movid, LI.language
         FROM Movies M
                  JOIN Releaselanguages LI ON M.movid = LI.movid
             AND LI.language = 'Italian'
             AND M.movid NOT IN
                 (SELECT B.mid FROM bilingual B)
     )
SELECT M.title, M.releasedate, U.language
FROM Movies M,
     uni U
WHERE M.movid = U.mid
UNION
SELECT M.title, M.releasedate, (RL1.language || ',' || RL2.language)
FROM Movies M
         JOIN releaselanguages RL1 ON M.movid = RL1.movid AND RL1.language = 'French'
         JOIN releaselanguages RL2 ON M.movid = RL2.movid AND RL2.language = 'Italian'
ORDER BY releasedate, title
;
