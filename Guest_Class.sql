DROP TABLE if exists Room_Stay;
DROP TABLE if exists Rooms;
DROP TABLE if exists Sale_Inventory_Update;
DROP TABLE if exists Sale;
DROP TABLE if exists Service;
DROP TABLE if exists Inventory;
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


CREATE TABLE Inventory
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Price int NOT NULL,
	Qty int NOT NULL,
	UpDated varchar(40) NOT NULL,
	StatusID int NOT NULL REFERENCES Status(Id),
	TavernID int REFERENCES Tavern(Id),
	SupplyID int NOT NULL,
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
	TavernID int REFERENCES Tavern(Id)
)

CREATE TABLE Room_Stay
(
	SaleID int NOT NULL PRIMARY KEY IDENTITY,
	GuestName varchar(40) NOT NULL,
	RoomID int REFERENCES Rooms(Id),
	DATEBOOKED varchar(40),
	NumNight int NOT NULL,
	Rate int
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
	('Kitty', 2, 3, 1, 25, 5),
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
 NumNight,
 Rate)

VALUES
('Joe Jack', 2, '2000-10-10', 1, 300),
('Billy Bob', 3, '2019-03-07-8975', 5, 500),
('Jesse Jones', 6, '1945-09-07', 54, 800),
('Al Alferd',4, '2003-12-30', 6, 50),
('Zac Zoey', 9, '2010-06-09', 7, 1500),
('Joe Jack', 7, '2019-08-12', 6, 5600),
('Abcd Wyz', 11, '2017-10-25', 1, 5600),
('Henry Hetz', 1, '2018-100-02', 3, 30),
('Trevor Thompson', 5, '2018-09-03', 9, 450),
('Henry Hetz ll', 10, '2019-15-19', 10, 400),
('Vern Vattle', 8, '2019-12-303', 14, 890),
('Henry He', 1, '2020-01-20', 3, 30);

--#1 HW (I took this as anyone who had a roleid)
SELECT * FROM Owner WHERE RoleId is NOT NULL

--#2
SELECT * FROM Owner 
LEFT JOIN Tavern ON (Owner.RoleId = Tavern.OwnerId) WHERE RoleId is NOT NULL

--#3
SELECT * FROM GUEST ORDER BY Name ASC

--#4
SELECT TOP 10 Sale.GuestName, Service.Price, Service.Name as Service_Name FROM Sale 
LEFT JOIN Service ON (Sale.ServiceId = Service.Id)
ORDER BY Price DESC

--#5
SELECT GUEST.Name, COUNT(GuestID) as Class_Count FROM GUEST_CLASS
LEFT JOIN GUEST ON (GUEST.ID = GuestID) 
GROUP BY Guest.Name
HAVING COUNT(GuestID) > 1

--#6
SELECT GUEST.Name, Max(GUEST_CLASS.ClassLvls) as Max_Class_Lvl FROM GUEST_CLASS 
LEFT JOIN GUEST ON (GUEST.ID = GUEST_CLASS.GuestID)
GROUP BY Guest.Name
HAVING COUNT(GuestID) > 1 

--#7
SELECT GUEST.Name, MAX(GUEST_CLASS.ClassLvls) AS Max_Class_Lvl FROM GUEST_CLASS 
LEFT JOIN GUEST ON (GUEST.ID = GUEST_CLASS.GuestID) 
GROUP BY GUEST.Name

--#8
SELECT * FROM Room_Stay 
WHERE DATEBOOKED BETWEEN '2000-05-05' AND '2015-05-05'

--#9
SELECT concat ('Create Table ', Table_name, '(') as queryPiecee from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Tavern' 
UNion All
SELECT CONCAT (cols.COLUMN_NAME,' ', DATA_TYPE,  (
	CASE WHEN DATA_TYPE = 'varchar' then concat(  '(', CHARACTER_MAXIMUM_LENGTH, ')', ',' )end),
   (CASE WHEN refCon.CONSTRAINT_NAME IS NOT NULL then concat( ' ','FOREIGN KEY REFERENCES', ' ', conKey.TABLE_NAME, ' ', '(', keys.COLUMN_NAME, ')') end),
   (CASE WHEN keys.CONSTRAINT_NAME LIKE'PK%'then concat( ' ','PRIMARY KEY IDENTITY') end))
	FROM INFORMATION_SCHEMA.COLUMNS as cols 
LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE as keys ON (keys.TABLE_NAME = cols.TABLE_NAME and keys.COLUMN_NAME = cols.COLUMN_NAME)
LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS as refCon ON (refCon.CONSTRAINT_NAME = keys.CONSTRAINT_NAME)
LEFT JOIN (SELECT DISTINCT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE) as conKey ON (conKey.CONSTRAINT_NAME = refCon.UNIQUE_CONSTRAINT_NAME)
WHERE cols.TABLE_NAME = 'Tavern'
UNION ALL
SELECT ')'; 

