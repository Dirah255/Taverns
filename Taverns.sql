CREATE TABLE Tavern
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name char(40) NOT NULL,
	Floors char(40),
	LocationId int NOT NULL FOREIGN KEY REFERENCES Location(Id),
	OwnerId int NOT NULL FOREIGN KEY REFERENCES Owner(Id),
	RatId int FOREIGN KEY REFERENCES Rat(Id),
	InventoryId int FOREIGN KEY REFERENCES Inventory(Id),
	ServiceId int FOREIGN KEY REFERENCES Inventory(Id),
	SaleId int FOREIGN KEY REFERENCES Sale(Id)
);

CREATE TABLE Owner
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name char(40) NOT NULL,
	RoleId int FOREIGN KEY REFERENCES ROLES(Id)
);

CREATE TABLE Roles
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	RoleName char(40) NOT NULL,
	RoleDescription char(40) NOT NULL
);

CREATE TABLE Location
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	AddressOne char(40) NOT NULL,
	AddressTwo char(40), 
	St char (2) NOT NULL,
	Zip int NOT NULL
);

CREATE TABLE Rat
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name char(40) NOT NULL
);

CREATE TABLE Inventory
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name char(40) NOT NULL,
	Price dec NOT NULL,
	Unit char(40) NOT NULL, 
	Qty int(2) NOT NULL,
	UpDated DATETIME NOT NULL,
	Status int NOT NULL FOREIGN KEY REFERENCES Staus(Id),
);

CREATE TABLE Service
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name char(40) NOT NULL,
	Price dec NOT NULL, 
	Status int NOT NULL FOREIGN KEY REFERENCES Status(Id),
);

CREATE TABLE Status
(
	ID int NOT NULL PRIMARY KEY,
	Description char (40)
);

CREATE TABLE Sale
(
	Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	GuestName char(40) NOT NULL,
	InventoryId int FOREIGN KEY REFERENCES Inventory(Id),
	ServiceId int FOREIGN KEY REFERENCES Service(Id), 
	Qty int NOT NULL,
	Total dec NOT NULL
);

INSERT INTO Tavern  
(Id,
 Name,
 Floors,
 LocationId,
 UserId,
 RatId,
 InventoryId,
 ServiceId,
 SaleId) 
VALUES
    ( ,'Northside', 109, 1, 2, 3, 1, 2, 4),
    ( ,'Westside', 54, 2, 3, 2, 2, , 1),
    ( ,'Eastside', 8, 3, 1, 1, 3, 1, 2),
    ( ,'We Side', 4, 4, 5, , 2, 2, 5),
	( ,'UpsideDown', 1, 5, 4, , 5, 4, 3);


INSERT INTO Owner
(Id,
 Name, 
 RoleId)
VALUES
    ( ,'Anna', 1),
	( ,'Elsa', 2),
	( ,'Olaf', 3),
	( ,'Kristoff', 4),
	( ,'Hans', 5);
	
INSERT INTO Roles
(RoleName, 
 RoleDescription)
VALUES
    ( ,'Owner', 'Owns the Tavern'),
	( ,'Manager', 'Manages the Tavern'),
	( ,'Cook','Cooks the Food'),
	( ,'Sever','Serves the Food'),
	( ,'Cleaner','Cleanes the Tavern');
	
INSERT INTO Location
(Id,
 AddressOne,
 AddressTwo,
 St,
 Zip)
VALUES
	( ,'987 East Dr.','Ste G', 'NJ', 00254),
    ( ,'101 North St.', ,'PA', 19100),
	( ,'123 W Well St.', , 'DE', 09050)
	( ,'1 Imagination Ave.', ,'AK', 99998),
	( ,'321 E LLEW St.', ,'DE', 05090);

INSERT INTO Rat
(Id,
 Name)
VALUES
    ( ,'Pinky'),
	( ,'Reddy'),
	( ,'Blu');
	
INSERT INTO Inventory
(Id,
 Name, 
 Price,
 Qty,
 Unit,
 UpDated,
 Status)
VALUES
	( ,'Strong Ale', 3.50, 10, 'Barrel', 2020-02-02 21:45:20, 1),
    ( ,'Yummy Pie', 2.00, 3, 'Slices', 2020-10-01 10:35:10, 1),
	( ,'Dry Bread', .50, 15,'Loaf', 2020-15-01 11:40:40, 1),
	( ,'Chewing Tobacco', 1.00, 0 , 'Box', 2020-05-02 15:15:16, 0),
	( ,'Hard Candy', 0.25, 0, 'Piece', 1987-26-05 12:34:56, 1);

INSERT INTO Service
(Id,
 Name, 
 Price,
 Status)
VALUES
	( ,'Pool', 1.00 , 1),
	( ,'Darts', 0.70 , 1),
	( , 'Bubble Hockey', 0),
	( ,'Riding Dragon', 100.00 , 1);
	

INSERT INTO Status
(Id,
 Description, 
)
VALUES
	(1,'Active'),
	(0,'Inactive');


INSERT INTO Sale
(Id,
 GuestName,
 InventoryId, 
 ServiceId,
 Qty,
 Total)
VALUES
	( ,'Kitty', 2, , 1, 2.00),
	( ,'Tiger', 3, 1, 1, 1.20),
	( ,'Bubbles', 5, 4, 1, 100.25),
	( ,'Prince', 1, 2, 1, 4.20),
	( ,'Roco', 2, 2, 1, 2.70);
	 






