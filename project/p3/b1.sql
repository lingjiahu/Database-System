-- a mother M1 has had at least two pregnancies

CONNECT TO cs421;

WITH allcouples(cid) AS (
    SELECT c.cid
    FROM couples c
    WHERE c.mramq = 'YANC01060003'
)
SELECT p.cid, p.birthym
FROM pregnancies p JOIN allcouples ac ON p.cid = ac.cid
;
