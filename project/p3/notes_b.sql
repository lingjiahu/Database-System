-- all the notes associated with M, include couple information, pregnancy number, etc., as relevant in your model.
-- The actual note text may be truncated to first 50 characters or so to reduce clutter.
-- couple info: couple id, mother id, and father id (if available)

WITH coupleinf(cid,mramq, fid, birthym, aid) AS (
    SELECT c.cid, c.mramq, c.fid, a.birthym, a.aid
    FROM couples c JOIN appointments a ON c.cid = a.cid  AND c.mramq = 'YANC01060003'
)
SELECT n.nid, n.notedate, n.notetime, n.notemsg, ci.cid, ci.birthym, ci.mramq, ci.fid
FROM notes n JOIN coupleinf ci ON n.aid = ci.aid
;