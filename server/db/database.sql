CREATE DATABASE telerobot;
USE telerobot;
CREATE TABLE users(
 `id`       int NOT NULL AUTO_INCREMENT,
 `Nombre`   varchar(20) ,
 `Apellido` varchar(20) ,
 `email`    varchar(45) NOT NULL ,
 `password` text NOT NULL ,
 `token`    text NOT NULL ,

PRIMARY KEY (`id`)
);

CREATE TABLE robots(
 `id`     integer NOT NULL AUTO_INCREMENT,
 `nombre` varchar(45) NOT NULL ,
 `marca`  varchar(45) ,
 `grados` tinyint NOT NULL ,

PRIMARY KEY (`id`)
);

CREATE TABLE routines(
 `id`          integer NOT NULL AUTO_INCREMENT,
 `user_id`     int NOT NULL ,
 `robot_id`    integer NOT NULL ,
 `start`       point NOT NULL ,
 `end`         point NOT NULL ,
 `route`       multipoint ,
 `tool`        tinyint NOT NULL DEFAULT 0,
 `description` text ,

PRIMARY KEY (`id`),
KEY `FK_36` (`robot_id`),
CONSTRAINT `FK_34` FOREIGN KEY `FK_36` (`robot_id`) REFERENCES robots (`id`),
KEY `FK_41` (`user_id`),
CONSTRAINT `FK_39` FOREIGN KEY `FK_41` (`user_id`) REFERENCES users (`id`)
);

