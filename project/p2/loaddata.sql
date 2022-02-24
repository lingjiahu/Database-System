-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
-- CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!


-- mothers
INSERT INTO LHU26.MOTHERS (MRAMQ, MNAME, MTEL, MEMAIL, MDOB, MBLOODTYPE, MADDRESS, MPROFESSION) VALUES ('GUTV92030001', 'Victoria Gutierrez', '5140000001', 'emma@gmail.com', '1992-03-06', 'B', '3838 René-Lévesque Blvd', 'teacher');
INSERT INTO LHU26.MOTHERS (MRAMQ, MNAME, MTEL, MEMAIL, MDOB, MBLOODTYPE, MADDRESS, MPROFESSION) VALUES ('NINK83060002', 'Kazunari Ninomiya', '5140000002', 'kaz@gmail.com', '1983-06-17', 'O', '2181 rue de la Gauchetière, Montreal, Quebec(QC), H3B 2M3', 'singer');
INSERT INTO LHU26.MOTHERS (MRAMQ, MNAME, MTEL, MEMAIL, MDOB, MBLOODTYPE, MADDRESS, MPROFESSION) VALUES ('YANC01060003', 'Claire Yang', '5140000003', 'yyy@gmail.com', '2001-06-21', null, '3083 rue Levy', 'student');
INSERT INTO LHU26.MOTHERS (MRAMQ, MNAME, MTEL, MEMAIL, MDOB, MBLOODTYPE, MADDRESS, MPROFESSION) VALUES ('PANA01002004', 'Alice Pan', '5140000004', 'alice@gmail.com', '2001-01-30', 'A', '275, rue Notre-Dame Est Montréal, QC H2Y 1C6', 'student');
INSERT INTO LHU26.MOTHERS (MRAMQ, MNAME, MTEL, MEMAIL, MDOB, MBLOODTYPE, MADDRESS, MPROFESSION) VALUES ('BROE94010005', 'EMMA BROWN', '5140000005', 'emma@gmail.com', '1994-01-01', 'B-', '3334 rue Ontario Ouest', 'doctor');
INSERT INTO LHU26.MOTHERS (MRAMQ, MNAME, MTEL, MEMAIL, MDOB, MBLOODTYPE, MADDRESS, MPROFESSION) VALUES ('LILZ98010006', 'Zoe Lilly', '5140000006', 'zoe@gmail.com', '1998-01-01', null, '263 Wallace Street', 'dancer');
INSERT INTO LHU26.MOTHERS (MRAMQ, MNAME, MTEL, MEMAIL, MDOB, MBLOODTYPE, MADDRESS, MPROFESSION) VALUES ('LUOM99020006', 'Maggie Luo', '5140000007', 'ml@gmail.com', '1999-02-01', null, '1449 Central Pkwy', 'social worker');

-- fathers
INSERT INTO LHU26.FATHERS (FID, FRAMQ, FNAME, FTEL, FEMAIL, FDOB, FBLOODTYPE, FADDRESS, FPROFESSION) VALUES (1001, 'GUTT88020001', 'Tom Gutierrez', '5140010001', 'gut@gmail.com', '1988-02-20', 'B', null, 'lawyer');
INSERT INTO LHU26.FATHERS (FID, FRAMQ, FNAME, FTEL, FEMAIL, FDOB, FBLOODTYPE, FADDRESS, FPROFESSION) VALUES (1002, 'NINA82120002', 'Aiba Ninomiya', '5140010002', null, '1982-12-24', 'A', null, 'surgeon');
INSERT INTO LHU26.FATHERS (FID, FRAMQ, FNAME, FTEL, FEMAIL, FDOB, FBLOODTYPE, FADDRESS, FPROFESSION) VALUES (1003, null, 'Sam Green', '5140010003', 'sam@gmail.com', '1998-02-27', null, null, 'actor');
INSERT INTO LHU26.FATHERS (FID, FRAMQ, FNAME, FTEL, FEMAIL, FDOB, FBLOODTYPE, FADDRESS, FPROFESSION) VALUES (1004, 'PANA00030004', 'Aiden Pan', '5140010004', null, '2000-03-15', 'AB+', null, 'mathematician');
INSERT INTO LHU26.FATHERS (FID, FRAMQ, FNAME, FTEL, FEMAIL, FDOB, FBLOODTYPE, FADDRESS, FPROFESSION) VALUES (1005, 'BROL95100005', 'Louis Brown', '5140010005', null, '1995-09-10', null, null, 'farmer');

