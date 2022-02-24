-- list the names of each birthing center/community clinic as well as the number of pregnancies
-- that are due for the month of July this year (2022).
-- For this purpose you will count a pregnancy towards a facility
-- if the primary midwife is from that facility (and not based on the final birthing location).
-- You should also use the “final agreed up on” due date if that is present,
-- in order to figure out if the pregnancy will fall into a specific month.
-- Otherwise (if that information is not yet available), use the expected time frame for birth (year-month) that was provided initially.

WITH allprg(ppid, duedate) AS -- all pregnancies
         (
             SELECT p1.ppid, p1.finalexp
             FROM pregnancies p1
             WHERE p1.finalexp IS NOT NULL
             UNION
             SELECT p2.ppid, p2.birthym
             FROM pregnancies p2
             WHERE p2.finalexp IS NULL
         ),
     allhc(hcid, hcname, duedate) AS -- all related health care institutions for July 2022
         (SELECT hc.hcid, hc.hcname, ap.duedate
          FROM hcinstitutions hc
                   JOIN allprg ap ON hc.hcid IN (SELECT mw.hcid
                                                 FROM midwives mw
                                                 WHERE mw.pid = ap.ppid) AND
                                     EXTRACT(YEAR FROM ap.duedate) = 2022 AND EXTRACT(MONTH FROM ap.duedate) = 07)
SELECT allhc.hcname, COUNT(*) AS numpregnancies
FROM allhc
GROUP BY allhc.hcid, allhc.hcname
;