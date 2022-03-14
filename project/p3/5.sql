-- produce the number of births for each month (only count babies born)
-- Should have at least three months worth of data and each month should have more than 5 births
-- it's okay to only include the months with data #561

SELECT SUBSTR(b.bdob, 1, 7) AS yearmonth, COUNT(*) AS numbirths
FROM babies b
WHERE b.bdob IS NOT NULL
GROUP BY SUBSTR(b.bdob, 1, 7)
;