DROP TABLE if exists  Tavern;
DROP TABLE if exists Sale_Inventory;
DROP TABLE if exists Sale;
DROP TABLE if exists Owner;
DROP TABLE if exists Role;
DROP TABLE if exists Location;
DROP TABLE if exists Inventory;
DROP TABLE if exists Service;
DROP TABLE if exists Status;



CREATE TABLE Tavern
(
	ID INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Name char(40) NOT NULL,
	Floors char(40),
	LocationId int NOT NULL,
	OwnerId int NOT NULL,
	SaleId int
);

CREATE TABLE Owner
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Name char(40) NOT NULL,
	RoleId int
);

CREATE TABLE Role
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	RoleName char(40) NOT NULL,
	RoleDescription char(40) NOT NULL
);

CREATE TABLE Location
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	AddressOne char(40) NOT NULL,
	AddressTwo char(40), 
	St char (2) NOT NULL,
	Zip int NOT NULL
);


CREATE TABLE Inventory
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	Name char(40) NOT NULL,
	Price dec NOT NULL,
	Unit char(40) NOT NULL, 
	Qty int NOT NULL,
	UpDated DATETIME NOT NULL,
	StatusID int NOT NULL,
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
	Description char (40) NOT NULL
);

CREATE TABLE Sale
(
	Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
	GuestName char(40) NOT NULL,
	InventoryId int REFERENCES Inventory(Id),
	ServiceId int REFERENCES Service(Id), 
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

ALTER TABLE Tavern
ADD FOREIGN KEY (SaleID) REFERENCES Sale(ID);

ALTER TABLE Owner
ADD FOREIGN KEY (RoleID) REFERENCES Role(ID);

ALTER TABLE Inventory
ADD FOREIGN KEY (StatusID) REFERENCES Status(ID);

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
	
INSERT INTO Inventory
(Name, 
 Price,
 Qty,
 Unit,
 UpDated,
 StatusID)
VALUES
    ('Strong Ale', 5, 10, 'Barrel', 2020-02-02, 2),
    ('Yummy Pie', 3, 3, 'Slices', 2020-10-01, 2),
    ('Dry Bread', 2, 15,'Loaf', 2020-15-01, 2),
    ('Chewing Tobacco', 4, 0 , 'Box', 2020-05-02, 1),
    ('Hard Candy', 1, 0, 'Piece', 1987-26-05, 2);

INSERT INTO Service
( Name, 
 Price,
 StatusID)
VALUES
	('Pool', 1.00 , 2),
	('Darts', 0.70 , 2),
	('Bubble Hockey', 0, 1),
	('Riding Dragon', 100.00, 2);
	
INSERT INTO Sale
(GuestName,
 InventoryId, 
 ServiceId,
 Qty,
 Total)
VALUES
	('Kitty', 2, 3, 1, 2),
	('Tiger', 3, 1, 1, 1),
	('Bubbles', 5, 4, 1, 100),
	('Prince', 1, 2, 1, 4),
	('Roco', 2, 2, 1, 2),
	('Poncho', 5, 1, 4, 150),
	('Paulie', 3, 2,5, 30);

INSERT INTO Tavern  
( Name,
 Floors,
 LocationId,
 OwnerId,
 SaleId) 
VALUES
    ('Northside', 109, 1, 2, 2),
    ('Westside', 54, 2, 3, 3),
    ('Eastside', 8, 3, 1, 1),
    ('We Side', 4, 4, 5, 2),
    ('UpsideDown', 1, 5, 4, 4);
	--('Throwing Error',1,1,1,0);

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
