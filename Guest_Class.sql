DROP TABLE if exists Room_Stay;
DROP TABLE if exists Rooms;
DROP TABLE if exists Sale_Inventory_Update;
DROP TABLE if exists Sale;
DROP TABLE if exists Service;
DROP TABLE if exists Inventory;
DROP TABLE if exists Supply;
DROP TABLE if exists Tavern;
DROP TABLE if exists Owner;
DROP TABLE if exists Role;
DROP TABLE if exists Location;
DROP TABLE if exists GUEST_CLASS;
DROP TABLE if exists CLASS;
DROP TABLE if exists GUEST;
DROP TABLE if exists Status; 
DROP TABLE if exists TavernBackUp;

 CREATE TABLE Status
(
	ID INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Description varchar (40) NOT NULL
);

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
(GuestID int REFERENCES GUEST(ID),
 ClassID int REFERENCES CLASS(ID),
 ClassLvls int
 )


CREATE TABLE Location
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	AddressOne varchar(40) NOT NULL,
	AddressTwo varchar(40), 
	St varchar (2) NOT NULL,
	Zip int NOT NULL
);

CREATE TABLE Role
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	RoleName varchar(40) NOT NULL,
	RoleDescription varchar(40) NOT NULL
)

CREATE TABLE Owner
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Name varchar(40) NOT NULL,
	RoleId int REFERENCES Role(ID),
);

CREATE TABLE Tavern
(
	ID INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Name varchar(40) NOT NULL,
	Floors varchar(40),
	LocationId int REFERENCES Location(ID),
	OwnerId int NOT NULL REFERENCES Owner(ID),
);
CREATE TABLE Supply
(	
	ID INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Name varchar(40) NOT NULL,
	UNIT varchar(40) NOT NULL,
);

CREATE TABLE Inventory
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Price int NOT NULL,
	Qty int NOT NULL,
	UpDated varchar(40) NOT NULL,
	StatusID int NOT NULL REFERENCES Status(Id),
	TavernID int REFERENCES Tavern(Id),
	SupplyID int NOT NULL REFERENCES Supply(Id),
);

CREATE TABLE Service
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Name char(40) NOT NULL,
	Price dec NOT NULL, 
	StatusID int NOT NULL REFERENCES Status(Id),
);


CREATE TABLE Sale
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	GuestName varchar(40) NOT NULL,
	InventoryId int REFERENCES Inventory(Id),
	ServiceId int REFERENCES Service(Id), 
	TavernID int REFERENCES Tavern(Id),
	Qty int NOT NULL,
	Total int NOT NULL
);

CREATE TABLE Sale_Inventory_Update
(
	SaleID int NOT NULL PRIMARY KEY,
	InventoryID int, 
	UpdatedQty int Not NULL,
)

 CREATE TABLE Rooms
(
	ID int NOT NULL PRIMARY KEY IDENTITY,
	StatusID int REFERENCES Status(Id),
	TavernID int REFERENCES Tavern(Id),
	Price decimal (10,2) NOT NULL
)

CREATE TABLE Room_Stay
(
	SaleID int NOT NULL PRIMARY KEY IDENTITY,
	GuestName varchar(40) NOT NULL,
	RoomID int REFERENCES Rooms(Id),
	DATEBOOKED varchar(10),
	NumNight int NOT NULL,
	Total int NOT NULL
)

INSERT INTO Status
(Description)
VALUES
	('Active'),
	('Inactive'),
	('Not Handicapped'),
	('Handicapped')

 INSERT INTO CLASS(Name)
 VALUES ('Dragon School'),
		('Dragon Care'),
		('Dragon Flying'),
		('Bull Riding');

INSERT INTO GUEST(Name, Note, DOB, CakeDay, Status)
VALUES  ('Anna','Brave', '2007-05-08', '2007-05-08','Chillin'),
		('Elsa','Powerful','1992-01-12', '4802-34-09','Spirited'),
		('Olaf','Cute','1980-08-08', '4802-34-09','Singing'),
		('Kristoff','Funny','2019-12-12', '4802-34-09','Planning'),
		('Jake', 'Blah','2018-05-05','2019-09-10', 'Blah...'),
		('Hans','Evil','2020-05-05', '4802-34-09','Plotting');

