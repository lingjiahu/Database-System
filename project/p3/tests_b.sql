-- all the tests associated with M, include couple information, pregnancy number, etc., as relevant in your model.
-- The result attribute of the test maybe truncated
-- to the first 50 characters or so.

WITH coupleinf(cid,mramq, fid, birthym, aid) AS (
    SELECT c.cid, c.mramq, c.fid, a.birthym, a.aid
    FROM couples c JOIN appointments a ON c.cid = a.cid  AND c.mramq = 'YANC01060003'
)
SELECT t.tid, t.type, t.pscrpdate, t.testdate, t.examdate, t.result, ci.cid, ci.birthym, ci.mramq, ci.fid
FROM tests t JOIN coupleinf ci ON t.aid = ci.aid
;