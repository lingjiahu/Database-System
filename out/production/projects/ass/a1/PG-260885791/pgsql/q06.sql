-- List the title and release date of movies
-- that were produced in French but not in English.
-- The output should be ordered by the release date and then by the title.

SELECT M1.title, M1.releasedate
FROM Movies M1 JOIN releaselanguages L1 ON M1.movid = L1.movid AND L1.language = 'French'
EXCEPT
SELECT M2.title, M2.releasedate
FROM Movies M2 JOIN releaselanguages L2 ON M2.movid = L2.movid AND L2.language = 'English'
ORDER BY releasedate, title
;