INSERT INTO GUEST_CLASS (GuestID,  ClassID, ClassLvls)
VALUES (1, 4, 3),
	   (1, 3, 2),
	   (5, 1, 10),
	   (2, 2, 1),
	   (2, 1, 15),
	   (5, 3, 10),
	   (3, 3, 10),
	   (2, 4, 25),
	   (6, 3, 5),
	   (4, 1, 1),
	   (3, 1, 4);

INSERT INTO Location
(AddressOne,
 AddressTwo,
 St,
 Zip)
VALUES
    ('987 East Dr.', 'Ste G', 'NJ', 00254),
    ('101 North St.', '','PA', 19100),
    ('123 W Well St.', '' , 'DE', 09050),
    ('1 Imagination Ave.', '' ,'AK', 99998),
    ('321 E LLEW St.', '' ,'DE', 05090);

INSERT INTO Role
(RoleName, 
 RoleDescription)
VALUES
    ('Owner', 'Owns the Tavern'),
    ('Manager', 'Manages the Tavern'),
    ('Cook','Cooks the Food'),
    ('Sever','Serves the Food'),
    ('Cleaner','Cleanes the Tavern');

INSERT INTO Owner
( Name, 
 RoleId)
VALUES
    ('Anna', 1),
    ('Elsa', 2),
    ('Olaf', 3),
    ('Kristoff', 4),
    ('Hans', 5),
	('Bob', Null)

INSERT INTO Tavern
(Name,
 Floors,
 LocationId,
 OwnerId) 
VALUES
    ('Northside', 109, 1, 2),
    ('Westside', 54, 2, 3),
    ('Eastside', 8, 3, 1),
    ('We Side', 4, 4, 5),
    ('UpsideDown', 1, 5, 4);

INSERT INTO Supply
(Name, 
 UNIT)
VALUES
	('Beer', 'barrel'),
	('Bread', 'Loaf'),
	('Wine', 'Cup'),
	('Water', 'OZ'),
	('potage', 'Bowl');

INSERT INTO Inventory
(Price,
 Qty,
 UpDated,
 StatusID,
 TavernID,
 SupplyID)
VALUES
    (5, 10, '2020-02-02', 2, 1, 3),
    (3, 3, '2020-10-01', 2, 4, 4),
    (2, 15, '2020-15-01', 2, 3, 2),
    (4, 0 , '2020-05-02', 1, 2, 1),
    (1, 0, '1987-26-05', 2, 2, 5);	
	   

INSERT INTO Service
( Name, 
 Price,
 StatusID)
VALUES
	('Pool', 5 , 2),
	('Darts', 2 , 2),
	('Bubble Hockey', 25, 1),
	('Sword Sharpen', 75, 2),
	('Riding Dragon', 100, 2);

INSERT INTO Sale
(GuestName,
InventoryId, 
ServiceId,
Qty,
Total,
TavernID)
VALUES
	('Kitty', 2, 3, 10, 25, 5),
	('Tiger', 3, 1, 1, 10, 5),
	('Bubbles', 5, 4, 1, 100, 1),
	('Prince', 1, 2, 1, 400, 2),
	('Roco', 2, 2, 1, 20, 4),
	('Llama', Null, 5, 2, 2150, 2),
	('Poncho', 5, 1, 4, 150, 4),
	('Candi', 4, 4, 4, 400, 4),
	('Po', 2, 3, 4, 1150, 1),
	('Hinney', 5, Null, 5, 5, 5),
	('Emily', 3, 3, 3,30, 3),
	('Paulie', 3, 2,5, 30, 1);

INSERT INTO Sale_Inventory_Update
(SaleID, 
 InventoryID,
 UpdatedQty)
VALUES
	(1,5,499),
	(2,4,299),
	(3,3,99),
	(4,2,9),
	(5,4,298),
	(6,1,0),
	(7,2,8);
	--(8,3,1000);

INSERT INTO Rooms
(StatusID,
 TavernID,
 Price)
 VALUES
	(3,1,100),
	(3,2,150),
	(3,3,200),
	(4,4,300),
	(3,5,1500),
	(3,5,1000),
	(4,5,850),
	(3,3,120.50),
	(4,1,230),
	(3,2,320),
	(3,5,6300),
	(3,5,80);

INSERT INTO Room_Stay
(GuestName, 
 RoomID,
 DATEBOOKED,
 NumNight,
 Total)

