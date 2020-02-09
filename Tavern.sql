DROP TABLE if exists  Tavern;
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
	InventoryId int,
	ServiceId int,
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
	Total dec NOT NULL
);


ALTER TABLE Tavern
ADD FOREIGN KEY (LocationID) REFERENCES Location(ID);

ALTER TABLE Tavern
ADD FOREIGN KEY (OwnerID) REFERENCES Owner(ID);

ALTER TABLE Tavern
ADD FOREIGN KEY (InventoryID) REFERENCES Inventory(ID);

ALTER TABLE Tavern
ADD FOREIGN KEY (ServiceID) REFERENCES Service(ID);

ALTER TABLE Tavern
ADD FOREIGN KEY (SaleID) REFERENCES Sale(ID);

ALTER TABLE Owner
ADD FOREIGN KEY (RoleID) REFERENCES Role(ID);

ALTER TABLE Inventory
ADD FOREIGN KEY (StatusID) REFERENCES Status(ID);

ALTER TABLE Service
ADD FOREIGN KEY (StatusID) REFERENCES Service(ID);

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
    ('Strong Ale', 3.50, 10, 'Barrel', 2020-02-02, 2),
    ('Yummy Pie', 2.00, 3, 'Slices', 2020-10-01, 2),
    ('Dry Bread', .50, 15,'Loaf', 2020-15-01, 2),
    ('Chewing Tobacco', 1.00, 0 , 'Box', 2020-05-02, 1),
    ('Hard Candy', 0.25, 0, 'Piece', 1987-26-05, 2);

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
	('Kitty', 2, 3, 1, 2.00),
	('Tiger', 3, 1, 1, 1.20),
	('Bubbles', 5, 4, 1, 100.25),
	('Prince', 1, 2, 1, 4.20),
	('Roco', 2, 2, 1, 2.70);

INSERT INTO Tavern  
( Name,
 Floors,
 LocationId,
 OwnerId,
 InventoryId,
 ServiceId,
 SaleId) 
VALUES
    ('Northside', 109, 1, 2, 3, 1, 2),
    ('Westside', 54, 2, 3, 2, 2, 3),
    ('Eastside', 8, 3, 1, 1, 3, 1),
    ('We Side', 4, 4, 5, 1, 2, 2),
    ('UpsideDown', 1, 5, 4, 1, 4, 4);

	 