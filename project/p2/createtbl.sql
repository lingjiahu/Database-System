-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
-- CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

CREATE TABLE MOTHER
(
    ramq       VARCHAR(30)  NOT NULL,
    name       VARCHAR(50)  NOT NULL,
    tel        VARCHAR(20)  NOT NULL,
    email      VARCHAR(30)  NOT NULL,
    dob        DATE         NOT NULL,
    bloodtype  VARCHAR(10),
    address    VARCHAR(100) NOT NULL,
    profession VARCHAR(20)  NOT NULL,
    PRIMARY KEY (ramq)
);

CREATE TABLE FATHER
(
    fid        INTEGER     NOT NULL,
    ramq       VARCHAR(30),
    name       VARCHAR(50) NOT NULL,
    tel        VARCHAR(20) NOT NULL,
    email      VARCHAR(30),
    dob        DATE        NOT NULL,
    bloodtype  VARCHAR(3),
    address    VARCHAR(100),
    profession VARCHAR(20) NOT NULL,
    PRIMARY KEY (fid)
);

CREATE TABLE COUPLE
(
    cid  INTEGER     NOT NULL,
    ramq VARCHAR(30) NOT NULL,
    fid  INTEGER     NOT NULL,
    PRIMARY KEY (cid),
    FOREIGN KEY (ramq) REFERENCES MOTHER,
    FOREIGN KEY (fid) REFERENCES FATHER
);

CREATE TABLE HCINSTITUTIONS
(
    hcid    INTEGER      NOT NULL,
    name    VARCHAR(30)  NOT NULL,
    tel     VARCHAR(20)  NOT NULL,
    email   VARCHAR(30)  NOT NULL,
    address VARCHAR(100) NOT NULL,
    website VARCHAR(50),
    PRIMARY KEY (hcid)
);

CREATE TABLE COMMUNITYCLINICS
(
    hcid INTEGER NOT NULL,
    PRIMARY KEY (hcid),
    FOREIGN KEY (hcid) REFERENCES HCINSTITUTIONS
);

CREATE TABLE BIRTHINGCENTERS
(
    hcid INTEGER NOT NULL,
    PRIMARY KEY (hcid),
    FOREIGN KEY (hcid) REFERENCES HCINSTITUTIONS
);

CREATE TABLE PREGNANCIES
(
    cid       INTEGER NOT NULL,
    birthym   DATE    NOT NULL,
    firstexp  DATE,
    secondexp DATE,
    finalexp  DATE,
    hcid      INTEGER NOT NULL,
    PRIMARY KEY (cid, birthym),
    FOREIGN KEY (cid) REFERENCES COUPLE,
    FOREIGN KEY (hcid) REFERENCES HCINSTITUTIONS
);

CREATE TABLE INVITATIONS
(
    cid  INTEGER NOT NULL,
    hcid INTEGER NOT NULL,
    PRIMARY KEY (cid, hcid),
    FOREIGN KEY (cid) REFERENCES COUPLE,
    FOREIGN KEY (hcid) REFERENCES HCINSTITUTIONS
);

CREATE TABLE MIDWIVES
(
    pid   INTEGER     NOT NULL,
    hcid  INTEGER     NOT NULL,
    name  VARCHAR(30) NOT NULL,
    tel   VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    PRIMARY KEY (pid),
    FOREIGN KEY (hcid) REFERENCES HCINSTITUTIONS
);

CREATE TABLE INFOSESSIONS
(
    isid        INTEGER     NOT NULL,
    hcid        INTEGER     NOT NULL,
    pid         INTEGER     NOT NULL,
    sessiondate DATE        NOT NULL,
    sessiontime TIME        NOT NULL,
    language    VARCHAR(10) NOT NULL,
    PRIMARY KEY (isid),
    FOREIGN KEY (hcid) REFERENCES HCINSTITUTIONS,
    FOREIGN KEY (pid) REFERENCES MIDWIVES
);

CREATE TABLE REGISTRATIONS
(
    cid  INTEGER NOT NULL,
    isid INTEGER NOT NULL,
    FOREIGN KEY (cid) REFERENCES COUPLE,
    FOREIGN KEY (isid) REFERENCES INFOSESSIONS
);

CREATE TABLE BABIES
(
    bid       INTEGER NOT NULL,
    cid       INTEGER NOT NULL,
    birthym   DATE    NOT NULL,
    name      VARCHAR(30),
    gender    VARCHAR(10),
    bloodtype VARCHAR(10),
    dob       DATE,
    birthtime TIME,
    PRIMARY KEY (bid),
    FOREIGN KEY (cid, birthym) REFERENCES PREGNANCIES
);

CREATE TABLE APPOINTMENTS
(
    aid      INTEGER NOT NULL,
    cid      INTEGER NOT NULL,
    birthym  DATE    NOT NULL,
    pid      INTEGER NOT NULL,
    apptdate DATE    NOT NULL,
    apptime  TIME    NOT NULL,
    PRIMARY KEY (aid),
    FOREIGN KEY (cid, birthym) REFERENCES PREGNANCIES,
    FOREIGN KEY (pid) REFERENCES MIDWIVES
);

CREATE TABLE NOTES
(
    nid      INTEGER NOT NULL,
    aid      INTEGER NOT NULL,
    notedate DATE    NOT NULL,
    notetime TIME    NOT NULL,
    PRIMARY KEY (nid),
    FOREIGN KEY (aid) REFERENCES APPOINTMENTS
);

CREATE TABLE TECHNICIANS
(
    techid INTEGER     NOT NULL,
    name   VARCHAR(30) NOT NULL,
    tel    VARCHAR(20) NOT NULL,
    PRIMARY KEY (techid)
);

CREATE TABLE TESTS
(
    tid       INTEGER NOT NULL,
    ramq      VARCHAR(30),
    bid       INTEGER,
    aid       INTEGER NOT NULL,
    techid    INTEGER,
    pscrpdate DATE    NOT NULL,
    testdate  DATE,
    examdate  DATE,
    result    VARCHAR(1000),
    PRIMARY KEY (tid),
    FOREIGN KEY (ramq) REFERENCES MOTHER,
    FOREIGN KEY (bid) REFERENCES BABIES,
    FOREIGN KEY (aid) REFERENCES APPOINTMENTS,
    FOREIGN KEY (techid) REFERENCES TECHNICIANS
);