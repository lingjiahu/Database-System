-- list the health care card, name and phone number of the mothers
-- who is currently pregnant and have not yet given birth and is under the care of a midwife employed by Lac- Saint-Louis.
-- you can assume that there is only one facility by that name

WITH curpregs(cid, birthym) AS
         (SELECT p.cid, p.birthym
          FROM pregnancies p
                   JOIN midwives mw ON p.ppid = mw.pid AND mw.hcid = 'Lac- Saint-Louis' AND
                                       NOT EXISTS(SELECT b.bid
                                                  FROM babies b
                                                  WHERE b.cid = p.cid
                                                    AND b.birthym = p.birthym
                                                    AND b.bdob IS NULL)
         ),
     curcouple(mramq) AS (SELECT c.mramq
                          FROM couples c
                                   JOIN curpregs cp ON c.cid = cp.cid)
SELECT m.mramq, m.mname, m.mtel
FROM mothers m
         JOIN curcouple cc ON m.mramq = cc.mramq
;