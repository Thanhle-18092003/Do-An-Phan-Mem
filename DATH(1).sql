use master
go
if exists (select * from sysdatabases where name = 'DAPMTH')
	drop database DAPMTH
go
create database DAPMTH
go
use DAPMTH
go

CREATE TABLE SanPham
(
	  MaSP CHAR(5),
	  TenSP NVARCHAR(20),
	  HinhSP VARCHAR(max),
	  MoTaSP NVARCHAR(50),
	  GiaSP INT,
	  SoLuongSP INT,
	  TrangThai bit,
	  TenNSX Nvarchar(255),
	  NgaySX datetime,
	  NgayHetHan datetime,
	  MaLoai CHAR(5) NOT NULL,
	  PRIMARY KEY (MaSP),
);
Create table LoaiSP(
	 MaLoai Char(5) PRIMARY KEY,
	 TenLoai Nvarchar(255),
	 MoTa Nvarchar(255),
	 AnhLoai varchar(max),
	 NgayTao datetime,
	 NgayCapNhat datetime,
);

CREATE TABLE NhaCungCap
(
	MaNCC CHAR(5) , 
	TenNCC NVARCHAR(255),	
	SoDienThoaiNCC int,
	EmailNCC varchar(255),
	DiaChi NVARCHAR(255),
	MaSP char(5),
	PRIMARY KEY (MaNCC)
);

CREATE TABLE TaiKhoan(
	MaTK char(5) PRIMARY KEY ,
	TenDangNhap Varchar(255),
	MatKhau varchar(255),
	Email Varchar(255),
	Sodienthoai int ,
	HoTen Nvarchar(255),
);
	Create table KhachHang(
	MaKH char(5) PRIMARY KEY,
	TenKH nvarchar(255),
	SdtKH int,
	DiachiKH nvarchar(255),
	Email varchar(255),
	NgaySinh date,
	GioiTinh varchar(255),
	MaTK char(5)
);
Create Table DonHang(
	MaDH Char(5) PRIMARY KEY,
	TenDH nvarchar(255),
	TenKH nvarchar(255),
	SdtKH int,
	DiaChiGiaoHang nvarchar(255),
	TrangThaiDH nvarchar(255),
	NgayGiao Date,
	TongTien Float,
	MaKH char(5),
	MaSP char(5),
	MaHD char(5)
);
Create table HoaDon(
	MaHD char(5) PRIMARY KEY,
	NgayLap date,
	TongtienHang float,
	TienGiamGia float,
	TongTienTT float,
	HinhThucTT Nvarchar(255),

);
CREATE TABLE KhoHang
(
    MaKho CHAR(5) PRIMARY KEY,
    TenKho NVARCHAR(100),
    DiaChi NVARCHAR(200),
    MaSP char(5)
);

------------------Khóa Ngoại----------------------------------------
ALTER TABLE SanPham 
ADD CONSTRAINT FK_SanPham_LoaiSP 
FOREIGN KEY (MaLoai) REFERENCES LoaiSP(MaLoai);

ALTER TABLE NhaCungCap 
ADD CONSTRAINT FK_NhaCungCap_SanPham 
FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP);

ALTER TABLE DonHang 
ADD CONSTRAINT FK_DonHang_SanPham 
FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP);

ALTER TABLE DonHang 
ADD CONSTRAINT FK_DonHang_KhachHang 
FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH);

ALTER TABLE DonHang 
ADD CONSTRAINT FK_DonHang_HoaDon
FOREIGN KEY (MaHD) REFERENCES HoaDon(MaHD);

ALTER TABLE KhoHang 
ADD CONSTRAINT FK_KhoHang_SanPham 
FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP);

ALTER TABLE KhachHang 
ADD CONSTRAINT FK_KhachHang_TaiKhoan 
FOREIGN KEY (MaTK) REFERENCES TaiKhoan(MaTK);