# Pet-Hotel-Database-System
Pet Hotel Management Database System using PostgreSQL.
## Project Description

The Pet Hotel Management Database System is designed to manage the main operations of a pet hotel. The system stores information about pet owners, pets, rooms, reservations, services, and payments.

The database was designed using an Enhanced Entity-Relationship (EER) model and implemented with PostgreSQL.

## Database Structure

The database contains the following main tables:

- Owner
- Pet
- Cat
- Dog
- Room
- Reservation
- Service
- Reservation_Service
- Payment

Cat and Dog are subtypes of Pet. The specialization is designed as total and disjoint in the EER diagram.

## Technologies

- PostgreSQL 18
- pgAdmin 4
- SQL
- PL/pgSQL

## Project Files

- `01_create_database.sql` - Creates the Pet Hotel database.
- `02_create_tables.sql` - Creates all database tables and relationships.
- `03_insert_data.sql` - Inserts sample data into the tables.
- `04_queries.sql` - Contains SQL queries for data analysis.
- `05_views.sql` - Creates views for reservation and service information.
- `06_triggers.sql` - Contains validation triggers for reservations and pet subtypes.
- `docs/eer-diagram.pdf` - Contains the EER diagram of the database.

## Features

- Management of pet owners and pets
- Cat and Dog specialization
- Room and reservation management
- Additional services for reservations
- Payment records
- SQL queries using JOIN, GROUP BY, ORDER BY, COUNT, SUM, and AVG
- Views for reservation details and service usage
- Triggers for reservation date and pet subtype validation

## How to Run

1. Create the database using `01_create_database.sql`.
2. Connect to the `pet_hotel` database.
3. Run `02_create_tables.sql` to create the tables.
4. Run `03_insert_data.sql` to insert sample data.
5. Run `04_queries.sql` to test the SQL queries.
6. Run `05_views.sql` to create the views.
7. Run `06_triggers.sql` to create the validation triggers.