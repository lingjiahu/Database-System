-- list the health care card, name of mothers
-- who have had more than one baby in a single pregnancy.
-- List them only once even if they had multiple pregnancies where they had more than one baby.
-- Count the babies whether they are born or not (yet).

WITH prgbaby(cid, birthmy, bid) AS
         (
             SELECT p.cid, p.birthym, b.bid
             FROM pregnancies p
                      JOIN babies b ON p.cid = b.cid AND p.birthym = b.birthym
         ),
     multiprg(cid) AS
             (SELECT pb.cid
                 FROM prgbaby pb
                 GROUP BY pb.cid
                 HAVING COUNT(*) > 1)
SELECT m.mramq, m.mname
FROM mothers m
         JOIN multiprg mp ON mp.cid IN (SELECT c.mramq
                                        FROM couples c
                                        WHERE c.cid = mp.cid)
;