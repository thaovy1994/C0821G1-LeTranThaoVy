DROP DATABASE IF EXISTS case_study;
CREATE DATABASE case_study;
USE case_study;

CREATE TABLE vi_tri(
ma_vi_tri int primary key NOT NULL AUTO_INCREMENT,
ten_vi_tri varchar(45) NOT NULL
);

CREATE TABLE trinh_do(
ma_trinh_do int primary key NOT NULL AUTO_INCREMENT,
ten_trinh_do varchar(45) NOT NULL
);

CREATE TABLE bo_phan(
ma_bo_phan int primary key NOT NULL AUTO_INCREMENT,
ten_bo_phan varchar(45) NOT NULL
);

CREATE TABLE nhan_vien(
ma_nhan_vien int primary key NOT NULL AUTO_INCREMENT,
ho_ten varchar(45) NOT NULL,
ngay_sinh date NOT NULL,
so_cmnd varchar(45) NOT NULL UNIQUE,
luong double NOT NULL,
so_dien_thoai varchar(45) NOT NULL,
email varchar(45),
dia_chi varchar(45) NOT NULL,
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);

CREATE TABLE loai_khach(
ma_loai_khach int primary key NOT NULL AUTO_INCREMENT,
ten_loai_khach varchar(45) NOT NULL
);

CREATE TABLE khach_hang(
ma_khach_hang int primary key NOT NULL AUTO_INCREMENT,
ho_ten varchar(45) NOT NULL,
ngay_sinh date NOT NULL,
gioi_tinh BIT(1) NOT NULL,
so_cmnd varchar(45) NOT NULL UNIQUE,
so_dien_thoai varchar(45) NOT NULL,
email varchar(45),
dia_chi varchar(45) NOT NULL,
ma_loai_khach int,
foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);

CREATE TABLE loai_dich_vu(
ma_loai_dich_vu int primary key NOT NULL AUTO_INCREMENT,
ten_loai_dich_vu varchar(45) NOT NULL
);

CREATE TABLE kieu_thue(
ma_kieu_thue int primary key NOT NULL AUTO_INCREMENT,
ten_kieu_thue varchar(45) NOT NULL,
gia_thue double
);

CREATE TABLE dich_vu(
ma_dich_vu int primary key NOT NULL AUTO_INCREMENT,
ten_dich_vu varchar(45) NOT NULL,
dien_tich int NOT NULL,
chi_phi_thue double NOT NULL,
so_nguoi_toi_da int,
tieu_chuan_phong varchar(45) NOT NULL,
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double NOT NULL,
so_tang int,
ma_kieu_thue int,
ma_loai_dich_vu int,
foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);

CREATE TABLE hop_dong(
ma_hop_dong int primary key NOT NULL AUTO_INCREMENT,
ngay_lam_hop_dong datetime NOT NULL,
ngay_ket_thuc datetime NOT NULL,
tien_dat_coc double NOT NULL,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);

CREATE TABLE dich_vu_di_kem(
ma_dich_vu_di_kem int primary key NOT NULL AUTO_INCREMENT,
ten_dich_vu_di_kem varchar(45) NOT NULL,
gia double NOT NULL,
don_vi int NOT NULL,
trang_thai varchar(45)
);

CREATE TABLE hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key NOT NULL AUTO_INCREMENT,
so_luong int NOT NULL,
ma_hop_dong int,
ma_dich_vu_di_kem int,
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);

-- task 1
insert into trinh_do values (1,'Trung cấp');
insert into trinh_do (ten_trinh_do) values ('Cao đẳng');
insert into trinh_do (ten_trinh_do) values ('Đại học');
insert into trinh_do (ten_trinh_do) values ('Sau Đại học');

insert into vi_tri (ten_vi_tri) values ('Lễ tân'),('Phục vụ'),('Chuyên viên'),('Giám sát'),('Quản lý'),('Giám đốc');

insert into bo_phan (ten_bo_phan) values ('Sale – Marketing'),('Hành Chính'),('Phục vụ'),('Quản lý');

insert into kieu_thue (ten_kieu_thue,gia_thue) values ('theo năm',25000),('theo tháng',3000),('theo ngày',1500),('theo giờ',500);

insert into loai_dich_vu (ten_loai_dich_vu) values('Villa'),('House'),('Room');

insert into loai_khach (ten_loai_khach) values('Diamond'),('Platinum'),('Gold'),('Silver'),('Member');

insert into dich_vu_di_kem (ten_dich_vu_di_kem,gia,don_vi,trang_thai) values
('massage',100,1,'available'),
('karaoke',200,1,null),
('food',300,2,'available'),
('drink',100,3,'available'),
('rent car for sightseeing around resort',150,2,null);

