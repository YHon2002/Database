CREATE DATABASE QLBH;
USE QLBH;

-- KHACHANG
CREATE TABLE KHACHHANG(
 MAKH char(4) not null primary key, 
 HOTEN varchar(40),
 DCHI varchar(50),
 SODT varchar(20),
 NGSINH datetime,
 NGDK datetime,
 DOANHSO decimal(10,2)
);
---------------------------------------------
-- NHANVIEN
CREATE TABLE NHANVIEN(
 MANV char(4) not null primary key, 
 HOTEN varchar(40),
 SODT varchar(20),
 NGVL datetime 
);
---------------------------------------------
-- SANPHAM
CREATE TABLE SANPHAM(
 MASP char(4) not null primary key,
 TENSP varchar(40),
 DVT varchar(20),
 NUOCSX varchar(40),
 GIA decimal(10,2)
);
---------------------------------------------
-- HOADON
CREATE TABLE HOADON(
 SOHD int not null primary key,
 NGHD datetime,
 MAKH char(4),
 MANV char(4),
 TRIGIA decimal(10,2),
 FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH),
 FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
);
---------------------------------------------
-- CTHD
CREATE TABLE CTHD(
 SOHD int,
 MASP char(4),
 SL int,
 primary key(SOHD,MASP),
 FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD),
 FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)
);
 

-- KHACHHANG
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO)
VALUES
('KH01','Nguyen Van Hieu','1 Tran Hung Dao, Q.Hai Chau, Tp.DaNang','0358823451','2000/10/22','2021/01/01',13060000),
('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q.Hai Chau, Tp.DaNang','0908256478','1999/03/04','2021/01/02',280000),
('KH03','Tran Ngoc Linh','45 Tran Quang Dieu, Q.Son Tra, Tp.DaNang','0938776266','1998/06/12','2021/01/03',3860000),
('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q.Cam Le, Tp.DaNang','0917325476','1997/03/09','2021/01/04',250000),
('KH05','Le Nhat Minh','34 Truong Dinh, Q.Son Tra, Tp.DaNang','0358246108','1996/03/10','2021/01/05',21000),
('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q.Lien Chieu, Tp.DaNang','0358631738','1995/12/31','2021/01/06',915000),
('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q.Hai Chau, Tp.DaNang','0916783565','1994/04/06','2021/01/07',12500),
('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q.Ngu Hanh Son, Tp.DaNang','0938435756','1993/01/10','2021/01/08',365000),
('KH09','Le Ha Vinh','873 Le Hong Phong, Q.Hai Chau, Tp.DaNang','0358654763','1992/09/03','2021/01/09',70000),
('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q.Hai Chau, Tp.DaNang','0358768904','1991/05/02','2021/01/10',67500);
 
-------------------------------
-- NHANVIEN
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL)
VALUES
('NV01','Nguyen Van Nhut','0927345678','2018/04/13'),
('NV02','Le Thi Phi Yen','0987567390','2018/04/21'),
('NV03','Nguyen Van B','0997047382','2018/04/17'),
('NV04','Ngo Thanh Tuan','0913758498','2018/06/24'),
('NV05','Nguyen Thi Truc Thanh','0918590387','2018/07/20');
 
-------------------------------
-- SANPHAM
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA)
VALUES
('BC01','But chi','cay','Singapore',3000),
('BC02','But chi','cay','Singapore',5000),
('BC03','But chi','cay','Viet Nam',3500),
('BC04','But chi','hop','Viet Nam',30000),
('BB01','But bi','cay','Viet Nam',5000),
('BB02','But bi','cay','Trung Quoc',7000),
('BB03','But bi','hop','Thai Lan',100000),
('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500),
('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500),
('TV03','Tap 100 giay tot','quyen','Viet Nam',3000),
('TV04','Tap 200 giay tot','quyen','Viet Nam',5500),
('TV05','Tap 100 trang','chuc','Viet Nam',23000),
('TV06','Tap 200 trang','chuc','Viet Nam',53000),
('TV07','Tap 100 trang','chuc','Trung Quoc',34000),
('ST01','So tay 500 trang','quyen','Trung Quoc',40000),
('ST02','So tay loai 1','quyen','Viet Nam',55000),
('ST03','So tay loai 2','quyen','Viet Nam',51000),
('ST04','So tay','quyen','Thai Lan',55000),
('ST05','So tay mong','quyen','Thai Lan',20000),
('ST06','Phan viet bang','hop','Viet Nam',5000),
('ST07','Phan khong bui','hop','Viet Nam',7000),
('ST08','Bong bang','cai','Viet Nam',1000),
('ST09','But long','cay','Viet Nam',5000),
('ST10','But long','cay','Trung Quoc',7000);
 
-------------------------------
-- HOADON
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA)
VALUES
(1001,'2021/01/01','KH01','NV01',320000),
(1002,'2021/03/03','KH01','NV02',840000),
(1003,'2021/01/02','KH02','NV01',100000),
(1004,'2021/05/04','KH02','NV01',180000),
(1005,'2021/01/03','KH03','NV02',3800000),
(1006,'2021/07/06','KH03','NV03',2430000),
(1007,'2021/01/04','KH04','NV03',510000),
(1008,'2021/03/08','KH04','NV03',440000),
(1009,'2021/01/05','KH05','NV04',200000),
(1010,'2021/05/10','KH05','NV01',5200000),
(1011,'2021/01/06','KH06','NV03',250000),
(1012,'2021/07/12','KH06','NV03',21000),
(1013,'2021/01/07','KH07','NV01',5000),
(1014,'2021/03/14','KH07','NV02',3150000),
(1015,'2021/01/08','KH08','NV01',910000),
(1016,'2021/05/16','KH08','NV02',12500),
(1017,'2021/01/09','KH09','NV03',35000),
(1018,'2021/07/18','KH09','NV03',330000),
(1019,'2021/01/10','KH10','NV03',30000),
(1020,'2021/03/20','KH10','NV04',70000);
 
-------------------------------
-- CTHD
INSERT INTO CTHD (SOHD, MASP, SL)
VALUES
(1001,'TV02',10),
(1002,'ST01',5),
(1003,'BC01',5),
(1004,'BC02',10),
(1005,'ST08',10),
(1006,'BC04',20),
(1007,'BB01',20),
(1008,'BB02',20),
(1009,'BB03',10),
(1010,'TV01',20),
(1001,'TV02',10),
(1002,'TV03',10),
(1003,'TV04',10),
(1004,'TV05',50),
(1005,'TV06',50),
(1006,'TV07',20),
(1007,'ST01',30),
(1008,'ST02',10),
(1009,'ST03',10),
(1010,'ST04',8),
(1001,'ST05',10),
(1002,'TV07',50),
(1003,'ST07',50),
(1004,'ST08',100),
(1005,'ST04',50),
(1006,'TV03',100),
(1007,'ST06',50),
(1008,'ST07',3),
(1009,'ST08',5),
(1010,'BC02',80),
(1001,'BB02',100),
(1002,'BC04',60),
(1003,'BB01',50),
(1004,'BB02',30),
(1005,'BB03',7),
(1006,'TV01',5),
(1007,'TV02',1),
(1008,'TV03',1),
(1009,'TV04',5),
(1010,'ST04',6),
(1001,'ST05',1),
(1002,'ST06',2),
(1003,'ST07',10);

----------------------------------------------------------------
----------------------------------------------------------------
SELECT * FROM KHACHHANG;
SELECT * FROM NHANVIEN;
SELECT * FROM SANPHAM;
SELECT * FROM HOADON;
SELECT * FROM CTHD;

drop database QLBH;