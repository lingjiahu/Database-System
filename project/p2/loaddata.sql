-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
-- CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

INSERT INTO mothers
VALUES ('GUTV92030001', 'Victoria Gutierrez', '5140000001', 'emma@gmail.com', '1992-03-06', 'B',
        '3838 René-Lévesque Blvd', 'teacher'),
       ('NINK83060002', 'Kazunari Ninomiya', '5140000002', 'kaz@gmail.com', '1983-06-17', 'O',
        '2181 rue de la Gauchetière, Montreal, Quebec(QC), H3B 2M3', 'singer'),
       ('YANC01060003', 'Claire Yang', '5140000003', 'yyy@gmail.com', '2001-06-21', NULL,
        '3083 rue Levy', 'student'),
       ('PANA01002004', 'Alice Pan', '5140000004', 'alice@gmail.com', '2001-01-30', 'A',
        '275, rue Notre-Dame Est Montréal, QC H2Y 1C6', 'student'),
       ('BROE94010005', 'EMMA BROWN', '5140000005', 'emma@gmail.com', '1994-01-01', 'B-',
        '3334 rue Ontario Ouest', 'doctor'),
       ('LILZ98010006', 'Zoe Lilly', '5140000006', 'zoe@gmail.com', '1998-01-01', NULL,
        '263 Wallace Street', 'dancer'),
       ('LUOM99020006', 'Maggie Luo', '5140000007', 'ml@gmail.com', '1999-02-01', NULL,
        '1449 Central Pkwy', 'social worker')
;

INSERT INTO fathers
VALUES ('1001', 'GUTT88020001', 'Tom Gutierrez', '5140010001', 'gut@gmail.com', '1988-02-20', 'B', NULL, 'lawyer'),
       ('1002', 'NINA82120002', 'Aiba Ninomiya', '5140010002', NULL, '1982-12-24', 'A', NULL, 'surgeon'),
       ('1003', NULL, 'Sam Green', '5140010003', 'sam@gmail.com', '1998-02-27', NULL, NULL, 'actor'),
       ('1004', 'PANA00030004', 'Aiden Pan', '5140010004', NULL, '2000-03-15', 'AB+', NULL, 'mathematician'),
       ('1005', 'BROL95100005', 'Louis Brown', '5140010005', NULL, '1995-09-10', NULL, NULL, 'farmer')
;

INSERT INTO couples
VALUES ('2001', 'GUTV92030001', '1001'),
       ('2002', 'NINK83060002', '1002'),
       ('2003', 'YANC01060003', '1003'),
       ('2004', 'PANA01002004', '1004'),
       ('2005', 'BROE94010005', '1005'),
       ('2006', 'LILZ98010006', NULL),
       ('2007', 'LUOM99020006', NULL)
;


INSERT INTO hcinstitutions
VALUES ('3001', 'Lac-Saint-Louis', '5140030001', 'lsl@gmail.com',
        '4993 Sherbrooke Ouest, Montreal, Quebec(QC), H4A 1H3', NULL),
       ('3002', 'bc001', '5140030002', 'bc1@gmail.com', '3228 Scarth Street', 'www.bc1.org.ca'),
       ('3003', 'bc002', '5140030003', 'bc2@gmail.com', '2872 Papineau Avenue, Montreal, Quebec(QC), H2K 4J5',
        'www.cs.mcgill.ca'),
       ('3004', 'bc003', '5140030004', 'bc3@gmail.com', '2318 Brand Road', NULL),
       ('3005', 'bc004', '5140030005', 'bc4@gmail.com', '726 Jasper Ave', NULL),
       ('3006', 'cc001', '5140030006', 'cc1@gmail.com', '2287 Saint-Denis Street', NULL),
       ('3007', 'cc002', '5140030007', 'cc2@gmail.com', '1090 avenue Royale, Quebec, Quebec(QC), G1E 2L3', NULL),
       ('3008', 'cc003', '5140030008', 'cc3@gmail.com', '4027 Sheppard Ave, Montreal, Quebec(QC)', NULL),
       ('3009', 'cc004', '5140030009', 'cc4@gmail.com', '1457 Cordova Street', NULL),
       ('3010', 'cc005', '5140030010', 'cc5@gmail.com', '2324 Rue King, Sherbrooke Quebec(QC)', NULL)
;

INSERT INTO communityclinics
VALUES ('3010'),
       ('3006'),
       ('3007'),
       ('3008'),
       ('3009')
;