insert into nhan_vien (ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan) values
('Thao Vy','1994-01-13','DN123456',9.000,'090123123','mina@gmail.com','ltt',6,4,4),
('Huu Du','1990-01-01','QN123456',9.000,'0905123456','du@gmail.com','QN',5,3,3),
('Gia Bao',"1993-01-01","DN7654321",9.500,0905222222,'bao@gmail.com','DN',4,2,2),
('Phuc Duy',"1997-01-01","QN333444",8.500,0905333333,'duy@gmail.com','HN',3,1,1),
('Trung Kien',"1998-01-01","DN222333",8.500,0905111222,'kien@gmail.com','DN',2,1,1),
('Nhat Anh',"2003-01-01","QB666777",7.900,0905234234,'anh@gmail.com','QB',1,2,2),
('Kien Nguyen',"2001-01-01","DN345678",7.800,0905000123,null,'DN',1,3,3),
('Van Dong',"2001-01-01","QN345678",7.200,0905000123,null,'QN',2,4,4),
('Tam Anh',"2002-01-01","QN456987",7.200,0905000003,null,'QN',3,4,4),
('Hai Truong',"2002-01-01","QN698732",10.000,0905000003,null,'QN',4,3,3);

insert into khach_hang (ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach) values
('Thao Vy','1994-01-13',1,123456789,0905123123,'vy@gmail.com','Đà Nẵng',1),
('Ngoc Chien','1994-11-10',1,234234234,0905333333,'chien@gmail.com','Đà Nẵng',1),
('Nhat Anh','2003-11-10',0,888888888,0905545453,'a@gmail.com','Quảng Trị',2),
('Gia Bao','1993-11-10',0,777777777,09053646633,'b@gmail.com','Đà Nẵng',2),
('Huu Du','1990-11-10',0,666666666,090533424243,'hd@gmail.com','Quảng Nam',3),
('Van Dong','1998-11-10',0,555555555,0905354453333,'vd@gmail.com','Quảng Nam',3),
-- ('Phuc Duy','1997-11-10',0,333334234,0905444333,'pd@gmail.com','Quảng Ninh',4),
-- ('Le Phien','1998-11-10',0,222222222,0905399933,'lp@gmail.com','Quảng Nam',5),
('Trung Kien','1998-11-10',0,111121111,0905388333,'tk@gmail.com','Đà Nẵng',5),
-- ('Trung Kien','1998-11-10',0,111131111,0905388333,'kn@gmail.com','Lạng Sơn',1),
('My le','1991-08-10',0,111114111,0905368333,'my@gmail.com','Quảng Ngãi',1),
('Thuong Khac','1986-11-10',0,115111111,0905488333,'thuong@gmail.com','Vinh',1),
('Nghia','1996-11-10',0,111121611,0905888333,'nghia@gmail.com','Vinh',3);

insert into dich_vu (ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,ma_kieu_thue,ma_loai_dich_vu) 
values 
('Villa',50,1600,null,'executive',null,30,null,1,1),
('House',200,2000,25,'standard','free 2 cup of coffee',40,null,2,2),
('House',200,2000,25,'standard','free 2 bottle of water',35,null,3,3),
('Villa',100,1600,20,'executive','free upgrade room',30,null,4,1),
('Room',150,1800,23,'family','free minibar',40,null,1,2);

