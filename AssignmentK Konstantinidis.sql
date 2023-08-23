CREATE DATABASE IF NOT EXISTS carFix;
USE carFix;
CREATE TABLE Member(
MemberID VARCHAR(10) PRIMARY KEY,
MFName VARCHAR(20),
MLName VARCHAR(20),
MLoc VARCHAR(20)
);

CREATE TABLE Vehicle(
VehReg VARCHAR(10) PRIMARY KEY,
VehMake VARCHAR(10),
VehModel VARCHAR(10),
MemberID VARCHAR(10)
);

CREATE TABLE Engineer(
EngID INTEGER PRIMARY KEY,
EFName VARCHAR(20),
ELName VARCHAR(20)
);

CREATE TABLE EngVan(
VanReg VARCHAR(10) PRIMARY KEY,
VanMake VARCHAR(10),
VanModel VARCHAR(10),
EngID INTEGER,
VMileage INTEGER
);

CREATE TABLE Breakdown(
BDID INTEGER(10) PRIMARY KEY,
VehReg VARCHAR(10),
VanReg VARCHAR(10),
BDDATE DATE,
BDTIME TIME,
BDLoc VARCHAR(20)
);
ALTER TABLE Vehicle ADD FOREIGN KEY (MemberID) REFERENCES Member(MemberID);
ALTER TABLE EngVan ADD FOREIGN KEY (EngID) REFERENCES Engineer(EngID);
ALTER TABLE Breakdown ADD FOREIGN KEY (VehReg) REFERENCES Vehicle(VehReg);
ALTER TABLE Breakdown ADD FOREIGN KEY (VanReg) REFERENCES EngVan(VanReg);

-- 		TASK 2

INSERT INTO Member(MemberID, MFName, MLName, MLoc) VALUES 
(1,'Tyrion', 'Lannister', 'London'),
(2,'Daenerys','Targaryen','Richmond'),
(3,'Arya','Stark','Manchester'),
(4,'John','Snow','Leeds'),
(5,'Cersei','Lannister','London'),
(6,'Sansa','Stark','Amsterdam');


INSERT INTO Vehicle(VehReg, VehMake, VehModel, MemberID) VALUES 
(1,'Toyota','Corolla',1),
(2,'Nissan','Primer',2),
(3,'BMW','V80',3 ),
(4,'Mercedes','AMG',4 ),
(5,'Jeep','Cherokee',5 ),
(6,'Honda','Civic',2 ),
(7,'Subaru','Impreza',3 ),
(8,'Kia','Ceed',1 ),
(9,'Nissan','Micra',6);

INSERT INTO Engineer(EngID, EFName, ELName)VALUES
(1,'Khal','Drogo'),
(2,'Margaery','Tyrell'),
(3,'Oberyn','Martell');

INSERT INTO EngVan(VanReg, VanMake, VanModel,EngID,VMileage)VALUES
(1,'Ford','Transit',1,2000),
(2,'Fiat','Ducato',2,3000),
(3,'Renault', 'Master',3,5000),
(4, 'Opel', 'Combo',2,4000),
(5, 'Citroen','Jumpy',1,500);

INSERT INTO Breakdown(BDID, VehReg, VanReg, BDDATE, BDTIME, BDLoc) VALUES
(1, 2, 1, '2023-07-12', '17:15','London'),
(2, 4, 2,'2023-07-12', '17:00', 'Brighton'),
(3, 6, 5, '2023-04-25', '16:00', 'Bristol'),
(4, 8, 3, '2023-04-21','13:00','Manchester'),
(5, 1, 4, '2023-04-11','12:00','Leeds'),
(6, 2, 2,'2023-03-09','11:30','London'),
(7, 2, 4,'2023-01-01','05:20','Paris'),
(8, 3, 5,'2023-05-13','12:30','Liverpool'),
(9, 5, 1,'2023-02-11','13:45','Ipswich'),
(10,7, 3,'2023-02-12','12:35','Guildford'),
(11,1, 2,'2023-05-17','18:50','Kingston'),
(12,3,4,'2023-06-30','19:45','Amsterdam');

