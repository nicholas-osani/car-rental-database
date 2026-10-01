# Car Rental Database — Design to Queries

SQL coursework — Baruch College. **By Nicholas Osani.**

## The problem

A car rental company ran on spreadsheets and paper logs: double bookings, lost
customer records, no reliable view of fleet availability. This project replaces
that with a normalized relational database — from business requirements all the
way to working SQL.

## What I did

1. **Requirements & entities** — identified 7 entities: Customer, Car, Rental,
   Payment, MaintenanceHistory, EmergencyContact, Employee.
2. **UML class diagram** — mapped entities, keys, and relationships
   (`uml-class-diagram.png`).
3. **Logical modeling & normalization** — e.g. Payment was normalized to remove
   the transitive dependency on Rental's end date and total cost; EmergencyContact
   references Rental rather than Customer directly.
4. **DDL** — `CREATE TABLE` with primary keys, then `ALTER TABLE` foreign-key
   constraints to prevent orphan records.
5. **Business queries** — three queries answering real operational questions.

## The queries

| # | Question | Technique |
|---|----------|-----------|
| 1 | Which rentals are overdue, and who has the car? | `JOIN` + date comparison |
| 2 | Which fleet cars were never rented (wasted inventory)? | `NOT IN` subquery |
| 3 | What is the average rental duration? | `AVG` over date arithmetic |

## Run it

The original build used Microsoft Access (`Part4DB.accdb`, included). The schema
and queries are ported here to portable SQLite — same logic, no Access needed:

```bash
sqlite3 carrental.db < schema.sql
sqlite3 carrental.db < seed.sql
sqlite3 carrental.db < queries.sql
```

Expected results: Q1 returns rental #4 (Robert Johnson, Chevrolet Malibu, overdue);
Q2 returns car #6 (Mercedes S-Class — never rented); Q3 returns 6.0 days.

Sample seed data is reconstructed to match the scenarios documented in the project
presentation (`Project_3_presentation.pdf`, included).

## Files

- `schema.sql` — 7-table DDL with PK/FK constraints (SQLite)
- `seed.sql` — sample data covering every documented scenario
- `queries.sql` — the 3 business queries
- `uml-class-diagram.png` — UML class diagram
- `Part4DB.accdb` — original Microsoft Access database
- `Project_3_presentation.pdf` — full project presentation
