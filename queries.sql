-- Business queries for the Car Rental database (SQLite dialect).
-- The original project ran these in Microsoft Access - logic is unchanged.

-- Q1: Overdue rentals + the customer holding each car.
-- A rental is overdue when its end date has passed and it isn't completed.
SELECT r.RentalID,
       c.FirstName || ' ' || c.LastName AS Customer,
       c.PhoneNumber,
       m.Make || ' ' || m.Model AS Car,
       r.RentalEndDate,
       r.Status
FROM Rental r
JOIN Customer c ON c.CustomerID = r.CustomerID
JOIN Car m      ON m.CarID = r.CarID
WHERE r.RentalEndDate < DATE('now')
  AND r.Status <> 'Completed';

-- Q2: Underutilized cars — fleet vehicles never rented.
SELECT CarID, Make, Model, Year, LicensePlate, RentalRate
FROM Car
WHERE CarID NOT IN (SELECT CarID FROM Rental);

-- Q3: Average rental duration (days) across completed rentals.
-- +1 counts both pickup and return days.
SELECT ROUND(AVG(JULIANDAY(RentalEndDate) - JULIANDAY(RentalStartDate) + 1), 1)
       AS AvgRentalDays
FROM Rental
WHERE Status = 'Completed';
