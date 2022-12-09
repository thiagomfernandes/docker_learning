CREATE DATABASE flaskdocker;
USE flaskdocker;

CREATE TABLE `flaskdocker`.`users`(
    `id` int not null auto_increment,
    `name` varchar(255),
    PRIMARY KEY(id)
);