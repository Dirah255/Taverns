DROP TABLE if exists GUEST_CLASS;
DROP TABLE if exists CLASS;
DROP TABLE if exists GUEST;
DROP TABLE if exists Room_Stay;
DROP TABLE if exists Rooms;

CREATE TABLE GUEST
(ID Int PRIMARY KEY IDENTITY (1,1),
 Name varchar(40),
 Note varchar(255),
 DOB varchar(10),
 CakeDay varchar(10),
 Status varchar(40)
)

CREATE TABLE CLASS
(ID Int PRIMARY KEY IDENTITY (1,1),
 Name varchar(40),
)

CREATE TABLE GUEST_CLASS
(GuestID int,
 ClassID int,
 ClassLvls int
 )

 CREATE TABLE Rooms
(
	ID int NOT NULL PRIMARY KEY IDENTITY,
	StatusID int,
	TavernID int
)

CREATE TABLE Room_Stay
(
	SaleID int NOT NULL PRIMARY KEY IDENTITY,
	GuestName varchar(40) NOT NULL,
	RoomID int REFERENCES Rooms(Id),
	DATEBOOKED varchar(40),
	Rate int
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

INSERT INTO Rooms
(StatusID,
 TavernID)
 VALUES
	(3,1),
	(3,2),
	(3,3),
	(4,4),
	(3,5),
	(3,5),
	(4,5),
	(3,3),
	(4,1),
	(3,2),
	(3,5),
	(3,5);

INSERT INTO Room_Stay
(GuestName, 
 RoomID,
 DATEBOOKED,
 Rate)

VALUES
('Joe Jack', 2, '10-45-122 to 12-54-2013', 300),
('Billy Bob', 3, '23-57-8975 to 23-57-35', 500),
('Jesse Jones', 6, '45-46-9087 to 45-45-86', 800),
('Al Alferd',4, '33-78-0975 to 45-78-9075', 50),
('Zac Zoey', 9, '34-67-0943 to 35-97-0145', 700),
('Joe Jack', 7, '19-78-122 to 12-34-5678', 5600),
('Abcd Wyz', 11, '12-78-4159 to 48-74-7820', 5600),
('Henry Hetz', 1, '76-35-9752 to 34-6069',30),
('Trevor Thompson', 5, '09-67 to 37-98-0842',450),
('Henry Hetz ll', 10, '76-35-9752 to 34-6069',400),
('Vern Vattle', 8, '09-46-463 to 45-76-9742',890),
('Henry He', 1, '76-35-9752 to 34-6069',30);





SELECT * FROM Room_Stay
WHERE Rate>100;

SELECT * FROM GUEST
ORDER BY Name DESC;

SELECT DISTINCT GuestName FROM Room_Stay;

SELECT * FROM Room_Stay WHERE SaleID BETWEEN 1 AND 10
ORDER BY RATE DESC 