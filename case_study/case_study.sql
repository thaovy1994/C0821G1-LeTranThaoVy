DROP DATABASE IF EXISTS case_study;
CREATE DATABASE case_study;
USE case_study;

CREATE TABLE vi_tri(
ma_vi_tri int primary key,
ten_vi_tri varchar(45)
);

CREATE TABLE trinh_do(
ma_trinh_do int primary key,
ten_trinh_do varchar(45)
);

CREATE TABLE bo_phan(
ma_bo_phan int primary key,
ten_bo_phan varchar(45)
);

CREATE TABLE nhan_vien(
ma_nhan_vien int primary key,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_vi_tri_style int,
ma_trinh_do_style int,
ma_bo_phan_style int,
foreign key (ma_vi_tri_style) references vi_tri(ma_vi_tri),
foreign key (ma_trinh_do_style) references trinh_do(ma_trinh_do),
foreign key (ma_bo_phan_style) references bo_phan(ma_bo_phan)
);

CREATE TABLE loai_khach(
ma_loai_khach int primary key,
ten_loai_khach varchar(45)
);

CREATE TABLE khach_hang(
ma_khach_hang int primary key,
ma_loai_khach_style int,
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh BIT(1),
so_cmnd varchar(45),
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key (ma_loai_khach_style) references loai_khach(ma_loai_khach)
);

CREATE TABLE loai_dich_vu(
ma_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(45)
);

CREATE TABLE kieu_thue(
ma_kieu_thue int primary key,
ten_kieu_thue varchar(45),
gia_thue double
);

CREATE TABLE dich_vu(
ma_dich_vu int primary key,
ma_kieu_thue_style int,
ma_loai_dich_vu_style int,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
foreign key (ma_kieu_thue_style) references kieu_thue(ma_kieu_thue),
foreign key (ma_loai_dich_vu_style) references loai_dich_vu(ma_loai_dich_vu)
);

CREATE TABLE hop_dong(
ma_hop_dong int primary key,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
tong_tien double,
ma_nhan_vien_style int,
ma_khach_hang_style int,
ma_dich_vu_style int,
foreign key (ma_nhan_vien_style) references nhan_vien(ma_nhan_vien),
foreign key (ma_khach_hang_style) references khach_hang(ma_khach_hang),
foreign key (ma_dich_vu_style) references dich_vu(ma_dich_vu)
);

CREATE TABLE dich_vu_di_kem(
ma_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi int,
trang_thai varchar(45)
);

CREATE TABLE hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key,
ma_hop_dong_style int,
ma_dich_vu_di_kem_style int,
so_luong int,
foreign key (ma_hop_dong_style) references hop_dong(ma_hop_dong),
foreign key (ma_dich_vu_di_kem_style) references dich_vu_di_kem(ma_dich_vu_di_kem)
);

-- task 1
insert into trinh_do values (1,'Trung cấp');
insert into trinh_do values (2,'Cao đẳng');
insert into trinh_do values (3,'Đại học');
insert into trinh_do values (4,'Sau Đại học');

insert into vi_tri values (1,'Lễ tân');
insert into vi_tri values (2,'Phục vụ');
insert into vi_tri values (3,'Chuyên viên');
insert into vi_tri values (4,'Giám sát');
insert into vi_tri values (5,'Quản lý');
insert into vi_tri values (6,'Giám đốc');

insert into bo_phan values (1,'Sale – Marketing');
insert into bo_phan values (2,'Hành Chính');
insert into bo_phan values (3,'Phục vụ');
insert into bo_phan values (4,'Quản lý');

insert into kieu_thue values (1,'theo năm',250000);
insert into kieu_thue values (2,'theo tháng',30000);
insert into kieu_thue values (3,'theo ngày',1500);
insert into kieu_thue values (4,'theo giờ',500);

insert into loai_dich_vu values(1,'Villa');
insert into loai_dich_vu values(2,'House ');
insert into loai_dich_vu values(3,'Rooom');

insert into loai_khach values(1,'Diamond');
insert into loai_khach values(2,'Platinium');
insert into loai_khach values(3,'Gold');
insert into loai_khach values(4,'Silver');
insert into loai_khach values(5,'Member');

insert into dich_vu_di_kem values(1,'massage',100,1,'available');
insert into dich_vu_di_kem values(2,'karaoke',200,1,'unavailable');
insert into dich_vu_di_kem values(3,'thức ăn',300,2,'available');
insert into dich_vu_di_kem values(4,'nước uống',100,3,'available');
insert into dich_vu_di_kem values(5,'thuê xe di chuyển tham quan resort',150,2,'available');

