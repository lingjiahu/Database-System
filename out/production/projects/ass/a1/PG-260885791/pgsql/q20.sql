-- List all the languages and the genre
-- that has most movies for that language.
-- If two genres are equally the most popular for the language, produce two rows in the output (and so forth).
-- Order the output by languages and then by genre.

-- A sample format is given below:
-- language | genre
-- ----------+-----------
-- French | Drama
-- French | Sci-Fi
-- German | Drama
-- Greek | Action
-- Greek | Adventure

WITH langen(language, genre, cnt) AS
    (SELECT L.language, G.genre, count(*)
        FROM releaselanguages L JOIN moviegenres G ON L.movid = G.movid
        GROUP BY L.language, G.genre)
SELECT LG.language, LG.genre
FROM langen LG
WHERE LG.cnt = (SELECT MAX(lg2.cnt)
    FROM langen lg2 WHERE lg2.language = LG.language)
ORDER BY LG.language, LG.genre
;