-- couples
INSERT INTO LHU26.COUPLES (CID, MRAMQ, FID) VALUES (2001, 'GUTV92030001', 1001);
INSERT INTO LHU26.COUPLES (CID, MRAMQ, FID) VALUES (2002, 'NINK83060002', 1002);
INSERT INTO LHU26.COUPLES (CID, MRAMQ, FID) VALUES (2003, 'YANC01060003', 1003);
INSERT INTO LHU26.COUPLES (CID, MRAMQ, FID) VALUES (2004, 'PANA01002004', 1004);
INSERT INTO LHU26.COUPLES (CID, MRAMQ, FID) VALUES (2005, 'BROE94010005', 1005);
INSERT INTO LHU26.COUPLES (CID, MRAMQ, FID) VALUES (2006, 'LILZ98010006', null);
INSERT INTO LHU26.COUPLES (CID, MRAMQ, FID) VALUES (2007, 'LUOM99020006', null);

-- hcinstitutions
INSERT INTO LHU26.HCINSTITUTIONS (HCID, HCNAME, HCTEL, HCEMAIL, HCADDRESS, WEBSITE) VALUES (3001, 'Lac-Saint-Louis', '5140030001', 'lsl@gmail.com', '4993 Sherbrooke Ouest, Montreal, Quebec(QC), H4A 1H3', null);
INSERT INTO LHU26.HCINSTITUTIONS (HCID, HCNAME, HCTEL, HCEMAIL, HCADDRESS, WEBSITE) VALUES (3002, 'bc001', '5140030002', 'bc1@gmail.com', '3228 Scarth Street', 'www.bc1.org.ca');
INSERT INTO LHU26.HCINSTITUTIONS (HCID, HCNAME, HCTEL, HCEMAIL, HCADDRESS, WEBSITE) VALUES (3003, 'bc002', '5140030003', 'bc2@gmail.com', '2872 Papineau Avenue, Montreal, Quebec(QC), H2K 4J5', 'www.cs.mcgill.ca');
INSERT INTO LHU26.HCINSTITUTIONS (HCID, HCNAME, HCTEL, HCEMAIL, HCADDRESS, WEBSITE) VALUES (3004, 'bc003', '5140030004', 'bc3@gmail.com', '2318 Brand Road', null);
INSERT INTO LHU26.HCINSTITUTIONS (HCID, HCNAME, HCTEL, HCEMAIL, HCADDRESS, WEBSITE) VALUES (3005, 'bc004', '5140030005', 'bc4@gmail.com', '726 Jasper Ave', null);
INSERT INTO LHU26.HCINSTITUTIONS (HCID, HCNAME, HCTEL, HCEMAIL, HCADDRESS, WEBSITE) VALUES (3006, 'cc001', '5140030006', 'cc1@gmail.com', '2287 Saint-Denis Street', null);
INSERT INTO LHU26.HCINSTITUTIONS (HCID, HCNAME, HCTEL, HCEMAIL, HCADDRESS, WEBSITE) VALUES (3007, 'cc002', '5140030007', 'cc2@gmail.com', '1090 avenue Royale, Quebec, Quebec(QC), G1E 2L3', null);
INSERT INTO LHU26.HCINSTITUTIONS (HCID, HCNAME, HCTEL, HCEMAIL, HCADDRESS, WEBSITE) VALUES (3008, 'cc003', '5140030008', 'cc3@gmail.com', '4027 Sheppard Ave, Montreal, Quebec(QC)', null);
INSERT INTO LHU26.HCINSTITUTIONS (HCID, HCNAME, HCTEL, HCEMAIL, HCADDRESS, WEBSITE) VALUES (3009, 'cc004', '5140030009', 'cc4@gmail.com', '1457 Cordova Street', null);
INSERT INTO LHU26.HCINSTITUTIONS (HCID, HCNAME, HCTEL, HCEMAIL, HCADDRESS, WEBSITE) VALUES (3010, 'cc005', '5140030010', 'cc5@gmail.com', '2324 Rue King, Sherbrooke Quebec(QC)', null);

