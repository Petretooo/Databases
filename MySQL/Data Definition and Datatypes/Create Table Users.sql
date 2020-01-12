USE minions;
CREATE TABLE users(
id BIGINT UNIQUE AUTO_INCREMENT,
username VARCHAR(30) NOT NULL,
password VARCHAR(26) NOT NULL,
profile_picture LONGBLOB,
last_login_time DATE,
is_deleted BOOLEAN,
CONSTRAINT pk_users PRIMARY KEY(id)
);
INSERT INTO users(id, username, password, profile_picture, last_login_time, is_deleted)
VALUES(1, 'Maxwell', 'f89haf', null,'2000-01-21', FALSE),
(2, 'PeshoMesho', '123456789', null,'2010-12-3', TRUE),
(3, 'ObiWanKenobi', 'starwars123', null,'2012-04-23', TRUE),
(4, 'SparowMoon', 'ffhh034%%#s', null,'2015-06-11', TRUE),
(5, 'Spark', 'telem00n', null, '2015-11-1', FALSE);