CREATE DATABASE car_rental;
USE car_rental;
CREATE TABLE categories(
id INT NOT NULL AUTO_INCREMENT,
category VARCHAR(50),
daily_rate FLOAT,
weekly_rate FLOAT,
monthly_rate FLOAT,
weekend_rate FLOAT,
CONSTRAINT pk_category PRIMARY KEY (id)
);
CREATE TABLE cars(
id INT NOT NULL AUTO_INCREMENT,
plate_number VARCHAR(10) NOT NULL,
make VARCHAR(20),
model VARCHAR(20),
car_year DATE,
category_id INT,
doors INT(1),
picture BLOB,
car_condition TEXT,
available BOOLEAN,
CONSTRAINT pk_cars PRIMARY KEY(id)
);
CREATE TABLE employees(
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
title VARCHAR(30),
notes TEXT,
CONSTRAINT pk_employees PRIMARY KEY(id)
);
CREATE TABLE customers(
id INT NOT NULL AUTO_INCREMENT,
driver_licence_number BIGINT,
full_name VARCHAR(50),
address VARCHAR(255),
city VARCHAR(30),
zip_code INT,
notes TEXT,
CONSTRAINT pk_customers PRIMARY KEY(id)
);
CREATE TABLE rental_orders(
id INT NOT NULL AUTO_INCREMENT,
employee_id INT,
customer_id INT,
car_id INT,
car_condition TEXT,
tank_level DOUBLE,
kilometrage_start DOUBLE,
kilometrage_end DOUBLE,
total_kilometrage DOUBLE,
start_date DATE,
end_date DATE,
total_days INT,
rate_applied FLOAT(2),
tax_rate FLOAT(2),
order_status INT,
notes TEXT,
CONSTRAINT pk_rental_orders PRIMARY KEY (id)
);

INSERT INTO categories (category, daily_rate, monthly_rate)
VALUES('Automatic', 10.4, 555),
('MANUAL', 9.2, 666),
('AUTOMATIC', 11.2, 777);

INSERT INTO cars(plate_number, make, model, category_id, doors, car_condition, available)
VALUES('XCGA453', 'Ferrari', 'Enzo', 2, 5, 'The car is good', TRUE),
('FAFA6464', 'VW', 'Polo', 1, 2, 'The car is good', FALSE),
('XCGA45D', 'TESLA', 'S', 3, 4, 'The car is good', TRUE);

INSERT INTO employees(first_name, last_name)
VALUES('George', 'Mitkoff'),
('Robert', 'Turing'),
('Peter', 'Brown');

INSERT INTO customers (full_name, city)
VALUES ('Boiko', 'Sofia'),
 ('Michael', 'New York'),
 ('Kevin', 'Los Angeles');
 
 INSERT INTO rental_orders (employee_id, customer_id, car_id, order_status)
 VALUES(1,2,3,TRUE),
 (4,5,6, FALSE),
 (8,9,10, TRUE);