-- communityclinics
INSERT INTO LHU26.COMMUNITYCLINICS (HCID) VALUES (3006);
INSERT INTO LHU26.COMMUNITYCLINICS (HCID) VALUES (3007);
INSERT INTO LHU26.COMMUNITYCLINICS (HCID) VALUES (3008);
INSERT INTO LHU26.COMMUNITYCLINICS (HCID) VALUES (3009);
INSERT INTO LHU26.COMMUNITYCLINICS (HCID) VALUES (3010);

-- birthingcenters
INSERT INTO LHU26.BIRTHINGCENTERS (HCID) VALUES (3001);
INSERT INTO LHU26.BIRTHINGCENTERS (HCID) VALUES (3002);
INSERT INTO LHU26.BIRTHINGCENTERS (HCID) VALUES (3003);
INSERT INTO LHU26.BIRTHINGCENTERS (HCID) VALUES (3004);
INSERT INTO LHU26.BIRTHINGCENTERS (HCID) VALUES (3005);

-- midwives
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4001, 3001, 'Marion Girard', '5140040001', 'mg@gamil.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4002, 3001, 'Abby Lilly', '5140040002', 'al@gamil.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4003, 3001, 'Karen Obrian', '5140040003', 'ko@gamil.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4004, 3002, 'Jade Chin', '5140040004', 'jc@gamil.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4005, 3002, 'Sophie Marutara', '5140040005', 'sm@gamil.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4006, 3003, 'Lucy Clark', '5140040006', 'lc@gamil.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4007, 3004, 'Sasha Lambiel', '5140040007', 'sl@gamil.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4008, 3006, 'Mary Maana', '5140040008', 'mm@gamil.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4009, 3006, 'Sally Plush', '5140040009', 'sp@gamil.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4010, 3007, 'Kelly Galle', '5140040010', 'kg@gamil.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4011, 3008, 'Sarah Zakob', '5140040011', 'sz@gamil.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4012, 3009, 'Nikita Hope', '5140040012', 'nh@gamil.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4013, 3001, 'Lahm Kiggle', '5140040013', 'lk@gmail.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4015, 3001, 'John Kramer', '5140040015', 'jk@gmail.com');
INSERT INTO LHU26.MIDWIVES (PID, HCID, MWNAME, MWTEL, MWEMAIL) VALUES (4014, 3001, 'Suu Quan', '5140040014', 'sq@gmail.com');

-- pregnancies
INSERT INTO LHU26.PREGNANCIES (CID, BIRTHYM, FIRSTEXP, SECONDEXP, FINALEXP, HCID, INTERESTED, PPID, BPID) VALUES (2001, '2020-02-01', '2020-02-01', '2020-02-01', '2020-02-01', 3001, true, 4001, null);
INSERT INTO LHU26.PREGNANCIES (CID, BIRTHYM, FIRSTEXP, SECONDEXP, FINALEXP, HCID, INTERESTED, PPID, BPID) VALUES (2001, '2022-01-01', '2022-01-01', '2022-01-01', '2022-01-01', null, true, 4002, 4001);
INSERT INTO LHU26.PREGNANCIES (CID, BIRTHYM, FIRSTEXP, SECONDEXP, FINALEXP, HCID, INTERESTED, PPID, BPID) VALUES (2002, '2022-06-01', '2022-07-02', '2022-06-30', '2022-07-02', null, true, 4001, 4002);
INSERT INTO LHU26.PREGNANCIES (CID, BIRTHYM, FIRSTEXP, SECONDEXP, FINALEXP, HCID, INTERESTED, PPID, BPID) VALUES (2003, '2022-05-02', '2022-05-02', null, null, null, true, 4001, null);
INSERT INTO LHU26.PREGNANCIES (CID, BIRTHYM, FIRSTEXP, SECONDEXP, FINALEXP, HCID, INTERESTED, PPID, BPID) VALUES (2004, '2022-07-01', '2022-07-01', null, null, null, true, 4001, null);
INSERT INTO LHU26.PREGNANCIES (CID, BIRTHYM, FIRSTEXP, SECONDEXP, FINALEXP, HCID, INTERESTED, PPID, BPID) VALUES (2005, '2022-07-15', '2022-07-15', null, null, null, true, 4003, null);
INSERT INTO LHU26.PREGNANCIES (CID, BIRTHYM, FIRSTEXP, SECONDEXP, FINALEXP, HCID, INTERESTED, PPID, BPID) VALUES (2006, '2018-05-01', '2018-05-01', '2018-05-01', '2018-05-01', null, false, null, null);
INSERT INTO LHU26.PREGNANCIES (CID, BIRTHYM, FIRSTEXP, SECONDEXP, FINALEXP, HCID, INTERESTED, PPID, BPID) VALUES (2006, '2019-05-01', '2019-05-01', '2019-05-01', '2019-05-01', null, false, null, null);
INSERT INTO LHU26.PREGNANCIES (CID, BIRTHYM, FIRSTEXP, SECONDEXP, FINALEXP, HCID, INTERESTED, PPID, BPID) VALUES (2006, '2020-05-01', '2020-05-01', '2020-05-01', '2020-05-01', null, false, null, null);
INSERT INTO LHU26.PREGNANCIES (CID, BIRTHYM, FIRSTEXP, SECONDEXP, FINALEXP, HCID, INTERESTED, PPID, BPID) VALUES (2007, '2022-08-01', '2022-08-01', null, '2022-07-07', null, false, null, null);

