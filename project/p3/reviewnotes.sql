-- list all the notes relevant for this pregnancy in the descending order of date time,
-- even if they are not from the selected appointment
-- the output should be date-time and no more than the first 50 characters of each note(s).
-- e.g. 2022-02-13 10:02:45  Baby has good movements


-- get all appointments associated with the pregnancy
-- get all notes associated with the appointments
WITH appts(aid) AS
         (
             SELECT a.aid
             FROM appointments a JOIN pregnancies p ON a.cid = p.cid AND a.birthym = p.birthym
         )
SELECT n.notedate, n.notetime, n.notemsg
FROM notes n JOIN appts ON n.aid = appts.aid
;