VALUES
('Joe Jack', 2, '2000-10-10', 1, 300),
('Billy Bob', 3, '2019-07-05', 5, 500),
('Jesse Jones', 6, '1945-09-07', 54, 800),
('Al Alferd',4, '2003-12-30', 6, 50),
('Zac Zoey', 9, '2010-06-09', 7, 1500),
('Joe Jack', 7, '2019-08-12', 6, 5600),
('Abcd Wyz', 11, '2017-10-25', 1, 5600),
('Henry Hetz', 1, '2018-10-02', 3, 30),
('Trevor Thompson', 5, '2018-09-03', 9, 450),
('Henry Hetz ll', 10, '2019-15-19', 10, 400),
('Vern Vattle', 8, '2019-12-30', 14, 890),
('Henry He', 1, '2020-01-20', 3, 30);

--#1
SELECT * FROM Owner
LEFT JOIN Role ON (Owner.RoleId = Role.Id)

--#2
SELECT COUNT(GUEST_CLASS.ClassID) as StudentCount FROM GUEST_CLASS
LEFT JOIN CLASS ON(CLASS.ID = GUEST_CLASS.ClassID) 
GROUP BY GUEST_CLASS.ClassID
 
--#3
SELECT Guest.Name, Class.Name, (CASE WHEN ClassLvls < 6 THEN 'Beginner'
			WHEN ClassLvls BETWEEN 5 AND 10 THEN 'Intermediate' 
			WHEN ClassLvls> 10 THEN 'Expert' END) as ClassLvl  FROM GUEST_CLASS
LEFT JOIN GUEST ON (GUEST_CLASS.GuestID = GUEST.ID)
LEFT JOIN CLASS ON (GUEST_CLASS.ClassID = CLASS.ID)

--#4
GO
IF OBJECT_ID (N'LvlGroup') IS NOT NULL
DROP FUNCTION LvlGroup;
GO
CREATE FUNCTION dbo.LvlGroup (@lvl int)
Returns varchar (30)
AS
BEGIN
DECLARE @LvlString varchar(30)
SELECT 
	@LvlString = CASE WHEN @lvl < 6 THEN 'Beginner'
			WHEN @lvl BETWEEN 5 AND 10 THEN 'Intermediate' 
			WHEN @lvl> 10 THEN 'Expert' END
Return @LvlString 

END;

GO

SELECT dbo.LvlGroup(11) 

--#5
GO
IF OBJECT_ID (N'IFBooked') IS NOT NULL
DROP FUNCTION IfBooked;
GO
CREATE FUNCTION IfBooked (@date varchar(20))
Returns Table
AS
Return
(
SELECT SaleID, Room_Stay.GuestName, RoomID, DATEBOOKED,Tavern.Name as TavernName From Room_Stay 
LEFT JOIN Rooms ON (Room_Stay.RoomID = Rooms.ID)
LEFT JOIN Tavern ON (Rooms.TavernID = Tavern.ID)
where @date != Room_Stay.DATEBOOKED
);
GO
SELECT * FROM IfBooked ('2000-10-10')

--#6
GO
IF OBJECT_ID (N'Range') IS NOT NULL
DROP FUNCTION Range;
GO
CREATE FUNCTION Range (@min int,@max int)
Returns Table
AS
Return
(
SELECT RoomID, Room_Stay.Total, Tavern.Name as TavernName From Room_Stay 
LEFT JOIN Rooms ON (Room_Stay.RoomID = Rooms.ID)
LEFT JOIN Tavern ON (Rooms.TavernID = Tavern.ID)
where Room_Stay.Total BETWEEN @min AND @max
);
GO
SELECT * FROM Range(100,1500)

--#7
GO 
DROP PROCEDURE IF EXISTS InsertIntoRoomsMin

GO
CREATE PROCEDURE InsertIntoRoomsMin
@max decimal (10,2),
@min decimal (10,2)
AS
BEGIN 
DECLARE @tavid int
DECLARE @newprice decimal (10,2)
DECLARE @roommin decimal (10,2)
SET NOCOUNT ON;
SELECT 
@roommin = MIN (Rooms.Price)From Rooms
LEFT JOIN Tavern ON (Rooms.TavernID = Tavern.ID)
where Rooms.Price BETWEEN @min AND @max
SELECT @tavid = FLOOR(RAND()*(5-1+1))+1
SELECT @newprice = (@roommin - 0.01)
INSERT INTO Rooms (StatusID, TavernID, Price)
VALUES (3, @tavid, @newprice) 
END

GO
EXEC dbo.InsertIntoRoomsMin @max=1500, @min=50;
SELECT * FROM Rooms 







