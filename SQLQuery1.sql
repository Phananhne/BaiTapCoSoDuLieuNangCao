Create database QuanLySinhVien
go
use QuanLySinhVien
go

Create table Khoa(
	MaKhoa varchar(10) primary key,
	TenKhoa nvarchar(100),
	NamThanhLap int,
)
go
Create table MonHoc(
	MaMH varchar(10) primary key, 
	TenMH nvarchar(100),
	HocKy int,
	MaKhoa varchar(10) not null,
	foreign key(MaKhoa) references Khoa(MaKhoa)
)
go

Create table ChuongTrinh(
	MaCT varchar(10) primary key,
	TenCT nvarchar(100),
	MaNganh varchar(10) not null,
	MaKhoaHoc varchar(10) not null,
	foreign key (MaNganh) references Nganh(MaNganh),
	foreign key (MaKhoaHoc) references KhoaHoc(MaKhoaHoc),

)
go

go
Create table KhoaHoc(
	MaKhoaHoc varchar(10) primary key,
	NamBatDau int, 
	NamKetThuc int
)
go
Create table Nganh(
	MaNganh varchar(10) primary key,
	TenNganh nvarchar(100),
	MaKhoa varchar(10) not null,
	foreign key (MaKhoa) references Khoa(MaKhoa)
)
go
Create table Lop(
	MaLop varchar(10) primary key,
	TenLop nvarchar(20),
	NamNhapHoc int,
	MaCT varchar(10) not null,
	MaKhoaHoc varchar(10) not null,
	MaNganh varchar(10) not null,
	MaKhoa varchar(10) not null,
	foreign key (MaCT) references ChuongTrinh (MaCT),
	foreign key (MaKhoaHoc) references KhoaHoc (MaKhoaHoc),
	foreign key (MaNganh) references Nganh (MaNganh),
	foreign key (MaKhoa) references Khoa (MaKhoa)
)
go

go
Create table SinhVien(
	MaSV varchar(10) primary key,
	HoTen nvarchar(100),
	NamSinh int,
	DanToc nvarchar(20),
	GioiTinh bit,
	DiaChi nvarchar(100),
	MaLop varchar(10) not null

	foreign key(MaLop) references Lop(MaLop)

)
go
Create table BangDiem(
	MaSV varchar(10) not null,
	MaMH varchar(10) not null,
	Diem float,
	LanThi int,
	primary key(MaSV, MaMH),
	foreign key (MaSV) references SinhVien(MaSV),
	foreign key (MaMH) references MonHoc (MaMH),
)
go
Create table GiangVien(
	MaGV varchar(10) primary key,
	HoTen nvarchar(100),
	GioiTinh bit,
	DiaChi nvarchar(100),
	MaKhoa varchar(10) not null,
	foreign key (MaKhoa) references Khoa (MaKhoa)
)
go
Create table GiangKhoa(
	NamHoc int,
	HocKy int,
	SoTietLyThuyet int,
	SoTietThucHanh int,
	SoTinChi int,
	MaKhoa varchar(10) not null,
	MaCT varchar(10) not null,
	MaMH varchar(10) not null,
	MaNganh varchar(10) not null,
	foreign key (MaKhoa) references Khoa(MaKhoa),
	foreign key (MaMH) references MonHoc(MaMH),
	foreign key (MaNganh) references Nganh(MaNganh),
	foreign key (MaCT) references ChuongTrinh (MaCT)
)
go
Create table ChuyenNganh(
	MaChuyenNganh varchar(10) primary key,
	TenChuyenNganh nvarchar(100),
	MaNganh varchar(10) not null,
	foreign key (MaNganh) references Nganh(MaNganh)
)

Create table ThoiKhoaBieu(
	MaGV varchar(10) not null,
	MaMH varchar (10) not null,
	MaSV varchar (10) not null,
	Tuan int,
	primary key (MaGV, MaMH, MaSV),
	foreign key (MaGV) references GiangVien(MaGV),
	foreign key (MaMH) references MonHoc (MaMH),
	foreign key (MaSV) references SinhVien (MaSV)
)
