DROP database IF EXISTS quanlybanhang;
CREATE database quan_ly_ban_hang;
USE quan_ly_ban_hang;

CREATE TABLE customer(
customer_id int primary key,
customer_name varchar(45),
customer_age date
);

CREATE TABLE product(
product_id int primary key,
product_name varchar(45),
product_price double
);

CREATE TABLE `order`(
order_id int primary key,
customer_customer_id int,
order_date date,
order_total_price double,
foreign key (customer_customer_id) references customer(customer_id)
);

CREATE TABLE `orderdetail`(
order_order_id int ,
product_product_id int,
order_quantity int,
foreign key (order_order_id) references `order`(order_id),
foreign key (product_product_id) references product(product_id)
);