insert into hop_dong (ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values 
('2019-07-10','2019-10-10',3000,3,1,1),
('2019-07-10','2019-10-10',3000,2,2,2),
('2018-07-11','2018-10-11',3000,1,3,3),
('2021-07-12','2021-10-12',3000,6,4,4),
('2021-07-13','2021-10-14',4000,5,5,5),
('2020-07-13','2020-10-14',3500,4,6,1),
('2020-07-13','2020-10-14',3500,10,1,2),
('2019-01-13','2019-01-23',3500,9,2,3),
('2018-01-13','2018-01-23',4000,8,1,4),
('2019-02-13','2018-05-23',5000,7,2,5);

insert into hop_dong_chi_tiet (so_luong,ma_hop_dong,ma_dich_vu_di_kem) values 
(2,1,2),
(4,2,3),
(8,3,1);

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
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, count(hd.ma_hop_dong) AS 'số lần đặt'
from khach_hang kh 
inner join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
inner join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
-- hiển thị những khách là Diamond.
where lk.ten_loai_khach = 'Diamond'
group by kh.ma_khach_hang
-- hiển thị số lần đặt phòng sx tăng dần.
order by hd.ma_hop_dong ASC;

-- task 5.
-- hiển thị khách từng đặt phòng (kể cả chưa từng đặt)
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, dv.ten_dich_vu,
sum(hdct.so_luong*dvdk.gia) + dv.chi_phi_thue AS total
from khach_hang AS kh
join loai_khach AS lk on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong AS hd on hd.ma_khach_hang = kh.ma_khach_hang
join hop_dong_chi_tiet AS hdct on hdct.ma_hop_dong= hd.ma_hop_dong
join dich_vu_di_kem AS dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join dich_vu AS dv on dv.ma_dich_vu = hd.ma_dich_vu
group by hd.ma_hop_dong;

-- task 6
-- ... các loại dịch vụ chưa từng được khách hàng thực hiện 
-- đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong AS hd on hd.ma_dich_vu = dv.ma_dich_vu
where not exists(
select *
from hop_dong AS hd
where hd.ma_dich_vu = dv.ma_dich_vu and month(hd.ngay_lam_hop_dong) between 1 and 4 and year(hd.ngay_lam_hop_dong) = 2019
)
group by ma_dich_vu;
-- where hd.ngay_lam_hop_dong between '2019-01-01' and '2019-03-31';

-- task 7
-- tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2018 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2019.
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong
from dich_vu AS dv
join loai_dich_vu AS ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
join hop_dong AS hd on hd.ma_dich_vu= dv.ma_dich_vu
where year(ngay_lam_hop_dong) = 2018 and hd.ma_hop_dong not in (
select ma_dich_vu
from dich_vu  
where year(ngay_lam_hop_dong) = 2019
);

-- task 8
-- cách 1:
select distinct ho_ten
from khach_hang;
-- cách 2:
select ho_ten
from khach_hang
union 
select ho_ten
from khach_hang;
-- cách 3:
select ma_khach_hang, ho_ten
from khach_hang
group by ho_ten;

-- task 9
-- doanh thu theo tháng
-- mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select hd.ma_hop_dong, kh.ho_ten, hd.ngay_lam_hop_dong, hdct.so_luong,
sum(hdct.so_luong*dvdk.gia) + dv.chi_phi_thue AS total
from khach_hang AS kh
join loai_khach AS lk on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong AS hd on hd.ma_khach_hang = kh.ma_khach_hang
join hop_dong_chi_tiet AS hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem AS dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join dich_vu AS dv on dv.ma_dich_vu = hd.ma_dich_vu
where year(ngay_lam_hop_dong) = 2019
group by month(ngay_lam_hop_dong); 

-- task 10
-- hiển thị hợp đồng - dv đi kèm
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, dvdk.don_vi, dvdk.ten_dich_vu_di_kem
,sum(dvdk.ma_dich_vu_di_kem) AS so_luong_dvdk
from hop_dong AS hd
left join hop_dong_chi_tiet AS hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem AS dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
;

-- task 11
-- 11.	Hiển thị thông tin các dịch vụ đi kèm
-- bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
-- Hiển thị thông tin các dịch vụ đi kèm
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, kh.ho_ten, lk.ten_loai_khach, kh.dia_chi
from hop_dong AS hd
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach AS lk on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong_chi_tiet AS hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem AS dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where ten_loai_khach = 'Diamond' and (dia_chi = 'Vinh' or dia_chi = 'Quảng Ngãi');

-- task 12
select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu, sum(dvdk.don_vi) AS so_luong_dich_vu_di_kem, tien_dat_coc 
from hop_dong AS hd
join nhan_vien AS nv on nv.ma_nhan_vien = hd.ma_nhan_vien
join khach_hang AS kh on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu AS dv on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet AS hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem AS dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where month(hd.ngay_lam_hop_dong) between 10 and 12 and year(hd.ngay_lam_hop_dong) = 2019
and hd.ma_hop_dong not in (
select hd.ma_hop_dong
from hop_dong
where month(hd.ngay_lam_hop_dong) between 1 and 6 and year(hd.ngay_lam_hop_dong) = 2019
)
group by ma_hop_dong;

-- task 13
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, max(dvdk.don_vi)
from khach_hang AS kh 
join hop_dong AS hd on kh.ma_khach_hang = hd.ma_khach_hang
join hop_dong_chi_tiet AS hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem AS dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem;

-- task 14
select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(ldv.ma_loai_dich_vu) AS so_lan_su_dung
from khach_hang AS kh 
join hop_dong AS hd on kh.ma_khach_hang = hd.ma_khach_hang
join hop_dong_chi_tiet AS hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem AS dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join dich_vu AS dv on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu AS ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dvdk.don_vi = 1
group by hd.ma_hop_dong;

-- task 15
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, count(hd.ma_hop_dong) AS so_luong_hop_dong
from nhan_vien AS nv
join trinh_do AS td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan AS bp on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong AS hd on hd.ma_nhan_vien = nv.ma_nhan_vien
group by ma_nhan_vien
having count(hd.ma_hop_dong) <3 
-- and year(hd.ngay_lam_hop_dong) between 2018 and 2019
;

-- task 16
-- Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
set SQL_SAFE_UPDATES= 0;
delete from nhan_vien 
where ma_nhan_vien not in (
select nv.ma_nhan_vien
from hop_dong AS hd
join nhan_vien AS nv on hd.ma_nhan_vien = nv.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) between 2017 and 2019);
set sql_safe_updates = 1;
-- tắt chế độ ràng buộc khóa ngoại
-- SET FOREIGN_KEY_CHECKS=0;
-- select *
-- from nhan_vien;

-- task 17
set sql_safe_update = 0;
update loai_dich_vu set ten_loai_dich_vu = 'Platinum'
where ten_loai_dich_vu = 'Diamond';
set sql_safe_update = 1;

-- task 20
select ma_nhan_vien, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
from khach_hang;