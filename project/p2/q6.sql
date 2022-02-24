-- Create a view midwifeinfo that shows the practitioner id, name, phone and email of all the midwives,
-- the name of the clinic / birthing center that employs them, and the address of the facility.

CREATE VIEW midwifeinfo(pid, mwname, mwtel, mwemail, hcname, hcaddress)
AS
SELECT mw.pid, mw.mwname, mwtel, mwemail, hc.hcname, hc.hcaddress
FROM midwives mw
         JOIN hcinstitutions hc on mw.hcid = hc.hcid
;

-- selects everything from the view, truncated to just 5 records
SELECT * FROM midwifeinfo LIMIT 5;

-- limits the previous output to only the midwives working at the facility whose name is Lac-Saint-Louis
-- You can assume there is only one facility with that name.
-- Truncate the output to just 5 records.
SELECT * FROM midwifeinfo WHERE hcname = 'Lac-Saint-Louis' LIMIT 5;


INSERT INTO midwifeinfo
VALUES ('4015', 'Nanda Suqqo', '5140000015', 'ns@gmail.com', 'hcnew', '2538 47th Avenue')
;