CREATE DATABASE swimmINgPool;

USE swimmINgPool;

CREATE TABLE Course (
courseID INT PRIMARY KEY,
level VARCHAR(30),
sessions VARCHAR (30),
INstructORName VARCHAR(30),
startDATE DATE,
lessionTIME TIME
);

CREATE TABLE Members(
memeberID INT PRIMARY KEY,
firstName VARCHAR(30),
surName VARCHAR(30),
DOB DATE,
city VARCHAR(20),
address VARCHAR(50)
);

CREATE TABLE Lessons (
lessonID INT PRIMARY KEY,
courseID INT,
memberID INT
);
ALTER TABLE Lessons ADD FOREIGN KEY (memberID) REFERENCES Members(memeberID);
ALTER TABLE Lessons ADD FOREIGN KEY (courseID) REFERENCES Course(courseID);
-- ----------------------------------------------------------------------------------------------------------
USE swimmINgPool;
INSERT INTO Course (courseID, sessions, INstructORName, startDATE, lessionTIME)
VALUES (1001,'AM','Zak Pardis','2022-12-1','09:00');
INSERT INTO Course (courseID, level, sessions, INstructORName, startDATE, lessionTIME)
VALUES (1002,'Level 1','AM', 'Timothy Jones','2022-12-1','09:00');
INSERT INTO Course (courseID, level, sessions, INstructORName, startDATE, lessionTIME)
VALUES (1003, 'Level 1','AM','Narayan Khosla','2022-12-1','09:00');
INSERT INTO Course (courseID, level, sessions, INstructORName, startDATE, lessionTIME)
VALUES (1004, 'Level 1','AM','WaqAS Ahmad','2022-12-1','09:00');
INSERT INTO Course (courseID, level, sessions, INstructORName, startDATE, lessionTIME)
VALUES (1005, 'Level 2','PM','Zak PARDIS','2022-12-1','01:30');
INSERT INTO Course (courseID, level, sessions, INstructORName, startDATE, lessionTIME)
VALUES (1006, 'Level 1','PM','Narayan Khosla','2022-12-1','01:30');
INSERT INTO Course (courseID, level, sessions, INstructORName, startDATE, lessionTIME)
VALUES (1007, 'Level 2','PM','WaqAS Ahmad','2022-12-1','01:30');
INSERT INTO Course (courseID, level, sessions, INstructORName, startDATE, lessionTIME)
VALUES (1008, 'Level 2','PM','Timothy Jones','2022-12-1','01:30');
-- ------------------------------------------------------------------------------------------------------------
USE swimmINgPool;
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (101,'Aftab','Malik','1995-12-1','London', 'E17 5LG, United KINdom, London');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (102,'Abdul','Quaiyoum','1992-12-1','ManchestOR', '9PY LGP, United KINdom, ManchestOR');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (103,'Abdul','HASsan','1997-10-1','ManchestOR', '9PY LGP, United KINdom, ManchestOR');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (104,'Prateem','BhANDari','1989-7-10','London', '9PY LGP, United KINdom, London');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (105,'Mohammed','Anwar','1988-7-10','London', '9PY LGP, United KINdom, London');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (106,'ElIN','Thapa','1999-7-10','BirmINgham', '9PY LGP, United KINdom, BirmINgham');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (107,'Ryan','Beckles','2000-7-10','BirmINgham', '7NP LGP, United KINdom, BirmINgham');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (108,'GeORge','Blajiu','1988-7-10','London', '9PY LGP, United KINdom, London');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (109,'Murtadha','Al-Doujaily','1993-7-10','BirmINgham', '9PY LGP, United KINdom, BirmINgham');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (1010,'NASim','Derwish','2010-7-10','BirmINgham', '7NP LGP, United KINdom, BirmINgham');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (1011,'AvINASh','Ramoo','1998-11-10','London', '9PY LGP, United KINdom, London');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (1012,'Zakaria','Ali','1992-7-10','BirmINgham', '9PY LGP, United KINdom, BirmINgham');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (1013,'Robia','BAShir','2002-12-10','Manchester', '7NP LGP, United KINdom, Manchester');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (1014,'Joshua','Pembele','1989-11-10','London', '9PY LGP, United KINdom, London');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (1015,'Christopher','Wright','1996-9-10','Manchester', '9PY LGP, United KINdom, Manchester');
INSERT INTO Members (memeberID, firstName, surName, DOB, city, address)
VALUES (1016,'Akram','Dakik','2002-10-1','Manchester', '7NP LGP, United KINdom, Manchester');

