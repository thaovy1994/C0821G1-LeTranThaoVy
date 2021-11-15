use quanlydiemthi;

create table hocsinh(
ma_hs varchar(20) PRIMARY KEY,
ten_hs varchar(50),
ngaysinh datetime,
lop varchar(20),
gt varchar(20)
);

create table monhoc(
ma_mh varchar(20) PRIMARY KEY,
ten_mh varchar(50)
);

create table bangdiem(
ma_hs varchar(20),
ma_mh varchar(20),
diemthi INT,
ngaykt datetime,
PRIMARY KEY (ma_hs, ma_mh),
FOREIGN KEY (ma_hs) REFERENCES hocsinh(ma_hs),
FOREIGN KEY (ma_mh) REFERENCES monhoc(ma_mh)
);

CREATE table giaovien(
ma_gv varchar(20) primary key,
ten_gv varchar(20),
sdt varchar(10)
);

ALTER TABLE monhoc ADD ma_gv VARCHAR(20);
ALTER TABLE monhoc ADD CONSTRAINT fk_magv FOREIGN KEY (ma_gv) REFERENCES giaovien(ma_gv);

DROP TABLE bangdiem;
DROP TABLE hocsinh;
DROP TABLE monhoc;
DROP TABLE giaovien;

create table hocsinh(
ma_hs varchar(20) PRIMARY KEY,
ten_hs varchar(50),
ngaysinh datetime,
lop varchar(20),
gt varchar(20)
);

create table monhoc(
ma_mh varchar(20) PRIMARY KEY,
ten_mh varchar(50)
);

create table bangdiem(
ma_hs varchar(20),
ma_mh varchar(20),
diemthi INT,
ngaykt datetime,
PRIMARY KEY (ma_hs, ma_mh),
FOREIGN KEY (ma_hs) REFERENCES hocsinh(ma_hs),
FOREIGN KEY (ma_mh) REFERENCES monhoc(ma_mh)
);

CREATE table giaovien(
ma_gv varchar(20) primary key,
ten_gv varchar(20),
sdt varchar(10)
);

ALTER TABLE monhoc ADD ma_gv VARCHAR(20);
ALTER TABLE monhoc ADD CONSTRAINT fk_magv FOREIGN KEY (ma_gv) REFERENCES giaovien(ma_gv);