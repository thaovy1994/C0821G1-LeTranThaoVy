DROP DATABASE IF EXISTS sale_management;
CREATE DATABASE quan_ly_vat_tu;
USE quan_ly_vat_tu;

CREATE TABLE phieu_xuat(
so_phieu_xuat int primary key,
ngay_xuat date
);

CREATE TABLE phieu_nhap(
so_phieu_nhap int primary key,
ngay_nhap date
);

create table chi_tiet_phieu_xuat(
don_gia_xuat double,
so_luong_xuat int
);

create table chi_tiet_phieu_nhap(
don_gia_nhap double,
so_luong_nhap int
);

CREATE TABLE vat_tu(
ma_vat_tu int primary key,
ten_vat_tu varchar(40)
);

CREATE TABLE don_dat_hang(
so_dat_hang int primary key,
ngay_dat_hang date
);

CREATE TABLE nha_cung_cap(
ma_cung_cap int primary key,
ten_cung_cap varchar(50),
dia_chi varchar(50),
sdt int
);

create table vat_tu_receive_don_dat_hang(
ma_vat_tu_style int,
so_dat_hang_style int,
primary key(ma_vat_tu_style, so_dat_hang_style),
foreign key (ma_vat_tu_style) references vat_tu(ma_vat_tu),
foreign key (so_dat_hang_style) references don_dat_hang(so_dat_hang)
);

create table don_da_hang_provide_nha_cung_cap(
so_dat_hang_style int,
ma_cung_cap_style int,
primary key(so_dat_hang_style,ma_cung_cap_style),
foreign key(so_dat_hang_style) references don_dat_hang(so_dat_hang),
foreign key(ma_cung_cap_style) references nha_cung_cap(ma_cung_cap)
);