-- invitations
INSERT INTO LHU26.INVITATIONS (CID, HCID) VALUES (2001, 3001);
INSERT INTO LHU26.INVITATIONS (CID, HCID) VALUES (2002, 3001);
INSERT INTO LHU26.INVITATIONS (CID, HCID) VALUES (2003, 3001);
INSERT INTO LHU26.INVITATIONS (CID, HCID) VALUES (2004, 3001);
INSERT INTO LHU26.INVITATIONS (CID, HCID) VALUES (2005, 3001);
INSERT INTO LHU26.INVITATIONS (CID, HCID) VALUES (2006, 3009);
INSERT INTO LHU26.INVITATIONS (CID, HCID) VALUES (2007, 3001);

-- infosessions
INSERT INTO LHU26.INFOSESSIONS (ISID, HCID, PID, SESSIONDATE, SESSIONTIME, LANGUAGE) VALUES (5001, 3001, 4001, '2019-08-09', '09:30:00', 'English');
INSERT INTO LHU26.INFOSESSIONS (ISID, HCID, PID, SESSIONDATE, SESSIONTIME, LANGUAGE) VALUES (5002, 3001, 4001, '2021-06-09', '09:30:00', 'English');
INSERT INTO LHU26.INFOSESSIONS (ISID, HCID, PID, SESSIONDATE, SESSIONTIME, LANGUAGE) VALUES (5003, 3001, 4003, '2021-12-09', '09:30:00', 'French');
INSERT INTO LHU26.INFOSESSIONS (ISID, HCID, PID, SESSIONDATE, SESSIONTIME, LANGUAGE) VALUES (5004, 3001, 4003, '2021-12-09', '09:30:00', 'English');
INSERT INTO LHU26.INFOSESSIONS (ISID, HCID, PID, SESSIONDATE, SESSIONTIME, LANGUAGE) VALUES (5005, 3009, 4012, '2017-12-11', '09:30:00', 'English');

-- registrations
INSERT INTO LHU26.REGISTRATIONS (CID, ISID) VALUES (2001, 5001);
INSERT INTO LHU26.REGISTRATIONS (CID, ISID) VALUES (2001, 5002);
INSERT INTO LHU26.REGISTRATIONS (CID, ISID) VALUES (2002, 5003);
INSERT INTO LHU26.REGISTRATIONS (CID, ISID) VALUES (2003, 5003);
INSERT INTO LHU26.REGISTRATIONS (CID, ISID) VALUES (2004, 5004);
INSERT INTO LHU26.REGISTRATIONS (CID, ISID) VALUES (2005, 5004);