-- 		TASK 3
-- 1. The names of members who live in  London.
SELECT CONCAT(MFName,' ',MLName) AS fullname FROM Member WHERE MLoc = 'London'; 
-- 2. All cars registered with the company Nissan.
SELECT VehMake AS Nissan_Cars FROM Vehicle WHERE VehMake = 'Nissan';
-- 3. The number of engineers that work for the company.
SELECT COUNT(EngID) FROM Engineer;
-- 4. The number of members registered.
SELECT COUNT(MEMBERID) FROM Member;
-- 5. All the breakdown after a particular date
SELECT *  FROM Breakdown WHERE BDDATE > '2023-02-11';
-- 6. All the breakdown between 2 dates
SELECT *  FROM Breakdown HAVING BDDATE BETWEEN '2023-01-02' AND '2023-05-07' ;
-- 7. The number of times a particular vehicle has broken down
SELECT VehReg, COUNT(BDID) AS'BDCases' FROM Breakdown GROUP BY VehReg;
-- 8.The number of vehicles broken down more than once
SELECT VehReg, COUNT(BDID) AS'BDCases' FROM Breakdown GROUP BY VehReg HAVING COUNT(BDID)> 1;

-- 		TASK 4
CREATE TABLE MshipType(
MTID INTEGER PRIMARY KEY,
MType VARCHAR(6),
MPrice DECIMAL);

INSERT INTO MShipType (MTID,MType,MPrice) VALUES
(1,'Gold', 99.99),
(2,'Silver', 59.99),
(3,'Bronze', 39.99);
select * from MshipType;
-- 		TASK 5 
/* Using the alter command add in the Vehicle table MTID column, set it to FK and allow null. 
Then using the update command assign a MTID to each vehicle.
*/
ALTER TABLE Vehicle ADD COLUMN MTID INT NULL;
ALTER TABLE Vehicle ADD FOREIGN KEY (MTID) REFERENCES MshipType(MTID);
UPDATE Vehicle SET MTID = 1  WHERE VehReg= 1 ;
UPDATE Vehicle SET MTID = 2  WHERE VehReg= 2 ; 
UPDATE Vehicle SET MTID = 3  WHERE VehReg= 3 ; 
UPDATE Vehicle SET MTID = 2  WHERE VehReg= 4 ; 
UPDATE Vehicle SET MTID = 3  WHERE VehReg= 5 ; 
UPDATE Vehicle SET MTID = 1  WHERE VehReg= 6 ; 
UPDATE Vehicle SET MTID = 2  WHERE VehReg= 7 ; 
UPDATE Vehicle SET MTID = 3  WHERE VehReg= 8 ; 

