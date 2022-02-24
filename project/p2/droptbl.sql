-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the drop table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been dropped (reverse of the creation order).

DROP TABLE mothers;
DROP TABLE fathers;
DROP TABLE couples;
DROP TABLE hcinstitutions;
DROP TABLE communityclinics;
DROP TABLE birthingcenters;
DROP TABLE pregnancies;
DROP TABLE invitations;
DROP TABLE midwives;
DROP TABLE infosessions;
DROP TABLE registrations;
DROP TABLE babies;
DROP TABLE appointments;
DROP TABLE notes;
DROP TABLE technicians;
DROP TABLE tests;
DROP VIEW midwifeinfo;