-- babies
INSERT INTO LHU26.BABIES (BID, CID, BIRTHYM, BNAME, GENDER, BBLOODTYPE, BDOB, BIRTHTIME) VALUES (6001, 2001, '2020-02-01', 'Abby Gutierrez', 'male', null, '2020-02-05', '10:10:00');
INSERT INTO LHU26.BABIES (BID, CID, BIRTHYM, BNAME, GENDER, BBLOODTYPE, BDOB, BIRTHTIME) VALUES (6002, 2001, '2020-02-01', 'Babby Gutierrez', 'male', null, '2020-02-05', '10:15:00');
INSERT INTO LHU26.BABIES (BID, CID, BIRTHYM, BNAME, GENDER, BBLOODTYPE, BDOB, BIRTHTIME) VALUES (6009, 2001, '2022-01-01', 'Ivan Gutierrez', 'female', 'B', '2020-02-01', '10:10:00');
INSERT INTO LHU26.BABIES (BID, CID, BIRTHYM, BNAME, GENDER, BBLOODTYPE, BDOB, BIRTHTIME) VALUES (6003, 2006, '2018-05-01', 'Cubby Lilly', 'female', null, '2018-04-28', '20:10:00');
INSERT INTO LHU26.BABIES (BID, CID, BIRTHYM, BNAME, GENDER, BBLOODTYPE, BDOB, BIRTHTIME) VALUES (6004, 2006, '2018-05-01', 'Dubby Lilly', 'female', null, '2018-04-28', '20:19:00');
INSERT INTO LHU26.BABIES (BID, CID, BIRTHYM, BNAME, GENDER, BBLOODTYPE, BDOB, BIRTHTIME) VALUES (6006, 2006, '2019-05-01', 'Fubby Lilly', 'female', null, '2019-04-29', '16:10:00');
INSERT INTO LHU26.BABIES (BID, CID, BIRTHYM, BNAME, GENDER, BBLOODTYPE, BDOB, BIRTHTIME) VALUES (6007, 2006, '2019-05-01', 'Gabby Lilly', 'female', null, '2019-04-29', '16:20:00');
INSERT INTO LHU26.BABIES (BID, CID, BIRTHYM, BNAME, GENDER, BBLOODTYPE, BDOB, BIRTHTIME) VALUES (6008, 2006, '2020-05-01', 'Hubby Lilly', 'female', null, '2020-04-30', '09:30:00');
INSERT INTO LHU26.BABIES (BID, CID, BIRTHYM, BNAME, GENDER, BBLOODTYPE, BDOB, BIRTHTIME) VALUES (6005, 2006, '2018-05-01', 'Eubby Lilly', 'female', null, '2018-04-28', '20:30:00');

-- appointments
INSERT INTO LHU26.APPOINTMENTS (AID, CID, BIRTHYM, PID, APPTDATE, APPTIME) VALUES (7001, 2003, '2022-05-02', 4001, '2022-03-20', '10:30:00');
INSERT INTO LHU26.APPOINTMENTS (AID, CID, BIRTHYM, PID, APPTDATE, APPTIME) VALUES (7002, 2003, '2022-05-02', 4001, '2022-03-24', '10:30:00');
INSERT INTO LHU26.APPOINTMENTS (AID, CID, BIRTHYM, PID, APPTDATE, APPTIME) VALUES (7003, 2003, '2022-05-02', 4001, '2022-03-25', '10:30:00');
INSERT INTO LHU26.APPOINTMENTS (AID, CID, BIRTHYM, PID, APPTDATE, APPTIME) VALUES (7004, 2003, '2022-05-02', 4001, '2022-03-26', '10:30:00');
INSERT INTO LHU26.APPOINTMENTS (AID, CID, BIRTHYM, PID, APPTDATE, APPTIME) VALUES (7005, 2001, '2022-01-01', 4001, '2022-01-02', '10:30:00');
INSERT INTO LHU26.APPOINTMENTS (AID, CID, BIRTHYM, PID, APPTDATE, APPTIME) VALUES (7009, 2001, '2022-01-01', 4001, '2022-03-01', '10:30:00');
INSERT INTO LHU26.APPOINTMENTS (AID, CID, BIRTHYM, PID, APPTDATE, APPTIME) VALUES (7007, 2001, '2020-02-01', 4001, '2019-10-01', '10:30:00');
INSERT INTO LHU26.APPOINTMENTS (AID, CID, BIRTHYM, PID, APPTDATE, APPTIME) VALUES (7008, 2001, '2020-02-01', 4001, '2019-11-01', '10:30:00');

