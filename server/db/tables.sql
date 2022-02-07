create database if not exists telerobot;
use telerobot;

create table users (
	id int(11) not null auto_increment,
    email varchar(45) not null,
    password varchar(45) not null,
    token varchar(45) not null,
    primary key (id)
);

insert into users values
	(1, 'admin', 'admin1234', 'fawe41413dasd421fasd3');

select * from users;

describe users;