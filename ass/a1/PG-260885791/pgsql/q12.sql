-- List the title, release date and number of reviews
-- of all movies released in 2021.
-- If a movie has no reviews, it should be shown as 0.
-- Name the column with the number of reviews as numreviews.
-- Order the output such that the movies with most reviews are on the top.
-- For movies with same number of reviews, order by their release dates and then by titles.

SELECT M.title, M.releasedate, COUNT(*) numreviews
FROM movies M JOIN review R ON M.movid = R.movid AND EXTRACT(year from releasedate) = 2021
GROUP BY M.title, M.releasedate, M.title
ORDER BY numreviews DESC, M.releasedate, M.title
;