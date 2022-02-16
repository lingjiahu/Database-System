-- List all the movies (title), release date and the ratings
-- for the reviews done by the user whose email is talkiesdude@movieinfo.com.
-- The output should be ordered with the highest ratings on top.
-- If two movies have the same ratings, then they should be ordered by their release dates and then by titles (asc).

SELECT M.title, M.releasedate, R.rating
FROM Movies M JOIN Review R ON M.movid = R.movid AND R.userid IN (SELECT U.userid
FROM Users U
WHERE U.email = 'talkiesdude@movieinfo.com')
ORDER BY R.rating DESC, M.releasedate, M.title
;

