-- list the results (lab work date and the result) of all the blood iron tests
-- that was performed on (Mother) Victoria Gutierrez for her second pregnancy.
-- the second pregnancy for the couple assuming she is involved in only 1 couple (ed post #461)
-- (the latter you can assume as a simple VARCHAR field with some text info
-- keep it a small field so your screen does not get cluttered)


-- couple id of VG
-- all appointments for the pregnancy
-- all bi tests associated with the appointments

WITH prg(cid, birthym) AS (
    SELECT p.cid, p.birthym
    FROM pregnancies p
    WHERE p.cid IN (SELECT c.cid
                    FROM couples c
                    WHERE c.mramq IN (SELECT m.mramq
                                      FROM mothers m
                                      WHERE m.mname = 'Victoria Gutierrez'))
),
     aptpreg(aid) AS (SELECT a.aid
                      FROM appointments a
                               JOIN prg
                                    ON a.cid = prg.cid AND a.birthym IN (SELECT MAX(prg.birthym) FROM prg GROUP BY cid))
select t.examdate AS date, t.result
FROM tests t
;