DROP TABLE if exists GUEST_CLASS;
DROP TABLE if exists CLASS;
DROP TABLE if exists GUEST;

CREATE TABLE GUEST
(ID Int PRIMARY KEY IDENTITY (1,1),
 Name char(40),
 Note char(255),
 DOB char (10),
 CakeDay char(10),
 Status char(40)
)

CREATE TABLE CLASS
(ID Int PRIMARY KEY IDENTITY (1,1),
 Name char(40),
)

CREATE TABLE GUEST_CLASS
(GuestID int,
 ClassID int,
 ClassLvls int
 )

 ALTER TABLE GUEST_CLASS
 ADD FOREIGN KEY (GuestID) REFERENCES GUEST(ID);

 ALTER TABLE GUEST_CLASS
 ADD FOREIGN KEY (ClassID) REFERENCES CLASS(ID);

 
 INSERT INTO CLASS(Name)
 VALUES ('Dragon School'),
		('Dragon Care'),
		('Dragon Flying'),
		('Bull Riding');

INSERT INTO GUEST(Name, Note, DOB, CakeDay, Status)
VALUES  ('Anna','Brave','2003-10-10', '4802-34-09','Chillin'),
		('Elsa','Powerful','1223-69-12', '4802-34-09','Spirited'),
		('Olaf','Cute','1223-69-12', '4802-34-09','Singing'),
		('Kristoff','Funny','1223-69-12', '4802-34-09','Planning'),
		('Hans','Evil','1223-69-12', '4802-34-09','Plotting');

INSERT INTO GUEST_CLASS (GuestID,  ClassID, ClassLvls)
VALUES (1, 4, 3),
	   (1, 3, 2),
	   (5, 1, 10),
	   (2, 2, 1),
	   (3, 1, 4);

SELECT * FROM GUEST_CLASS;
