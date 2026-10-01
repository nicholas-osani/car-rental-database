-- Sample seed data for the Car Rental database.
-- Reconstructed to match every scenario documented in the project presentation:
-- customer 6 is a prospect (no rentals); car 6 is a never-rented luxury unit;
-- rental 4 is overdue; rental 5 is active; rental 7 is a future reservation;
-- rental 3 was paid in two installments; rentals 4 and 5 have deposits only.
-- Run: sqlite3 carrental.db < schema.sql && sqlite3 carrental.db < seed.sql

INSERT INTO Customer VALUES
(1,'John','Doe','1990-04-12','555-0101','john.doe@mail.com','12 Main St, Albany NY','D1234567'),
(2,'Jane','Smith','1985-09-30','555-0102','jane.smith@mail.com','34 Oak Ave, Troy NY','D2345678'),
(3,'Robert','Johnson','1978-02-17','555-0103','robert.j@mail.com','56 Pine Rd, Schenectady NY','D3456789'),
(4,'Emily','Davis','1995-11-05','555-0104','emily.davis@mail.com','78 Elm St, Albany NY','D4567890'),
(5,'Michael','Brown','1988-07-22','555-0105','michael.b@mail.com','90 Maple Dr, Troy NY','D5678901'),
(6,'Sarah','Wilson','1992-12-03','555-0106','sarah.w@mail.com','11 Birch Ln, Albany NY','D6789012');

INSERT INTO Car VALUES
(1,'Toyota','Camry',2022,'ABC123',45,'Available'),
(2,'Honda','Civic',2021,'XYZ789',40,'Available'),
(3,'Ford','Mustang',2023,'FST456',85,'Available'),
(4,'Chevrolet','Malibu',2020,'CHEV11',38,'Rented'),
(5,'Nissan','Altima',2022,'NIS222',42,'Rented'),
(6,'Mercedes','S-Class',2024,'LUX999',200,'Available');

INSERT INTO Rental VALUES
(1,1,1,'2026-01-05','2026-01-10',270,'Completed'),
(2,2,2,'2026-02-01','2026-02-05',200,'Completed'),
(3,1,3,'2026-03-10','2026-03-15',510,'Completed'),
(4,3,4,'2026-09-01','2026-09-10',380,'Overdue'),
(5,4,5,'2026-09-25','2026-10-05',462,'Active'),
(6,5,1,'2026-06-01','2026-06-07',315,'Completed'),
(7,2,3,'2026-11-01','2026-11-06',510,'Reserved');

INSERT INTO Payment VALUES
(1,1,270,'2026-01-10','Active'),
(2,2,200,'2026-02-05','Active'),
(3,3,200,'2026-03-10','Active'),
(4,3,310,'2026-03-15','Active'),
(5,4,100,'2026-09-01','Active'),
(6,5,150,'2026-09-25','Active'),
(7,6,315,'2026-06-07','Active');

INSERT INTO MaintenanceHistory VALUES
(1,1,'2026-04-01','Oil change',60),
(2,1,'2026-07-15','Brake pads',220),
(3,2,'2026-05-10','Tire rotation',50),
(4,3,'2026-08-01','Oil change',70),
(5,4,'2026-06-20','Battery replacement',150);

INSERT INTO Employee VALUES
(1,'Alice Turner','alice.turner@carrental.com','555-0201'),
(2,'Brian Cole','brian.cole@carrental.com','555-0202'),
(3,'Carol Dean','carol.dean@carrental.com','555-0203'),
(4,'David Park','david.park@carrental.com','555-0204');

INSERT INTO EmergencyContact VALUES
(1,1,'Mary Doe','12 Main St, Albany NY','mary.doe@mail.com','555-0111','Spouse'),
(2,2,'Tom Smith','34 Oak Ave, Troy NY','tom.smith@mail.com','555-0112','Brother'),
(3,3,'Lisa Ray','9 Hill St, Troy NY','lisa.ray@mail.com','555-0113','Friend'),
(4,4,'Karen Johnson','56 Pine Rd, Schenectady NY','karen.j@mail.com','555-0114','Spouse'),
(5,4,'Paul Johnson','56 Pine Rd, Schenectady NY','paul.j@mail.com','555-0115','Son'),
(6,5,'Mary Doe','12 Main St, Albany NY','mary.doe@mail.com','555-0111','Friend'),
(7,6,'Nina Brown','90 Maple Dr, Troy NY','nina.b@mail.com','555-0116','Sister'),
(8,7,'Tom Smith','34 Oak Ave, Troy NY','tom.smith@mail.com','555-0112','Brother');
