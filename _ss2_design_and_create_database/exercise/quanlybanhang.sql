CREATE DATABASE quanlybanhang;
USE quanlybanhang;

CREATE TABLE phieu_xuat(
so_px int primary key,
ngay_xuat date
);

CREATE TABLE vat_tu(
ma_vtu int primary key,
ten_vtu varchar(40)
);

CREATE TABLE phieu_nhap(
so_pn int primary key,
ngay_nhap date
);

CREATE TABLE don_dh(
so_dh int primary key,
ngay_dh date
);

CREATE TABLE nha_cc(
ma_ncc int primary key,
ten_ncc varchar(50),
dia_chi varchar(50),
sdt int
);

create table chi_tiet_phieu_xuat(
dg_xuat double,
sl_xuat int
);

create table chi_tiet_phieu_nhap(
dg_nhap double,
sl_nhap int
);

create table vat_tu_order_don_dh(
vat_tu_ma_vtu int,
don_dh_so_dh int,
primary key(vat_tu_ma_vtu, don_dh_so_dh),
foreign key (vat_tu_ma_vtu) references vat_tu(ma_vtu),
foreign key (don_dh_so_dh) references don_dh(so_dh)
);

create table don_dh_provide_nha_cc(
don_dh_so_dh int,
nha_cc_ma_ncc int,
primary key(don_dh_so_dh,nha_cc_ma_ncc),
foreign key(don_dh_so_dh) references don_dh(so_dh),
foreign key(nha_cc_ma_ncc) references nha_cc(ma_ncc)
);