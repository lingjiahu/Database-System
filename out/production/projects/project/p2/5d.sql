-- list the health care card, name and phone number of the mothers
-- who is currently pregnant and have not yet given birth and is under the care of a midwife employed by Lac-Saint-Louis.
-- you can assume that there is only one facility by that name

-- all pregnancies in progress (no born baby) under the care of a midwife employed by Lac-Saint-Louis
WITH curpregs(cid) AS
(SELECT p.cid
FROM pregnancies p
JOIN midwives mw ON p.ppid = mw.pid
AND mw.hcid IN (SELECT hc.hcid
FROM hcinstitutions hc
WHERE hc.hcname = 'Lac-Saint-Louis')
AND NOT EXISTS(SELECT b.bid
FROM babies b
WHERE b.cid = p.cid
AND b.birthym = p.birthym
AND b.bdob IS NOT NULL)),
-- all couples with pregnancies in progress
curcouple(mramq) AS
(SELECT c.mramq
FROM couples c
JOIN curpregs cp ON c.cid = cp.cid)
SELECT m.mramq, m.mname, m.mtel
FROM mothers m
JOIN curcouple cc ON m.mramq = cc.mramq
;