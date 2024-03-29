-- list all the appointments (date and time of the appointment, the health care card, name and phone number of the mother)
-- for the midwife Marion Girard for the week March 21 - March 25 of this year (2022).
-- You can assume that there is only one midwife with this particular name.
CONNECT TO cs421;

-- all appointments with Marion Girard for March 21-25 in 2022
WITH aptpreg(aid, cid, birthym) AS
(SELECT a1.aid, p.cid, p.birthym
FROM pregnancies p
JOIN appointments a1 ON p.cid = a1.cid AND p.birthym = a1.birthym AND
a1.pid IN (SELECT mw.pid
FROM midwives mw
WHERE mw.mwname = 'Marion Girard')
AND EXTRACT(YEAR FROM a1.apptdate) = 2022 AND EXTRACT(MONTH FROM a1.apptdate) = 03
AND EXTRACT(DAY FROM a1.apptdate) >= 21 AND EXTRACT(DAY FROM a1.apptdate) <= 25),
-- all couples involved with the appointments
aptcouple(aid, mramq) AS
(SELECT ap.aid, c.mramq
FROM couples c
JOIN aptpreg ap ON c.cid = ap.cid),
-- all mothers involved with the appointments
aptmother(aid, mramq, manme, mtel) AS
(SELECT ac.aid, m.mramq, m.mname, m.mtel
FROM mothers m
JOIN aptcouple ac ON m.mramq = ac.mramq)
SELECT a.apptdate AS date, a.apptime AS time, am.mramq, am.manme AS name, am.mtel AS phone
FROM appointments a
JOIN aptmother am ON a.aid = am.aid
;