-- tests
INSERT INTO LHU26.TESTS (TID, RAMQ, BID, AID, TECHID, TYPE, PSCRPDATE, TESTDATE, EXAMDATE, RESULT) VALUES (8001, 'GUTV92030001', null, 7007, 10001, 'blood iron', '2019-10-01', '2019-10-02', '2019-10-02', 'good bi');
INSERT INTO LHU26.TESTS (TID, RAMQ, BID, AID, TECHID, TYPE, PSCRPDATE, TESTDATE, EXAMDATE, RESULT) VALUES (8002, 'GUTV92030001', null, 7008, 10001, 'blood iron', '2019-11-01', '2019-11-02', '2019-11-02', 'ok bi');
INSERT INTO LHU26.TESTS (TID, RAMQ, BID, AID, TECHID, TYPE, PSCRPDATE, TESTDATE, EXAMDATE, RESULT) VALUES (8003, 'GUTV92030001', null, 7008, 10001, 'blood oxygen', '2019-11-01', '2019-11-02', '2019-11-02', 'very good bo');
INSERT INTO LHU26.TESTS (TID, RAMQ, BID, AID, TECHID, TYPE, PSCRPDATE, TESTDATE, EXAMDATE, RESULT) VALUES (8004, 'YANC01060003', null, 7004, 10001, 'blood iron', '2022-03-26', '2022-03-26', '2022-03-26', 'bi test good');
INSERT INTO LHU26.TESTS (TID, RAMQ, BID, AID, TECHID, TYPE, PSCRPDATE, TESTDATE, EXAMDATE, RESULT) VALUES (8005, 'YANC01060003', null, 7004, 10001, 'blood oxygen', '2022-03-26', '2022-03-26', '2022-03-26', 'bo test good');
INSERT INTO LHU26.TESTS (TID, RAMQ, BID, AID, TECHID, TYPE, PSCRPDATE, TESTDATE, EXAMDATE, RESULT) VALUES (8006, 'GUTV92030001', null, 7008, null, 'blood iron', '2019-11-01', null, null, '');
INSERT INTO LHU26.TESTS (TID, RAMQ, BID, AID, TECHID, TYPE, PSCRPDATE, TESTDATE, EXAMDATE, RESULT) VALUES (8007, null, 6009, 7009, 10002, 'blood test', '2022-03-01', '2022-03-01', '2022-03-01', 'baby blood type is B');

-- notes
INSERT INTO LHU26.NOTES (NID, AID, NOTEDATE, NOTETIME) VALUES (9001, 7001, '2022-03-20', '11:30:00');
INSERT INTO LHU26.NOTES (NID, AID, NOTEDATE, NOTETIME) VALUES (9002, 7002, '2022-03-24', '11:30:00');
INSERT INTO LHU26.NOTES (NID, AID, NOTEDATE, NOTETIME) VALUES (9003, 7003, '2022-03-25', '11:30:00');
INSERT INTO LHU26.NOTES (NID, AID, NOTEDATE, NOTETIME) VALUES (9004, 7004, '2022-03-26', '11:30:00');
INSERT INTO LHU26.NOTES (NID, AID, NOTEDATE, NOTETIME) VALUES (9005, 7004, '2022-03-26', '11:50:00');

-- technicians
INSERT INTO LHU26.TECHNICIANS (TECHID, TNAME, TTEL) VALUES (10001, 'Sam Tech', '5140000001');
INSERT INTO LHU26.TECHNICIANS (TECHID, TNAME, TTEL) VALUES (10002, 'Lam Tech', '5140000002');
INSERT INTO LHU26.TECHNICIANS (TECHID, TNAME, TTEL) VALUES (10003, 'Dam Tech', '5140000003');
INSERT INTO LHU26.TECHNICIANS (TECHID, TNAME, TTEL) VALUES (10004, 'Tam Tech', '5140000004');
INSERT INTO LHU26.TECHNICIANS (TECHID, TNAME, TTEL) VALUES (10005, 'Pam Tech', '5140000005');