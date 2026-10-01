-- Car Rental Company Management System — database schema
-- Ported from the original Microsoft Access DDL to portable SQLite.
-- Run: sqlite3 carrental.db < schema.sql

PRAGMA foreign_keys = ON;

CREATE TABLE Customer (
    CustomerID          INTEGER PRIMARY KEY,
    FirstName           TEXT NOT NULL,
    LastName            TEXT NOT NULL,
    DOB                 TEXT NOT NULL,          -- ISO date YYYY-MM-DD
    PhoneNumber         TEXT NOT NULL,
    Email               TEXT NOT NULL,
    Address             TEXT NOT NULL,
    DriverLicenseNumber TEXT NOT NULL
);

CREATE TABLE Car (
    CarID        INTEGER PRIMARY KEY,
    Make         TEXT NOT NULL,
    Model        TEXT NOT NULL,
    Year         INTEGER NOT NULL,
    LicensePlate TEXT NOT NULL UNIQUE,          -- alternate key
    RentalRate   REAL NOT NULL,
    ActiveStatus TEXT NOT NULL
);

CREATE TABLE Rental (
    RentalID        INTEGER PRIMARY KEY,
    CustomerID      INTEGER NOT NULL REFERENCES Customer(CustomerID),
    CarID           INTEGER NOT NULL REFERENCES Car(CarID),
    RentalStartDate TEXT NOT NULL,
    RentalEndDate   TEXT NOT NULL,
    TotalCost       REAL NOT NULL,
    Status          TEXT NOT NULL               -- Completed | Overdue | Active | Reserved
);

-- Normalized: RentalEndDate and TotalCost removed (transitive dependency via Rental)
CREATE TABLE Payment (
    PaymentID     INTEGER PRIMARY KEY,
    RentalID      INTEGER NOT NULL REFERENCES Rental(RentalID),
    PaymentAmount REAL NOT NULL,
    PaymentDate   TEXT NOT NULL,
    ActiveStatus  TEXT NOT NULL
);

CREATE TABLE MaintenanceHistory (
    MaintenanceID INTEGER PRIMARY KEY,
    CarID         INTEGER NOT NULL REFERENCES Car(CarID),
    ServiceDate   TEXT NOT NULL,
    Description   TEXT NOT NULL,
    Cost          REAL NOT NULL
);

-- Normalized: references Rental (not Customer directly); one rental -> many contacts
CREATE TABLE EmergencyContact (
    ContactID   INTEGER PRIMARY KEY,
    RentalID    INTEGER NOT NULL REFERENCES Rental(RentalID),
    Name        TEXT NOT NULL,
    Address     TEXT NOT NULL,
    Email       TEXT NOT NULL,
    PhoneNumber TEXT NOT NULL,
    Relation    TEXT NOT NULL
);

CREATE TABLE Employee (
    EmployeeID INTEGER PRIMARY KEY,
    FullName   TEXT NOT NULL,
    Email      TEXT NOT NULL,
    Contact    TEXT NOT NULL
);
