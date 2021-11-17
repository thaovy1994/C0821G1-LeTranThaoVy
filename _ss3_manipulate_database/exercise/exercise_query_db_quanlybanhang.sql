USE quan_ly_ban_hang;

ALTER TABLE customer modify customer_age int;
insert into customer values (1, 'Minh Quan',10);
insert into customer values (2, 'Ngoc Oanh',20);
insert into customer values (3, 'Hong Ha',50);

insert into `order` values (1,1,'2006-03-21',null);
insert into `order` values (2,2,'2006-03-23',null);
insert into `order` values (3,1,'2006-3-16',null);

insert into product values (1,'May Giat',3);
insert into product values (2,'Tu Lanh',5);
insert into product values (3,'Dieu Hoa',7);
insert into product values (4,'Quat',1);
insert into product values (5,'Bep Dien',2);

insert into `orderdetail` values (1,1,3);
insert into `orderdetail` values (1,3,7);
insert into `orderdetail` values (1,4,2);
insert into `orderdetail` values (2,1,1);
insert into `orderdetail` values (3,1,8);
insert into `orderdetail` values (2,5,4);
insert into `orderdetail` values (2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)