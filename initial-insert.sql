INSERT INTO Author VALUES
 ('wahaj','Haji Gul Wahaj'),
 ('sharifi','A. Zia Sharifi'),
 ('khattab','M. Ismail Khattab');

INSERT INTO Course VALUES
 ('Networking','Fundamentals of Technical Computer Science'),
 ('Database','Fundamentals of Database Systems'),
 ('Maths','Fundamentals of Mathematics for Computer Science'),
 ('Programming','Fundamentals of Programming'),
 ('German','Deutsche Sprache und deutsche Kultur');

INSERT INTO Topic VALUES
 ('General Announcements','News regarding the whole program. Independent of courses.'),
 ('Timetable Changes','Any changes in the timetable.'),
 ('Course Announcements','Announcements concerning only individual courses.'),
 ('Important Announcements','Announcements that are very important');

INSERT INTO Article VALUES
  (NULL,'Welcome to the Lecture','The course will give an overview of database design and implementation. During this course we will step by step design and implement a database system that can be used over a web interface. In addition to the basic database design concepts the lecture will provide an overview over technologies to provide web interfaces to database systems.',1,'Course Announcements','wahaj','2010-11-13 16:31:17'),
  (NULL,'Changes in the timetable','Due to the concour exam that is taking place at Kabul University, all classes of this week will be postponed by one day. This does not apply to the German and Maths classes.',1,'Timetable Changes','wahaj','2010-11-15 00:22:13'),
  (NULL,'Welcome to the Lecture','In context of this preparation course the participants will get prepared to participate in the master program of computer science especially in the technical computer science module. Therefore they have to be able to  identify, analyze and build computer and network architectures. The structure of computer systems and computer networks and appropriate applications and services is the center of attention. The purposeful and exclusive usage of FOSS for realization of the practical tasks will give the participants the possibility to become acquainted with an effectively usage of alternative software solutions.',1,'Course Announcements','sharifi','2010-11-13 20:04:47'),
  (NULL,'Welcome to the Lecture','The lecture \"Fundamentals of Programming\" will give an overview of basic algorithms and data structures. The first part will deal with storing and retrieving data. The second part will cover graph algorithms and problem solving.',1,'Course Announcements','khattab','2010-11-14 22:44:54'),
  (NULL,'Topic for today','Today we will cover \'Numeral Systems\' in the maths class.',1,'Course Announcements','wahaj','2010-11-15 00:30:16'),
  (NULL,'Changes in the timetable','This week the German class will be on Tuesday.',1,'Timetable Changes','wahaj','2010-11-21 10:59:21');

INSERT INTO Relevant_For VALUES 
 (1,'Database'),
 (2,'Networking'),
 (2,'Database'),
 (2,'Programming'),
 (3,'Networking'),
 (4,'Programming'),
 (5,'Maths'),
 (6,'Maths'),
 (6,'German');