-- list all the tests relevant for this pregnancy (but only the tests relevant for the mother)
-- in the descending order of date (test prescription), the output should be date (test prescription),
-- test type and no more than the first 50 characters of each result(s).
-- （put square brackets in output display to separate from the type of test and the text for results)
-- If a result is not yet available, display the text PENDING in it’s place.

WITH appts(aid) AS
         (
             SELECT a.aid
             FROM appointments a JOIN pregnancies p ON a.cid = p.cid AND a.birthym = p.birthym AND p.cid = 2003 AND p.birthym = '2022-05-02'
         )
SELECT t.pscrpdate, t.type, SUBSTR(t.result, 1, 50) result
FROM tests t JOIN appts ON t.aid = appts.aid AND t.mramq IS NOT NULL
ORDER BY t.pscrpdate
;

INSERT INTO NOTES VALUES (9007, 7002, '2022-03-13', '19:59:47', 'good')