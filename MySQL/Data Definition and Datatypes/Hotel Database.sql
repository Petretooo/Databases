CREATE DATABASE hotel;

USE hotel;

CREATE TABLE employees(
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
title VARCHAR(30),
notes TEXT,
CONSTRAINT pk_employees PRIMARY KEY(id)
);
CREATE TABLE customers(
account_number VARCHAR(20) NOT NULL,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
phone_number VARCHAR(20),
emergency_number VARCHAR(20),
notes TEXT,
CONSTRAINT pk_customers PRIMARY KEY(account_number)
);
CREATE TABLE room_status(
room_status VARCHAR(10) NOT NULL,
notes TEXT,
CONSTRAINT pk_room_status PRIMARY KEY(room_status)
);
CREATE TABLE room_types(
room_types VARCHAR(20) NOT NULL,
notes TEXT,
CONSTRAINT pk_room_types PRIMARY KEY(room_types)
);
CREATE TABLE bed_types(
bed_types VARCHAR(10) NOT NULL,
notes TEXT,
CONSTRAINT pk_bed_types PRIMARY KEY(bed_types)
);
CREATE TABLE rooms(
room_numbers INT(4) NOT NULL AUTO_INCREMENT,
room_type VARCHAR(20),
bed_type VARCHAR(20),
rate DECIMAL,
room_status VARCHAR(10),
notes TEXT,
CONSTRAINT pk_rooms PRIMARY KEY(room_numbers)
);
CREATE TABLE payments(
id INT NOT NULL AUTO_INCREMENT,
employee_id INT,
payment_date DATE,
account_number VARCHAR(20),
first_date_occupied DATE,
last_date_occupied DATE,
total_days INT,
amont_charged DECIMAL,
tax_rate FLOAT,
tax_amount FLOAT,
payment_total DECIMAL,
notes TEXT,
CONSTRAINT pk_payments PRIMARY KEY(id)
);
CREATE TABLE occupancies(
id INT NOT NULL AUTO_INCREMENT,
employee_id INT,
date_occupied DATE,
account_number VARCHAR(20),
room_number INT(5),
rate_applied FLOAT,
phone_charge FLOAT,
notes TEXT,
CONSTRAINT pk_occupancies PRIMARY KEY(id)
);


INSERT INTO employees(first_name, last_name)
VALUES('John', 'Johnson'),
('Bob','Bobby'),
('Ron','Ronald');

INSERT INTO customers(account_number, first_name, last_name, phone_number)
VALUES('329V802863V093VJ0', 'Borimir', 'Don', 0987654321),
('329V802863V093V30', 'Birimir', 'Don', 0687654321),
('329V802863V093V20', 'Berimir', 'Don', 0587654321);

INSERT INTO room_status(room_status)
VALUES('OCCUPIED'),
('FREE'),
('FAMILY');

INSERT INTO room_types(room_types)VALUE
('Single'),('DOUBLE'),('Family');

INSERT INTO bed_types(bed_types)
VALUE('S'),('D'),('F');

INSERT INTO rooms(room_type, bed_type, room_status)
VALUES('Single room', 'Double', 'free'),
('Single room', 'Double', 'free'),
('Single room', 'Double', 'free');

INSERT INTO payments (employee_id, account_number, first_date_occupied, last_date_occupied, total_days, payment_total)
VALUES(1,'AV46A64AV4W6', '2019-01-01', '2019-01-20', 19, 5346),
(1,'AV46A64AV4W6', '2019-01-02', '2019-01-21', 19, 5346),
(1,'AV46A64AV4W6', '2019-01-03', '2019-01-22', 19, 5346);

INSERT INTO occupancies(employee_id, room_number)
VALUES(1,2),(3,4),(5,6);