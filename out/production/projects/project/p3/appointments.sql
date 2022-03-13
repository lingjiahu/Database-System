-- list all appointments associated with input midwife at input date
WITH motherinfo(mname, mramq, cid) AS (
    SELECT m.mname, m.mramq, c.cid
    FROM mothers m join COUPLES c ON m.mramq = c.mramq
),
     mwrole(cid, birthym, role) AS (
         SELECT cid, birthym, 'P' AS role
         FROM Pregnancies p1 WHERE p1.ppid = 4001
     UNION
         SELECT cid, birthym, 'B' AS role
         FROM Pregnancies p2 WHERE p2.bpid = 4001
     )

SELECT
    apptime, r.role, mi.mname, mi.mramq
FROM appointments a JOIN motherinfo mi ON a.cid = mi.cid
JOIN mwrole r ON a.cid = r.cid AND a.birthym = r.birthym
WHERE pid = 4001 AND apptdate = '2022-03-24'
;