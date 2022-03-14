-- a mother M1 has had at least two pregnancies

WITH allcouples(cid, mramq) AS (
    SELECT c.cid, c.mramq
    FROM couples c
    WHERE c.mramq = 'YANC01060003'
)
SELECT p.cid, p.birthym, ac.mramq
FROM pregnancies p JOIN allcouples ac ON p.cid = ac.cid
;