INSERT INTO birthingcenters
VALUES ('3001'),
       ('3002'),
       ('3003'),
       ('3004'),
       ('3005')
;

INSERT INTO midwives
VALUES ('4001', '3001', 'Marion Girard', '5140040001', 'mg@gamil.com'),
       ('4002', '3001', 'Abby Lilly', '5140040002', 'al@gamil.com'),
       ('4003', '3001', 'Karen Obrian', '5140040003', 'ko@gamil.com'),
       ('4004', '3002', 'Jade Chin', '5140040004', 'jc@gamil.com'),
       ('4005', '3002', 'Sophie Marutara', '5140040005', 'sm@gamil.com'),
       ('4006', '3003', 'Lucy Clark', '5140040006', 'lc@gamil.com'),
       ('4007', '3004', 'Sasha Lambiel', '5140040007', 'sl@gamil.com'),
       ('4008', '3006', 'Mary Maana', '5140040008', 'mm@gamil.com'),
       ('4009', '3006', 'Sally Plush', '5140040009', 'sp@gamil.com'),
       ('4010', '3007', 'Kelly Galle', '5140040010', 'kg@gamil.com'),
       ('4011', '3008', 'Sarah Zakob', '5140040011', 'sz@gamil.com'),
       ('4012', '3009', 'Nikita Hope', '5140040012', 'nh@gamil.com')
;

INSERT INTO pregnancies
VALUES ('2001', '2022-01-01', NULL, NULL, NULL, NULL, FALSE, '4002', NULL),
       ('2001', '2020-02-01', NULL, NULL, NULL, NULL, TRUE, '4001', NULL),
       ('2003', '2022-05-02', NULL, NULL, NULL, NULL, TRUE, '4001', NULL),
       ('2004', '2022-06-01', NULL, NULL, NULL, NULL, TRUE, '4001', NULL),
       ('2005', '2022-05-01', NULL, NULL, NULL, NULL, TRUE, '4003', NULL),
       ('2006', '2018-05-01', NULL, NULL, NULL, NULL, FALSE, NULL, NULL),
       ('2006', '2019-05-01', NULL, NULL, NULL, NULL, FALSE, NULL, NULL),
       ('2006', '2020-05-01', NULL, NULL, NULL, NULL, FALSE, NULL, NULL)

;

INSERT INTO invitations
VALUES ('')

;

INSERT INTO infosessions
VALUES ('5001', '3001', '4001', '2019-08-09', '09:30', 'English'),
       ('5002', '3001', '4001', '2020-12-09', '09:30', 'English'),
       ('5003', '3001', NULL, '2020-08-09', '09:30', 'French')

;

INSERT INTO registrations
VALUES ('2001','5001')
;



INSERT INTO babies
VALUES ('6001', '2001', '2020-02-01', 'Abby Gutierrez', 'male', NULL, '2020-02-05', '10:10'),
       ('6002', '2001', '2020-02-01', 'Babby Gutierrez', 'male', NULL, '2020-02-05', '10:15'),
       ('6003', '2006', '2018-05-01', 'Cubby Lilly', 'female', NULL, '2018-04-28', '20:10'),
       ('6004', '2006', '2018-05-01', 'Dubby Lilly', 'female', NULL, '2018-04-28', '20:19'),
       ('6005', '2006', '2018-05-01', 'Eubby Lilly', 'female', NULL, '2018-04-28', '20:30'),
       ('6006', '2006', '2019-05-01', 'Fubby Lilly', 'female', NULL, '2019-04-29', '16:10'),
       ('6007', '2006', '2019-05-01', 'Gabby Lilly', 'female', NULL, '2019-04-29', '16:20'),
       ('6008', '2006', '2020-05-01', 'Hubby Lilly', 'female', NULL, '2020-04-30', '09:30')
;

INSERT INTO appointments
VALUES ('7001', '2003', '2022-05-02', '4001', '2022-03-20','10:30'),
       ('7002', '2003', '2022-05-02', '4001', '2022-03-24','10:30'),
       ('7003', '2003', '2022-05-02', '4001', '2022-03-25','10:30'),
       ('7004', '2003', '2022-05-02', '4001', '2022-03-26','10:30'),
       ('7005', '2001', '2022-01-01', '4001', '2022-01-02','10:30')

;

-- INSERT INTO notes
-- VALUES (),
-- ;
--
-- INSERT INTO technicians
-- VALUES (),
-- ;
--
-- INSERT INTO tests
-- VALUES (),
-- ;