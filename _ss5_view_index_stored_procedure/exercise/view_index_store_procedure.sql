DROP DATABASE IF EXISTS demo;
CREATE DATABASE demo;
USE demo;

create table products (
id int primary key,
product_code varchar(30),
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(50),
product_status varchar(50)
);

insert into products values (1,'MILK01','hl milk',20000,10,'nguyên kem','còn'); 
select * from products;
create unique index idx_products on products(product_code);
create index idx_products on products(product_name, product_price);

create view v_get_all_products as
select product_code, product_name, product_price, product_status
from products;

select* from v_get_all_products;

create or replace view v_get_all_products as
select product_code, product_name, product_description, product_amount
from products;

drop view v_get_all_products;

delimiter //
create procedure sp_find_products()
begin
select * from products;
end
// delimiter ;

call sp_find_products();


drop procedure if exists sp_find_products;
delimiter //
create procedure sp_find_products()
-- id int primary key ,product_code varchar(30),product_name varchar(50)
begin
insert into products values (2,'MILK02','Th true milk',30000,5,'origional','còn');
insert into products values (3,'MILK03','Vn milk',28000,3,'no sugar','hết');
insert into products values (4,'MILK04','fr milk',40000,10,'nguyên kem','còn');
end
// delimiter ;

call sp_find_products();
drop procedure if exists sp_find_products;
delimiter //
create procedure sp_find_products(id int, product_name varchar(50))
begin
update products set `product_name` = 'bavi milk' where id = 1;
end
// delimiter ;

call sp_find_products(1,'bavi milk');

delimiter //
drop procedure if exists sp_find_products;
create procedure sp_find_products(id int primary key)
begin
delete from products where id = 1;
end
// delimiter ;

call sp_find_products(1);