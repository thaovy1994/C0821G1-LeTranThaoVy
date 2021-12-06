DROP DATABASE IF EXISTS demo;
CREATE DATABASE demo;
USE demo;

create table users (
 id  int(3) NOT NULL AUTO_INCREMENT,
 `name` varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120),
 PRIMARY KEY (id)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

SELECT * FROM users
ORDER BY `name`;

delimiter //
create procedure get_user_by_id (IN user_id int)
begin
	SELECT users.`name`, users.email, users.country
    FROM users
    where users.id = user_id;
end
// delimiter ;

delimiter //
create procedure insert_user 
	(IN user_name varchar(50),
	IN user_email varchar(50),
	IN user_country varchar(50))
begin
	INSERT INTO users(`name`, email, country) VALUES(user_name, user_email, user_country);
end
// delimiter ;

create table permision(
id int(11) primary key,
`name` varchar(50)
);

create table user_permision(
permision_id int(11),
user_id int(11)
);

insert into Permision(id, name) values(1, 'add');
insert into Permision(id, name) values(2, 'edit');
insert into Permision(id, name) values(3, 'delete');
insert into Permision(id, name) values(4, 'view');
