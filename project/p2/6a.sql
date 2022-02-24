-- Create a view midwifeinfo that shows the practitioner id, name, phone and email of all the midwives,
-- the name of the clinic / birthing center that employs them, and the address of the facility.

CREATE VIEW midwifeinfo(pid, mwname, mwtel, mwemail, hcname, hcaddress)
AS
SELECT mw.pid, mw.mwname, mwtel, mwemail, hc.hcname, hc.hcaddress
FROM midwives mw
         JOIN hcinstitutions hc on mw.hcid = hc.hcid
;
