-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
-- CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

CREATE TABLE mothers
(
    mramq       VARCHAR(12)  NOT NULL,
    mname       VARCHAR(50)  NOT NULL,
    mtel        VARCHAR(20)  NOT NULL,
    memail      VARCHAR(30)  NOT NULL,
    mdob        DATE         NOT NULL,
    mbloodtype  VARCHAR(10),
    maddress    VARCHAR(100) NOT NULL,
    mprofession VARCHAR(20)  NOT NULL,
    PRIMARY KEY (mramq)
);

CREATE TABLE fathers
(
    fid         INTEGER     NOT NULL,
    framq       VARCHAR(12),
    fname       VARCHAR(50) NOT NULL,
    ftel        VARCHAR(20) NOT NULL,
    femail      VARCHAR(30),
    fdob        DATE        NOT NULL,
    fbloodtype  VARCHAR(3),
    faddress    VARCHAR(100),
    fprofession VARCHAR(20) NOT NULL,
    PRIMARY KEY (fid)
);

CREATE TABLE couples
(
    cid   INTEGER     NOT NULL,
    mramq VARCHAR(12) NOT NULL,
    fid   INTEGER     NOT NULL,
    PRIMARY KEY (cid),
    FOREIGN KEY (mramq) REFERENCES mothers,
    FOREIGN KEY (fid) REFERENCES fathers
);

CREATE TABLE hcinstitutions
(
    hcid      INTEGER            NOT NULL,
    hcname    VARCHAR(30)        NOT NULL,
    hctel     VARCHAR(20)        NOT NULL,
    hcemail   VARCHAR(30) UNIQUE NOT NULL,
    hcaddress VARCHAR(100)       NOT NULL,
    website   VARCHAR(50),
    PRIMARY KEY (hcid)
);

CREATE TABLE communityclinics
(
    hcid INTEGER NOT NULL,
    PRIMARY KEY (hcid),
    FOREIGN KEY (hcid) REFERENCES hcinstitutions
);

CREATE TABLE birthingcenters
(
    hcid INTEGER NOT NULL,
    PRIMARY KEY (hcid),
    FOREIGN KEY (hcid) REFERENCES hcinstitutions
);

CREATE TABLE midwives
(
    pid     INTEGER            NOT NULL,
    hcid    INTEGER            NOT NULL,
    mwname  VARCHAR(30)        NOT NULL,
    mwtel   VARCHAR(20)        NOT NULL,
    mwemail VARCHAR(30) UNIQUE NOT NULL,
    PRIMARY KEY (pid),
    FOREIGN KEY (hcid) REFERENCES hcinstitutions
);

CREATE TABLE pregnancies
(
    cid        INTEGER NOT NULL,
    birthym    DATE    NOT NULL,
    firstexp   DATE,
    secondexp  DATE,
    finalexp   DATE,
    hcid       INTEGER,
    interested BOOLEAN DEFAULT FALSE,
    ppid       INTEGER,
    bpid       INTEGER,
    PRIMARY KEY (cid, birthym),
    FOREIGN KEY (cid) REFERENCES couples,
    FOREIGN KEY (hcid) REFERENCES hcinstitutions,
    FOREIGN KEY (ppid) REFERENCES midwives,
    FOREIGN KEY (bpid) REFERENCES midwives
);

CREATE TABLE invitations
(
    cid  INTEGER NOT NULL,
    hcid INTEGER NOT NULL,
    PRIMARY KEY (cid, hcid),
    FOREIGN KEY (cid) REFERENCES couples,
    FOREIGN KEY (hcid) REFERENCES hcinstitutions
);

CREATE TABLE infosessions
(
    isid        INTEGER     NOT NULL,
    hcid        INTEGER     NOT NULL,
    pid         INTEGER,
    sessiondate DATE        NOT NULL,
    sessiontime TIME        NOT NULL,
    language    VARCHAR(10) NOT NULL,
    PRIMARY KEY (isid),
    FOREIGN KEY (hcid) REFERENCES hcinstitutions,
    FOREIGN KEY (pid) REFERENCES midwives
);

CREATE TABLE registrations
(
    cid  INTEGER NOT NULL,
    isid INTEGER NOT NULL,
    FOREIGN KEY (cid) REFERENCES couples,
    FOREIGN KEY (isid) REFERENCES infosessions
);

CREATE TABLE babies
(
    bid        INTEGER NOT NULL,
    cid        INTEGER NOT NULL,
    birthym    DATE    NOT NULL,
    bname      VARCHAR(30),
    gender     VARCHAR(10),
    bbloodtype VARCHAR(10),
    bdob       DATE,
    birthtime  TIME,
    PRIMARY KEY (bid),
    FOREIGN KEY (cid, birthym) REFERENCES pregnancies
);

CREATE TABLE appointments
(
    aid      INTEGER NOT NULL,
    cid      INTEGER NOT NULL,
    birthym  DATE    NOT NULL,
    pid      INTEGER NOT NULL,
    apptdate DATE    NOT NULL,
    apptime  TIME    NOT NULL,
    PRIMARY KEY (aid),
    FOREIGN KEY (cid, birthym) REFERENCES pregnancies,
    FOREIGN KEY (pid) REFERENCES midwives
);

CREATE TABLE notes
(
    nid      INTEGER NOT NULL,
    aid      INTEGER NOT NULL,
    notedate DATE    NOT NULL,
    notetime TIME    NOT NULL,
    PRIMARY KEY (nid),
    FOREIGN KEY (aid) REFERENCES appointments
);

CREATE TABLE technicians
(
    techid INTEGER     NOT NULL,
    tname  VARCHAR(30) NOT NULL,
    ttel   VARCHAR(20) NOT NULL,
    PRIMARY KEY (techid)
);

CREATE TABLE tests
(
    tid       INTEGER NOT NULL,
    ramq      VARCHAR(12),
    bid       INTEGER,
    aid       INTEGER NOT NULL,
    techid    INTEGER,
    pscrpdate DATE    NOT NULL,
    testdate  DATE,
    examdate  DATE,
    result    VARCHAR(100),
    PRIMARY KEY (tid),
    FOREIGN KEY (ramq) REFERENCES mothers,
    FOREIGN KEY (bid) REFERENCES babies,
    FOREIGN KEY (aid) REFERENCES appointments,
    FOREIGN KEY (techid) REFERENCES technicians,
    CHECK (examdate IS NULL OR examdate >= pscrpdate)
);