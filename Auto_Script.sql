CREATE TABLE Department (
    DepartmentID SERIAL PRIMARY KEY,
    Name VARCHAR (255) NOT NULL
);

CREATE TABLE Parts (
    PIN SERIAL PRIMARY KEY,
    Name VARCHAR (255) NOT NULL
);

CREATE TABLE Vehicle (
    VIN SERIAL PRIMARY KEY,
    Type VARCHAR (255) NOT NULL,
    Model VARCHAR (255) NOT NULL
);

CREATE TABLE Orders (
    OrderNum SERIAL PRIMARY KEY,
    DepartmentID INT REFERENCES Department (DepartmentID)
);

CREATE TABLE Inventory (
    InventoryID SERIAL PRIMARY KEY, 
    PIN INT UNIQUE REFERENCES Parts (PIN),
    Quantity INT CHECK (Quantity >= 0)
);

CREATE TABLE Supplier (
    SupplierID SERIAL PRIMARY KEY,
    Name VARCHAR (255) NOT NULL
);

CREATE TABLE PartsSupplier (
    PIN INT REFERENCES Parts (PIN),
    SupplierID INT REFERENCES Supplier (SupplierID),
    PRIMARY KEY (PIN, SupplierID)
);

CREATE TABLE OrderParts (
    OrderNum INT REFERENCES Orders (OrderNum),
    PIN INT REFERENCES Parts (PIN),
    Quantity INT CHECK (Quantity > 0),
    PRIMARY KEY (OrderNum, PIN)
);

CREATE TABLE VehicleParts (
    VIN INT REFERENCES Vehicle (VIN), 
    PIN INT REFERENCES Parts (PIN), 
    PRIMARY KEY (VIN, PIN)
);

CREATE TABLE DepartmentVehicle (
    DepartmentID INT REFERENCES Department (DepartmentID),
    VIN INT REFERENCES Vehicle (VIN),
    PRIMARY KEY (DepartmentID, VIN)
);

INSERT INTO Department (Name) VALUES
    ('Engineering'),
    ('Design'),
    ('Sales');

INSERT INTO Parts (Name) VALUES
    ('Steering Wheel'),
    ('Tire'),
    ('Brake Pad');

INSERT INTO Vehicle (Type, Model) VALUES
    ('Sedan', 'Model S'),
    ('SUV', 'Model X'),
    ('Track', 'Model T');

INSERT INTO Orders (DepartmentID) VALUES
    (1),
    (2),
    (3);

INSERT INTO Inventory (PIN, Quantity) VALUES
    (1, 10),
    (2, 20),
    (3, 5);

INSERT INTO Supplier (Name) VALUES
    ('Supplier A'),
    ('Supplier B'),
    ('Supplier C');

INSERT INTO PartsSupplier (PIN, SupplierID) VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO OrderParts (OrderNum, PIN, Quantity) VALUES
    (1, 1, 4),
    (2, 2, 6),
    (3, 3, 2);

INSERT INTO Parts (Name) VALUES
    ('Steering Wheel'), 
    ('Tire'), 
    ('Brake Pad');

INSERT INTO Vehicle (Type, Model) VALUES 
    ('Sedan', 'Model S'), 
    ('SUV', 'Model X'),
    ('Track', 'Model T');

INSERT INTO Orders (DepartmentID) VALUES
    (1),
    (2),
    (3) ;

INSERT INTO Inventory (PIN, Quantity) VALUES
    (1, 10),
    (2, 20),
    (3, 5);

INSERT INTO Supplier (Name) VALUES
    ('Supplier A'),
    ('Supplier B'),
    ('Supplier C');

INSERT INTO PartsSupplier (PIN, SupplierID) VALUES
    (1, 1),
    (2, 2), 
    (3, 3);

INSERT INTO OrderParts (OrderNum, PIN, Quantity) VALUES
    (1, 1, 4), 
    (2, 2, 6), 
    (3, 3, 2);

INSERT INTO VehicleParts (VIN, PIN) VALUES
    (1, 1),
    (2, 2),
    (3, 3);

INSERT INTO DepartmentVehicle (DepartmentID, VIN) VALUES
    (1, 1),
    (2, 2), 
    (3, 3);