-- -------------------------------------------------------------------------------------------------
USE swimmINgPool;
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (1, 1001, 101);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (2, 1001, 102);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (3, 1001, 103);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (4, 1006, 104);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (5, 1006, 105);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (6, 1006, 106);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (7, 1006, 107);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (8, 1002, 108);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (9, 1002, 109);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (10, 1004, 1010);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (11, 1004, 1011);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (12, 1004, 1012);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (13, 1004, 1013);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (14, 1004, 1014);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (15, 1001, 1015);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (16, 1001, 1016);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (17, 1006, 101);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (18, 1006, 102);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (19, 1006, 103);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (20, 1005, 104);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (21, 1005, 105);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (22, 1005, 106);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (24, 1008, 108);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (25, 1008, 109);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (26, 1007, 1010);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (27, 1007, 1011);
INSERT INTO lessons (lessonID, courseID, memberID)
VALUES (28, 1007, 1012);
-- ---------------------------------------------------------------------------------------
-- A ---
-- 1.
USE swimmINgPool;
SELECT * FROM Course WHERE courseID<5 AND INstructORName='Zak PARDIS';
-- 2. ----------------------------------------
USE swimmINgPool;
SELECT * FROM Course WHERE courseID>5 AND (sessions='AM' OR sessions='PM');
SELECT * FROM Course WHERE courseID>5 AND sessions IN( 'AM','PM');
-- ----------------------------------------------------------------------------------------
-- B--------
-- 1. 
USE swimmINgPool;
SELECT * FROM Course WHERE courseID<5 AND INstructORName='Timothy Jones' ORder by startDATE ASc;
-- 2.
USE swimmINgPool;
SELECT * FROM Course WHERE courseID>5 AND (sessions='AM' OR sessions='PM');
SELECT * FROM Course WHERE courseID>5 AND sessions IN( 'AM','PM');

-- C -------
-- 1.
USE swimmINgPool;
SET SQL_SAFE_UPDATES = 0;
UPDATE Members SET address='9 The Cl, WINchester SO23 9LS' WHERE firstName='Aftab';
UPDATE Members SET address='Tremona Rd, Southampton SO16 6YD' WHERE surName='Anwar';
UPDATE Members SET address='Queen Anne Dr, Bournemouth, WimbORne BH21 3BA' WHERE memeberID=104;
-- 2.
USE swimmINgPool;
SET SQL_SAFE_UPDATES = 0;
UPDATE course SET startDATE='2023-1-5' , lessionTIME='09:30' WHERE courseID=1002;
UPDATE course SET startDATE='2023-2-1' , lessionTIME='09:30' WHERE startDATE='2022-12-1';
UPDATE course SET startDATE='2022-12-10' , lessionTIME='02:00' WHERE courseID=1005 AND INstructORName='Zak PARDIS';
-- D --------
-- 1.
USE swimmINgPool;
SELECT mIN(lessonID) AS 'Smallest ID', max(lessonID) AS 'Biggest ID' FROM Lessons;
-- 2.
USE swimmINgPool;
SELECT mIN(memeberID) AS 'Smallest ID', max(memeberID) AS 'Biggest ID' FROM Members;

-- E --------
-- 1.
USE swimmINgPool;
SELECT count(memeberID) FROM Members;
-- 2.
USE swimmINgPool;
SELECT count(sessions) FROM course;
-- 3.
USE swimmINgPool;
SELECT avg(lessionTIME) FROM course;

-- F ---
USE swimmINgPool;
SELECT concat(firstName, ' ', surName) AS 'Full Name' FROM Members WHERE surName LIKE 'A%';
SELECT concat(firstName, ' ', surName) AS 'Full Name' FROM Members WHERE surName LIKE '%A';
SELECT concat(firstName, ' ', surName) AS 'Full Name' FROM Members WHERE surName LIKE '%ab%';
SELECT concat(firstName, ' ', surName) AS 'Full Name' FROM Members WHERE firstName LIKE '_b%';
-- ---------
SELECT concat(firstName, ' ', surName) AS 'Full Name' FROM Members WHERE surName LIKE 'a%' AND  length(surName)>=3;
SELECT concat(firstName, ' ', surName) AS 'Full Name' FROM Members WHERE surName LIKE 'a__%';
-- -------------
SELECT concat(firstName, ' ', surName) AS 'Full Name' FROM Members WHERE surName LIKE 'a%y';
SELECT concat(firstName, ' ', surName) AS 'Full Name' FROM Members WHERE surName NOT LIKE 'a%' AND surName LIKE '%y';

