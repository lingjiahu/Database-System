-- Include your drop table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
-- CONNECT TO cs421;

-- Remember to put the drop table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been dropped (reverse of the creation order).

DROP TABLE MOTHERS;
DROP TABLE FATHERS;
DROP TABLE COUPLES;
DROP TABLE HCINSTITUTIONS;
DROP TABLE COMMUNITYCLINICS;
DROP TABLE BIRTHINGCENTERS;
DROP TABLE PREGNANCIES;
DROP TABLE INVITATIONS;
DROP TABLE MIDWIVES;
DROP TABLE INFOSESSIONS;
DROP TABLE REGISTRATIONS;
DROP TABLE BABIES;
DROP TABLE APPOINTMENTS;
DROP TABLE NOTES;
DROP TABLE TECHNICIANS;
DROP TABLE TESTS;
DROP VIEW midwifeinfo;
