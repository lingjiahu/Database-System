-- list the results (lab work date and the result) of all the blood iron tests
-- that was performed on (Mother) Victoria Gutierrez for her second pregnancy.
-- the second pregnancy for the couple assuming she is involved in only 1 couple (ed post #461)
-- (the latter you can assume as a simple VARCHAR field with some text info
-- keep it a small field so your screen does not get cluttered)


-- couple id of VG
-- all appointments for the pregnancy
-- all bi tests associated with the appointments
--
WITH prg(cid, birthym) AS (
    SELECT p.cid, p.birthym
    FROM pregnancies p
    WHERE p.cid IN (SELECT c.cid
                    FROM couples c
                    WHERE c.mramq IN (SELECT m.mramq
                                      FROM mothers m
                                      WHERE m.mname = 'Victoria Gutierrez')
                    ORDER BY p.birthym
    )
    LIMIT 1 OFFSET 1
),
     aptpreg(aid) AS
         (SELECT a.aid
          FROM appointments a

                   JOIN prg
                        ON a.cid = prg.cid
         ),
     bitest(tid) AS
             (SELECT t1.tid
                 FROM tests t1 JOIN aptpreg ap ON t1.aid = ap.aid AND t1.type = 'blood iron' AND t1.examdate IS NOT NULL)
SELECT t.examdate AS date, t.result
FROM tests t
         JOIN bitest bi ON t.tid = bi.tid
;