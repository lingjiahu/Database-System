-- List the title and release date of all the movies
-- that were released in both (and not just either) English and French and
-- also had 5 or more reviews.
-- Order the output by release date and then by title.
-- Whether the movies had been released in other languages are irrelevant.

WITH bilingural(mid) AS
         (SELECT M1.movid
          FROM Movies M1
                   JOIN Releaselanguages LF ON M1.movid = LF.movid AND LF.language = 'English'
          INTERSECT
          SELECT M2.movid
          FROM Movies M2
                   JOIN Releaselanguages LI ON M2.movid = LI.movid AND LI.language = 'French'),
     id(mid) AS
         (
             SELECT B.mid
             FROM bilingural B
                      JOIN review R ON B.mid = R.movid
             GROUP BY B.mid
             HAVING COUNT(*) >= 5
         )
SELECT M.title, M.releasedate
FROM movies M
         JOIN id ON M.movid = id.mid
ORDER BY M.releasedate, M.title
;