insert into nhan_vien values(1,'Le Tran Thao Vy',"1994-01-13","123456789",6.000,090123123,'mina@gmail.com','ltt',4,3,3);
insert into nhan_vien values(2,'Dang Huu Du',"1990-01-01","123123123",9.000,0905123456,'du@gmail.com','QN',2,3,2);
insert into nhan_vien values(3,'Nguyen Hoang Gia Bao',"1993-01-01","987654321",8.000,0905222222,'bao@gmail.com','DN',3,3,3);
insert into nhan_vien values(4,'Nguyen Phuc Duy',"1997-01-01","333444555",8.500,0905333333,'duy@gmail.com','HN',1,2,1);
insert into nhan_vien values(5,'Trung Kien',"1998-01-01","222333444",7.500,0905111222,'kien@gmail.com','DN',2,1,2);
insert into nhan_vien values(6,'Nhat Anh',"2003-01-01","666777888",7.200,0905234234,'anh@gmail.com','QB',2,3,1);
insert into nhan_vien values(7,'Huu Du',"1999-01-01","987654321",8.200,0905543210,'huudu@gmail.com','QN',4,4,4);
insert into nhan_vien values(8,'Kien Nguyen',"2001-01-01","345678123",6.000,0905000123,'Tkien@gmail.com','DN',5,3,1);
insert into nhan_vien values(9,'Kien Nguyen',"2001-01-01","345678123",6.000,0905000123,'Tkien@gmail.com','DN',5,3,1);
insert into nhan_vien values(10,'Tam Nguyen Anh',"2002-01-01","456987321",5.000,0905000003,'tam@gmail.com','DN',2,1,3);
update nhan_vien set ho_ten ='Van Dong' where ma_nhan_vien = 9;

insert into khach_hang values(1,2,'Thao Vy','1994-01-13',1,123456789,0905123123,'vy@gmail.com','Đà Nẵng');
insert into khach_hang values(2,3,'Ngoc Chien','1994-11-10',1,234234234,0905333333,'chien@gmail.com','Đà Nẵng');
insert into khach_hang values(3,1,'Nhat Anh','2003-11-10',0,888888888,0905545453,'a@gmail.com','Quảng Trị');
insert into khach_hang values(4,3,'Gia Bao','1993-11-10',0,777777777,09053646633,'b@gmail.com','Đà Nẵng');
insert into khach_hang values(5,5,'Huu Du','1990-11-10',0,666666666,090533424243,'hd@gmail.com','Quảng Nam');
insert into khach_hang values(6,2,'Van Dong','1998-11-10',0,555555555,0905354453333,'vd@gmail.com','Quảng Nam');
insert into khach_hang values(7,1,'Van Lanh','1996-11-10',0,444444444,0905111333,'vln@gmail.com','Gia Lai');
insert into khach_hang values(8,4,'Phuc Duy','1997-11-10',0,333334234,0905444333,'pd@gmail.com','Quảng Ninh');
insert into khach_hang values(9,4,'Le Phien','1998-11-10',0,222222222,0905399933,'lp@gmail.com','Quảng Nam');
insert into khach_hang values(10,5,'Trung Kien','1998-11-10',0,111111111,0905388333,'tk@gmail.com','Đà Nẵng');

insert into dich_vu values(1,3,1,'Villa',50,1600,20,'executive','free minibar',30,2);
insert into dich_vu values(2,1,2,'House',200,2000,25,'standard','free 2 cup of coffee',40,3);
insert into dich_vu values(3,2,2,'House',200,2000,25,'standard','free 2 bottle of water',35,3);
insert into dich_vu values(4,3,1,'Villa',100,1600,20,'executive','free upgrade room',30,2);
insert into dich_vu values(5,1,3,'Room',150,1800,23,'family','free minibar',40,1);

insert into hop_dong values (1,'2021-07-10','2021-10-10',3000,5000,3,2,1);
insert into hop_dong values (2,'2021-07-10','2021-10-10',3000,5000,1,3,4);
insert into hop_dong values (3,'2021-07-11','2021-10-11',3000,5000,2,3,1);
insert into hop_dong values (4,'2021-07-12','2021-10-12',3000,5000,1,7,4);
insert into hop_dong values (5,'2021-07-13','2021-10-14',4000,6000,1,3,2);

-- task 2.
select * 
from nhan_vien 
where ho_ten like 'k%' or ho_ten like 'h%' or ho_ten like 't%' and length(ho_ten) < 15;

-- task 3.
select *, (YEAR(CURDATE()) - YEAR(ngay_sinh)) AS age 
from khach_hang 
where dia_chi = 'Đà Nẵng' or dia_chi = 'Quảng Trị'and (YEAR(CURDATE()) - YEAR(ngay_sinh)) between 18 and 50;

-- task 4.
-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, count(*) AS 'số lần đặt'
from khach_hang kh 
inner join loai_khach lk on kh.ma_loai_khach_style = lk.ma_loai_khach
inner join hop_dong hd on hd.ma_khach_hang_style = kh.ma_khach_hang
-- hiển thị những khách là Diamond.
where ma_loai_khach_style = 1
group by kh.ma_khach_hang;
-- hiển thị số lần đặt phòng sx tăng dần.


-- task 5.
-- hiển thị khách từng đặt phòng (kể cả chưa từng đặt)
-- select ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, SUM( 