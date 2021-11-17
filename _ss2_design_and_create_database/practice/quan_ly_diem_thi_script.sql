drop database if exists quanlydiemthi; 
create database quanlydiemthi;
use quanlydiemthi;

create table hoc_sinh(
ma_hoc_sinh varchar(20) PRIMARY KEY,
ten_hoc_sinh varchar(50),
ngay_sinh datetime,
lop varchar(20),
gioi_tinh varchar(20)
);

create table mon_hoc(
ma_mon_hoc varchar(20) PRIMARY KEY,
ten_mon_hoc varchar(50)
);

create table bang_diem(
ma_hoc_sinh_style varchar(20),
ma_mon_hoc_style varchar(20),
diem_thi INT,
ngay_kiem_tra datetime,
PRIMARY KEY (ma_hoc_sinh_style, ma_mon_hoc_style),
FOREIGN KEY (ma_hoc_sinh_style) REFERENCES hoc_sinh(ma_hoc_sinh),
FOREIGN KEY (ma_mon_hoc_style) REFERENCES mon_hoc(ma_mon_hoc)
);

CREATE table giao_vien(
ma_giao_vien varchar(20) primary key,
ten_giao_vien varchar(20),
sdt varchar(10)
);

-- bổ sung thêm trường MaGV là khoá ngoại của bảng MonHoc vào table mon_hoc
ALTER TABLE mon_hoc ADD ma_giao_vien_style VARCHAR(20);
ALTER TABLE mon_hoc ADD CONSTRAINT fk_ma_giao_vien FOREIGN KEY (ma_giao_vien_style) REFERENCES giao_vien(ma_giao_vien);