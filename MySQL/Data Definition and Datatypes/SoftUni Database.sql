
CREATE DATABASE softuni;

USE softuni;

CREATE TABLE towns (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(20),
    CONSTRAINT pk_towns PRIMARY KEY (id)
);

CREATE TABLE addresses (
    id INT NOT NULL AUTO_INCREMENT,
    address_text TEXT,
    town_id INT,
    CONSTRAINT pk_addresses PRIMARY KEY (id),
    CONSTRAINT fk_addresses_towns FOREIGN KEY (towns_id)
        REFERENCES towns (id)
);

CREATE TABLE departments(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(30),
CONSTRAINT pk_departments PRIMARY KEY(id)
);

CREATE TABLE employees(
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(30) NOT NULL,
middle_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
job_title VARCHAR(50),
department_id INT,
hire_date DATE,
salary DOUBLE,
address_id INT,
CONSTRAINT pk_employees PRIMARY KEY(id),
CONSTRAINT fk_employees_departments FOREIGN KEY(department_id)
REFERENCES departments(id),
CONSTRAINT fk_employees_address FOREIGN KEY(address_id)
REFERENCES addresses(id)
);
