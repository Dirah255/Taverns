
DROP TABLE if exists Sale;
DROP TABLE if exists Tavern;

DROP TABLE if exists Owner;
DROP TABLE if exists Role;

DROP TABLE if exists Location;
DROP TABLE if exists Sale_Inventory;


DROP TABLE if exists Inventory;
DROP TABLE if exists Service;
DROP TABLE if exists Status;
DROP TABLE if exists Supply;


CREATE TABLE Tavern
(
	ID INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Name varchar(40) NOT NULL,
	Floors varchar(40),
	LocationId int NOT NULL,
	OwnerId int NOT NULL,
);

CREATE TABLE Owner
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Name varchar(40) NOT NULL,
	RoleId int
);

CREATE TABLE Role
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	RoleName varchar(40) NOT NULL,
	RoleDescription varchar(40) NOT NULL
);

CREATE TABLE Location
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	AddressOne varchar(40) NOT NULL,
	AddressTwo varchar(40), 
	St varchar (2) NOT NULL,
	Zip int NOT NULL
);

CREATE TABLE Supply
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Name varchar(40),
	Unit varchar(40),
);

CREATE TABLE Inventory
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Price int NOT NULL,
	Qty int NOT NULL,
	UpDated varchar(40) NOT NULL,
	StatusID int NOT NULL,
	TavernID int,
	SupplyID int NOT NULL,
);

CREATE TABLE Service
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Name char(40) NOT NULL,
	Price dec NOT NULL, 
	StatusID int NOT NULL,
);

CREATE TABLE Status
(
	ID INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Description varchar (40) NOT NULL
);

CREATE TABLE Sale
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	GuestName varchar(40) NOT NULL,
	InventoryId int REFERENCES Inventory(Id),
	ServiceId int REFERENCES Service(Id), 
	TavernID int,
	Qty int NOT NULL,
	Total int NOT NULL
);

CREATE TABLE Sale_Inventory
(
	SaleID int NOT NULL,
	InventoryID int Not Null, 
	UpdatedQty int Not NULL,
)


ALTER TABLE Tavern
ADD FOREIGN KEY (LocationID) REFERENCES Location(ID);

ALTER TABLE Tavern
ADD FOREIGN KEY (OwnerID) REFERENCES Owner(ID);

ALTER TABLE Sale
ADD FOREIGN KEY (TavernID) REFERENCES Tavern(ID);

ALTER TABLE Owner
ADD FOREIGN KEY (RoleID) REFERENCES Role(ID);

ALTER TABLE Inventory
ADD FOREIGN KEY (TavernID) REFERENCES Tavern(ID);

ALTER TABLE Inventory
ADD FOREIGN KEY (StatusID) REFERENCES Status(ID);

ALTER TABLE Inventory
ADD FOREIGN KEY (SupplyID) REFERENCES Supply(ID);

ALTER TABLE Service
ADD FOREIGN KEY (StatusID) REFERENCES Service(ID);

ALTER TABLE Sale_Inventory
ADD FOREIGN KEY (SaleID) REFERENCES Sale(ID);

ALTER TABLE Sale_Inventory
ADD FOREIGN KEY (InventoryID) REFERENCES Inventory(ID);

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
    ('Hans', 5);
	
INSERT INTO Status
(Description)
VALUES
	('Active'),
	('Inactive');

INSERT INTO Service
( Name, 
 Price,
 StatusID)
VALUES
	('Pool', 1.00 , 2),
	('Darts', 0.70 , 2),
	('Bubble Hockey', 0, 1),
	('Riding Dragon', 100.00, 2);

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
	--('Throwing Error',1,1,0);

INSERT INTO Supply
(Name,
 Unit)
VALUES
    ('Strong Ale', 'Barrel'),
    ('Yummy Pie', 'Slices'),
    ('Dry Bread', 'Loaf'),
    ('Chewing Tobacco', 'Box'),
    ('Hard Candy', 'Piece');

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

INSERT INTO Sale
(GuestName,
 InventoryId, 
 ServiceId,
 Qty,
 Total,
 TavernID)
VALUES
	('Kitty', 2, 3, 1, 2, 5),
	('Tiger', 3, 1, 1, 1, 5),
	('Bubbles', 5, 4, 1, 100, 1),
	('Prince', 1, 2, 1, 4, 2),
	('Roco', 2, 2, 1, 2, 4),
	('Poncho', 5, 1, 4, 150, 4),
	('Paulie', 3, 2,5, 30, 1);


INSERT INTO Sale_Inventory
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





SELECT * from Sale;
SELECT * from Sale_Inventory;

--SELECT concat ('Create Table ', Table_name, '(') as queryPiecee from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Tavern' 
--UNion All
--SELECT CONCAT (COLUMN_NAME,' ', DATA_TYPE,  (CASE WHEN DATA_TYPE = 'char' then concat(  '(', CHARACTER_MAXIMUM_LENGTH, ')' )end) , ',') FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'Tavern' 
--UNION ALL
--Select ')'


--SELECT * FROM INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'Tavern' 
--Select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Tavern'
--SELECT Name, Id, Floors as tbl from Tavern /*'roles' as tbl*/
--UNION ALL
--SELECT Name, StatusId, Price as tbl from Service /*'status' as tbl*/
