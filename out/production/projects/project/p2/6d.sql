-- limits the previous output to only the midwives working at the facility whose name is Lac-Saint-Louis
-- You can assume there is only one facility with that name.
-- Truncate the output to just 5 records.
SELECT * FROM midwifeinfo WHERE hcname = 'Lac-Saint-Louis' LIMIT 5;
