-- list the health care card, name and phone number of the mothers
-- who is currently pregnant and have not yet given birth and is under the care of a midwife employed by Lac- Saint-Louis.
-- you can assume that there is only one facility by that name

WITH curpregs(cid, birthym) AS
         (SELECT P.CID, P.BIRTHYM
          FROM Pregnancies P
                   JOIN MIDWIVES MW ON P.PPID = MW.PID AND MW.HCID = 'Lac- Saint-Louis' AND
                                       NOT EXISTS(SELECT B.bid
                                                  FROM Babies B
                                                  WHERE B.BDOB IS NULL)
         ),
     curcouple(mramq) AS ( SELECT C.MRAMQ
         FROM Couples C JOIN curpregs cp ON C.CID = cp.cid)
SELECT M.mramq, M.mname, M.mtel
FROM MOTHERS M JOIN curcouple cc ON M.MRAMQ = cc.mramq
;