-- 		TASK 6 
-- 1. All the vehicles a member owns.
SELECT CONCAT(A.VehMake,'  ', A.VehModel) AS 'Vehicles', CONCAT(B.MFName,'  ',B.MLName) AS 'Members' FROM Vehicle A CROSS JOIN Member B ON A.MemberID=B.MemberID;
-- 2. The number of vehicles for each member in descending order.
SELECT COUNT(C.VehReg) AS 'Num of vehicles', CONCAT(D.MFName,'  ',D.MLName) AS 'Members is desc order' FROM Vehicle C LEFT JOIN Member D ON C.MemberID=D.MemberID 
GROUP BY D.MFName, D.MLName ORDER BY D.MLName DESC ;
-- 3. The number of vans driven by a particular engineer.
SELECT COUNT(E.VanReg) AS 'Num of vans', CONCAT(F.EFName,'  ',F.ELName) AS "Engineer's full Name" FROM EngVan E LEFT JOIN Engineer F ON E.EngID=F.EngID
GROUP BY F.EFName, F.ELName;
-- 4. All vehicles that have broken down in a particular location along with member details.
SELECT CONCAT(G.VehMake,'  ', G.VehModel) AS 'Broken Vehicles', H.BDLoc AS 'Location', CONCAT(I.MFName,'  ',I.MLName) AS 'Members' 
FROM Vehicle G JOIN Breakdown H ON G.VehReg = H.VehReg
JOIN Member I ON G.MemberID=I.MemberID
HAVING H.BDLoc='London';
-- 5. A list of all vehicles that broke down along with the member details and the engineer who attended.
SELECT CONCAT(J.VehMake,'  ',J.VehModel) AS 'Broken vehicles', CONCAT(K.MFName,'  ',K.MLName) AS "Member's full name", CONCAT(L.EFName,'  ',L.ELName) AS "Engineer's name"
FROM Vehicle J JOIN Member K ON J.MemberID=K.MemberID
JOIN Breakdown M ON J.VehReg = M.VehReg
JOIN EngVan N ON M.VanReg = N.VanReg
JOIN Engineer L ON L.EngID = N.EngID;
-- 6. A list of all breakdown along with member and engineer details between two dates.
SELECT O.BDID, CONCAT(P.MFName,'  ',P.MLName) AS "Member's full name", CONCAT(Q.EFName,'  ',Q.ELName) AS "Engineer's name"
FROM Vehicle R JOIN Member P ON R.MemberID=P.MemberID
JOIN Breakdown O ON O.VehReg = R.VehReg
JOIN EngVan S ON O.VanReg = S.VanReg
JOIN Engineer Q ON S.EngID = Q.EngID
WHERE O.BDDATE BETWEEN  '2023-01-01' AND '2023-06-30';

-- 7. A further 3 relational queries of your choice that are meaningful to the company.

-- a. A list of all vehicles that brokedown between 07:00 and 17:00 
-- with the time & location of the incidents along with their membership type 
SELECT CONCAT(T.VehMake,'  ',T.VehModel) AS 'Vehicle', U.BDLoc AS 'Location of incident', U.BDTIME AS 'Time of incident', V.MType AS 'Class'
FROM  Vehicle T JOIN Breakdown U ON T.VehReg = U.VehReg
JOIN MshipType V ON T.MTID = V.MTID
WHERE U.BDTIME BETWEEN '07:00'AND '17:00';

-- b. A list of all engineers and their vans that repaired vehiclees between March and June 
-- and all the locations that the member's are based
SELECT CONCAT(W.EFName,'  ',W.ELName) AS "Engineer's name", CONCAT(X.VanMake,'  ',X.VanModel) AS "Engineer's van", Y.MLoc AS 'City of delivery'
FROM Engineer W JOIN EngVan X ON W.EngID = X.EngID
JOIN Breakdown Z ON X.VanReg = Z.VanReg
JOIN Vehicle A ON Z.VehReg = A.VehReg
JOIN Member Y ON A.MemberID=Y.MemberID
WHERE Z.BDDATE BETWEEN  '2023-03-01' AND '2023-06-30';

-- c. display the member's full name and location 
--  when we are passing the member's ID number 
DELIMITER @@
CREATE PROCEDURE returnMember(IN idmem INT,OUT memberDetails VARCHAR(100)) 
	BEGIN
		SELECT CONCAT(MLName,' ',MFNAME,' - ',MLoc) INTO memberDetails 
	FROM Member WHERE MemberID = idmem;
    END @@ 
-- we can call values between 1 - 5 
CALL returnMember(1,@outResult);
SELECT @outResult AS "Member's details";
DROP PROCEDURE returnMember;

-- 		TASK 7
/*
	Using W3Schools or any other resource research the following functions – Avg, Max, Min, Sum.  Explain with examples how each one is used.  
    Create a separate database with sample data to illustrate your examples.  
    However please do not copy from the websites.
*/

CREATE DATABASE aggFunctions;
USE aggFunctions;
CREATE TABLE demonstration(
demo1 INTEGER NOT NULL);

