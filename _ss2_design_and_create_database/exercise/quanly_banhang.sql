DROP database IF EXISTS quanlybanhang;
CREATE database quanlybanhang;
USE quanlybanhang;

CREATE TABLE customer(
c_id int primary key,
c_name varchar(45),
c_age date
);

CREATE TABLE `order`(
o_id int primary key,
customer_c_id int,
o_date date,
o_total_price double,
foreign key (customer_c_id) references customer(c_id)
);

CREATE TABLE product(
p_id int primary key,
p_name varchar(45),
p_price double
);

CREATE TABLE `orderdetail`(
order_o_id int ,
product_p_id int,
od_qty int,
foreign key (order_o_id) references `order`(o_id),
foreign key (product_p_id) references `product`(p_id)
);