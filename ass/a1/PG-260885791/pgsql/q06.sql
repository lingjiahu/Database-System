-- List the title and release date of movies
-- that were produced in French but not in English.
-- The output should be ordered by the release date and then by the title.

SELECT M.title, M.releasedate
FROM Movies M JOIN releaselanguages L ON M.movid = L.movid AND L.language = 'French'
EXCEPT
SELECT M.title, M.releasedate
FROM Movies M JOIN releaselanguages L ON M.movid = L.movid AND L.language = 'English'
ORDER BY releasedate, title
;