INSERT INTO demonstration(demo1) VALUES(
25);
INSERT INTO demonstration(demo1) VALUES(
50);
INSERT INTO demonstration(demo1) VALUES(
75);
INSERT INTO demonstration(demo1) VALUES(
100);

SELECT * FROM demonstration;
-- so we created a collum with the values 25 50 75 100
-- Avg returns  the average of the values we add into the parameter () 
SELECT AVG(demo1) FROM demonstration; 		-- it displays 62.5
-- Max returns the maximum of the values 
SELECT MAX(demo1) FROM demonstration; 		-- it displays 100
-- Min returns the minimum of the values given
SELECT MIN(demo1) FROM demonstration; 		-- it displays 25
-- SUM returns the total of the values asked 
SELECT SUM(demo1) FROM demonstration; 		-- it displays 250

-- 		TASK 8 

-- 1. If member owns more than one vehicle then has multi-car policy
SELECT CONCAT(A.MFName,' ',A.MLName) AS "Member's full name", COUNT(*) AS 'Num of cars',
	CASE
		WHEN COUNT(*) > 1 THEN 'Has multi-car policy'
		ELSE 'Does not have multi-car policy'
	END AS 'Car policy'
FROM  Vehicle B JOIN Member A ON A.MemberID=B.MemberID
GROUP BY B.MemberID;

-- 2. The number of times each car broken down
SELECT CONCAT(C.VehMake,' ',C.VehModel) AS "Car broken", COUNT(*) AS 'Times broken',
	CASE
		WHEN COUNT(*) > 1 THEN 'not reliable car'
		ELSE 'reliable car'
	END AS 'Reliability'
FROM  Vehicle C JOIN Breakdown D ON C.VehReg = D.VehReg
GROUP BY D.VehReg;

-- a. If more than twice then next premium to be increased by 10%
SELECT CONCAT(C.VehMake,' ',C.VehModel) AS "Car broken", COUNT(*) AS 'Times broken',
	CASE
		WHEN COUNT(*) > 2 THEN 'next premium to be increased by 10%'
		ELSE 'no increases'
	END AS 'Premium policy'
FROM  Vehicle C JOIN Breakdown D ON C.VehReg = D.VehReg
GROUP BY D.VehReg;

-- b. If twice then increase by 5%
SELECT CONCAT(C.VehMake,' ',C.VehModel) AS "Car broken", COUNT(*) AS 'Times broken',
	CASE
		WHEN COUNT(*) = 2 THEN 'premium increased by 5%'
        WHEN COUNT(*) > 2 THEN 'next premium to be increased by 10%'
		ELSE 'no increases'
	END AS 'Premium policy'
FROM  Vehicle C JOIN Breakdown D ON C.VehReg = D.VehReg
GROUP BY D.VehReg;
-- c. If once then no increase
SELECT CONCAT(C.VehMake,' ',C.VehModel) AS "Car broken", COUNT(*) AS 'Times broken',
	CASE
		WHEN COUNT(*) = 2 THEN 'premium increased by 5%'
        WHEN COUNT(*) > 2 THEN 'next premium to be increased by 10%'
		ELSE 'no increases'
	END AS 'Premium policy'
FROM  Vehicle C JOIN Breakdown D ON C.VehReg = D.VehReg
GROUP BY D.VehReg;
-- d. If not broken down then 10% discount
SELECT CONCAT(C.VehMake,' ',C.VehModel) AS "Car broken", COUNT(*) AS 'Times broken',
	CASE
		WHEN COUNT(*) = 2 THEN 'premium increased by 5%'
        WHEN COUNT(*) > 2 THEN 'next premium to be increased by 10%'
        WHEN COUNT(*) = 0 THEN 'you have 10% discount'
		ELSE 'no increases'
	END AS 'Premium policy'
FROM  Vehicle C JOIN Breakdown D ON C.VehReg = D.VehReg
GROUP BY C.VehReg;
