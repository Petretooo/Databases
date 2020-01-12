CREATE DATABASE Movies;
USE Movies;
CREATE TABLE directors(
id INT NOT NULL AUTO_INCREMENT,
director_name VARCHAR(50) NOT NULL,
notes TEXT(65535),
CONSTRAINT pk_directors PRIMARY KEY(id)
);
CREATE TABLE genres(
id INT NOT NULL AUTO_INCREMENT,
genre_name VARCHAR(50) NOT NULL,
notes TEXT(65535),
CONSTRAINT pk_genres PRIMARY KEY(id)
);
CREATE TABLE categories(
id INT NOT NULL AUTO_INCREMENT,
category_name VARCHAR(50) NOT NULL,
notes TEXT(65535),
CONSTRAINT pk_categories PRIMARY KEY(id)
);
CREATE TABLE movies(
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(50) NOT NULL,
director_id INT,
copyright_year DATE,
length FLOAT(2),
genre_id INT,
category_id INT,
rating FLOAT(3),
notes TEXT(65535),
CONSTRAINT pk_movies PRIMARY KEY(id)
);

USE movies;
INSERT INTO directors(director_name, notes)
VALUES 
('Brad Pitt', 'William Bradley Pitt (born December 18, 1963) is an American actor and film producer. He has received multiple awards and nominations including an Academy Award as producer under his own company, Plan B Entertainment.'),
('Sylvester Stallone', 'Sylvester Enzio Stallone[1] (/stəˈloʊn/; born Michael Sylvester Gardenzio Stallone,[2][3] July 6, 1946) is an American actor, director, screenwriter, and producer.'),
('Tom Cruise', 'Thomas Cruise[1] (born Thomas Cruise Mapother IV; July 3, 1962) is an American actor and film producer. He has received several accolades for his work, including three Golden Globe Awards and nominations for three Academy Awards. Cruise is one of the best-paid actors in the world,[2] and his films have grossed over $4 billion in North America and over $10.1 billion worldwide,[3] making him one of the highest-grossing box-office stars of all time.[4]'),
('Tom Hanks', 'Thomas Jeffrey Hanks (born July 9, 1956) is an American actor and filmmaker. Hanks is known for his comedic and dramatic roles in such films as Splash (1984), Big (1988),'),
('Will Smith', 'Willard Carroll Smith Jr. (born September 25, 1968) is an American actor, rapper and media personality.[3] In April 2007, Newsweek called him "the most powerful actor in Hollywood".[4] Smith has been nominated for five Golden Globe Awards and two Academy Awards, and has won four Grammy Awards.');

INSERT INTO genres(genre_name, notes)
VALUES
('DRAMA', 'Me Before You'),
('SCI-FI', 'Star Wars'),
('HORROR', 'ANABEL'),
('Fantasy', 'Lord of the Rings'),
('Thriler', 'Angels and Demons');

INSERT INTO categories(category_name, notes)
VALUES
('A', 'fafads'),
('A', 'FASFASF'),
('B', 'FAT4AA'),
('A', 'T4ATAT'),
('A', 'FSAFAF');

INSERT INTO movies(title, director_id, copyright_year, length, genre_id, category_id, rating, notes)
VALUES
('Lord of the Rings', 1, '1999-03-11', 2.434, 4, 4, 9.9 ,'FNJIEHFIJEHFIEHFJLDSHFSKJFH'),
('Me Before You', 2, '2001-11-03', 2.434, 1,1, 9.8 ,'FNJIEHFIJEHFIEHFJLDSHFSKJFH'),
('Star Wars', 3, '2005-12-04', 2.434, 2, 2, 9.9 ,'FNJIEHFIJEHFIEHFJLDSHFSKJFH'),
('Angels and Demons', 4, '2013-04-13',2.434, 5, 5, 9.9 ,'FNJIEHFIJEHFIEHFJLDSHFSKJFH'),
('Anabel', 5, '2017-04-12',2.434, 3, 3, 7.4 ,'FNJIEHFIJEHFIEHFJLDSHFSKJFH');
