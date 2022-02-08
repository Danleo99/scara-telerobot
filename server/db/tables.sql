create database if not exists telerobot;
use telerobot;

create table if not exists users (
	id int(11) not null auto_increment,
    email varchar(45) not null,
    password varchar(45) not null,
    token varchar(45) not null,
    primary key (id)
);
select * from users;

describe users;