-- list all the tests relevant for this pregnancy (but only the tests relevant for the mother)
-- in the descending order of date (test prescription), the output should be date (test prescription),
-- test type and no more than the first 50 characters of each result(s).
-- （put square brackets in output display to separate from the type of test and the text for results)
-- If a result is not yet available, display the text PENDING in it’s place.


SELECT t.pscrpdate, t.type, t.result
FROM tests t
ORDER BY t.pscrpdate
;
