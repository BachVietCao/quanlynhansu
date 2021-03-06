USE [master]
GO
/****** Object:  Database [QLNhanSuVaTieLuong]    Script Date: 17/09/2021 10:44:52 CH ******/
CREATE DATABASE [QLNhanSuVaTieLuong]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNhanSuVaTieLuong', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLNhanSuVaTieLuong.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLNhanSuVaTieLuong_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLNhanSuVaTieLuong_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNhanSuVaTieLuong].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET  MULTI_USER 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLNhanSuVaTieLuong]
GO
/****** Object:  Table [dbo].[BangLuong]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangLuong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idnhanvien] [float] NULL,
	[gio] [nvarchar](50) NULL,
	[ngay] [nvarchar](50) NULL,
	[thang] [nvarchar](50) NULL,
	[nam] [nvarchar](50) NULL,
	[trangthai] [int] NULL,
	[noidung] [nvarchar](max) NULL,
	[ghichu] [nvarchar](max) NULL,
 CONSTRAINT [PK_BangLuong] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CauHinh]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CauHinh](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](max) NULL,
	[tacgia] [nvarchar](max) NULL,
	[gioithieu] [nvarchar](max) NULL,
	[huongdan] [nvarchar](max) NULL,
 CONSTRAINT [PK_CauHinh] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChamCong]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChamCong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idnhanvien] [float] NULL,
	[gio] [nvarchar](50) NULL,
	[ngay] [nvarchar](50) NULL,
	[thang] [nvarchar](50) NULL,
	[nam] [nvarchar](50) NULL,
	[trangthai] [int] NULL,
	[noidung] [nvarchar](max) NULL,
	[ghichu] [nvarchar](max) NULL,
	[dieukien] [nvarchar](max) NULL,
 CONSTRAINT [PK_ChamCong] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChucVu]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucVu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](max) NULL,
	[kiheu] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChucVu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HeSoLuong]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeSoLuong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](50) NULL,
	[giatri] [float] NULL,
 CONSTRAINT [PK_HeSoLuong] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoSoNhanVien]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoSoNhanVien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[kihieu] [nvarchar](50) NULL,
	[noidung] [nvarchar](max) NULL,
	[ngaytao] [nvarchar](50) NULL,
	[ngaycapnhat] [nvarchar](50) NULL,
	[hinhanh] [nvarchar](max) NULL,
 CONSTRAINT [PK_HoSo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[id] [float] NOT NULL,
	[ten] [nvarchar](50) NULL,
	[cmt] [nvarchar](50) NULL,
	[ngaysinh] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[hosonhanvien] [int] NULL,
	[trangthai] [int] NULL,
	[hinhanh] [nvarchar](max) NULL,
	[maphongban] [int] NULL,
	[machucvu] [int] NULL,
	[mahesoluong] [int] NULL,
	[matrocap] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](max) NULL,
	[kihieu] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](500) NULL,
	[giatri] [float] NULL,
 CONSTRAINT [PK_Quyen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](500) NULL,
	[matkau] [nvarchar](500) NULL,
	[maquyen] [int] NULL,
	[trangthai] [int] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinhLuong]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhLuong](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idnhanvien] [float] NULL,
	[ngaycong] [float] NULL,
	[tong] [float] NULL,
	[thang] [nvarchar](50) NULL,
	[nam] [nvarchar](50) NULL,
 CONSTRAINT [PK_TinhLuong] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TroCap]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TroCap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](50) NULL,
	[giatri] [float] NULL,
 CONSTRAINT [PK_TroCap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_1]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.BangLuong.id, dbo.BangLuong.idnhanvien, dbo.BangLuong.gio, dbo.BangLuong.ngay, dbo.BangLuong.thang, dbo.BangLuong.nam, dbo.BangLuong.trangthai, dbo.BangLuong.noidung, dbo.BangLuong.ghichu, 
                         dbo.NhanVien.ten, dbo.NhanVien.cmt, dbo.NhanVien.ngaysinh, dbo.NhanVien.phone, dbo.ChucVu.ten AS tenchucvu, dbo.PhongBan.ten AS tephongban, dbo.HeSoLuong.ten AS tenhesoluong
FROM            dbo.BangLuong INNER JOIN
                         dbo.ChucVu ON dbo.BangLuong.id = dbo.ChucVu.id INNER JOIN
                         dbo.NhanVien ON dbo.BangLuong.idnhanvien = dbo.NhanVien.id AND dbo.ChucVu.id = dbo.NhanVien.machucvu INNER JOIN
                         dbo.PhongBan ON dbo.NhanVien.maphongban = dbo.PhongBan.id INNER JOIN
                         dbo.HeSoLuong ON dbo.NhanVien.mahesoluong = dbo.HeSoLuong.id

GO
ALTER TABLE [dbo].[BangLuong]  WITH CHECK ADD  CONSTRAINT [FK_BangLuong_NhanVien] FOREIGN KEY([idnhanvien])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[BangLuong] CHECK CONSTRAINT [FK_BangLuong_NhanVien]
GO
ALTER TABLE [dbo].[ChamCong]  WITH CHECK ADD  CONSTRAINT [FK_ChamCong_NhanVien] FOREIGN KEY([idnhanvien])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[ChamCong] CHECK CONSTRAINT [FK_ChamCong_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_ChucVu] FOREIGN KEY([machucvu])
REFERENCES [dbo].[ChucVu] ([id])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_ChucVu]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_HeSoLuong] FOREIGN KEY([mahesoluong])
REFERENCES [dbo].[HeSoLuong] ([id])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_HeSoLuong]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_HoSoNhanVien] FOREIGN KEY([hosonhanvien])
REFERENCES [dbo].[HoSoNhanVien] ([id])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_HoSoNhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhongBan] FOREIGN KEY([maphongban])
REFERENCES [dbo].[PhongBan] ([id])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_PhongBan]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_TroCap] FOREIGN KEY([matrocap])
REFERENCES [dbo].[TroCap] ([id])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_TroCap]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoan_Quyen] FOREIGN KEY([maquyen])
REFERENCES [dbo].[Quyen] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoan_Quyen]
GO
ALTER TABLE [dbo].[TinhLuong]  WITH CHECK ADD  CONSTRAINT [FK_TinhLuong_NhanVien] FOREIGN KEY([idnhanvien])
REFERENCES [dbo].[NhanVien] ([id])
GO
ALTER TABLE [dbo].[TinhLuong] CHECK CONSTRAINT [FK_TinhLuong_NhanVien]
GO
/****** Object:  StoredProcedure [dbo].[bangluong_hien]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[bangluong_hien]
AS
SELECT 
	dbo.BangLuong.id, 
	dbo.BangLuong.idnhanvien, 
	dbo.BangLuong.gio,
	dbo.BangLuong.ngay,
	dbo.BangLuong.thang, 
	dbo.BangLuong.nam, 
	dbo.BangLuong.trangthai,
	dbo.BangLuong.noidung,
	dbo.BangLuong.ghichu, 
	dbo.NhanVien.ten, 
    dbo.NhanVien.cmt,
	dbo.NhanVien.ngaysinh,
	dbo.NhanVien.phone,
	dbo.PhongBan.ten AS tenphogban,
	dbo.ChucVu.ten AS tenphongban, 
	dbo.HeSoLuong.ten AS tenhesoluong
FROM
	dbo.BangLuong INNER JOIN
    dbo.NhanVien ON dbo.BangLuong.idnhanvien = dbo.NhanVien.id INNER JOIN
    dbo.PhongBan ON dbo.NhanVien.maphongban = dbo.PhongBan.id INNER JOIN
    dbo.ChucVu ON dbo.NhanVien.machucvu = dbo.ChucVu.id INNER JOIN
    dbo.HeSoLuong ON dbo.NhanVien.mahesoluong = dbo.HeSoLuong.id
ORDER BY dbo.BangLuong.id DESC
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[bangluong_timkiem]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[bangluong_timkiem]
	@ma NVARCHAR(500)
AS
SELECT 
	dbo.BangLuong.id, 
	dbo.BangLuong.idnhanvien, 
	dbo.BangLuong.gio, 
	dbo.BangLuong.ngay, 
	dbo.BangLuong.thang, 
	dbo.BangLuong.nam, 
	dbo.BangLuong.trangthai, 
	dbo.BangLuong.noidung, 
	dbo.BangLuong.ghichu, 
	dbo.NhanVien.ten, 
	dbo.NhanVien.cmt, 
	dbo.NhanVien.ngaysinh, 
	dbo.NhanVien.phone, 
	dbo.PhongBan.ten AS tenphogban, 
	dbo.ChucVu.ten AS tenphongban, 
	dbo.HeSoLuong.ten AS tenhesoluong
FROM 
	dbo.BangLuong INNER JOIN
    dbo.NhanVien ON dbo.BangLuong.idnhanvien = dbo.NhanVien.id INNER JOIN
    dbo.PhongBan ON dbo.NhanVien.maphongban = dbo.PhongBan.id INNER JOIN
    dbo.ChucVu ON dbo.NhanVien.machucvu = dbo.ChucVu.id INNER JOIN
    dbo.HeSoLuong ON dbo.NhanVien.mahesoluong = dbo.HeSoLuong.id 
WHERE 
	dbo.BangLuong.id LIKE '%' + @ma + '%' OR 
	dbo.BangLuong.idnhanvien LIKE '%' + @ma + '%' OR
	dbo.BangLuong.gio LIKE '%' + @ma + '%' OR
	dbo.BangLuong.ngay LIKE '%' + @ma + '%' OR
	dbo.BangLuong.thang LIKE '%' + @ma + '%' OR
	dbo.BangLuong.nam LIKE '%' + @ma + '%' OR
	dbo.BangLuong.trangthai LIKE '%' + @ma + '%' OR
	dbo.BangLuong.noidung LIKE '%' + @ma + '%' OR
	dbo.BangLuong.ghichu LIKE '%' + @ma + '%' OR 
	dbo.NhanVien.ten LIKE '%' + @ma + '%' OR
	dbo.NhanVien.cmt LIKE '%' + @ma + '%' OR
	dbo.NhanVien.ngaysinh LIKE '%' + @ma + '%' OR
	dbo.NhanVien.phone LIKE '%' + @ma + '%' OR
	dbo.PhongBan.ten LIKE '%' + @ma + '%' OR
	dbo.ChucVu.ten LIKE '%' + @ma + '%' OR
	dbo.HeSoLuong.ten LIKE '%' + @ma + '%'
ORDER BY dbo.BangLuong.id DESC
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[cauhinh_hien]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cauhinh_hien]
AS
	SELECT * FROM dbo.CauHinh
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[cauhinh_timkiem]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[cauhinh_timkiem]
	@ma NVARCHAR(500)
AS
	SELECT * FROM dbo.CauHinh WHERE id LIKE '%' + @ma + '%' OR ten LIKE '%' + @ma + '%' OR
	tacgia LIKE '%' + @ma + '%' OR gioithieu LIKE '%' + @ma + '%' OR huongdan LIKE '%' + @ma + '%'
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[chamcong_hien]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chamcong_hien]
AS
SELECT 
	dbo.ChamCong.id,
	dbo.ChamCong.idnhanvien,
	dbo.ChamCong.gio,
	dbo.ChamCong.ngay,
	dbo.ChamCong.thang,
	dbo.ChamCong.nam, dbo.ChamCong.trangthai,
	dbo.ChamCong.noidung,
	dbo.ChamCong.ghichu,
	dbo.ChamCong.dieukien, 
	dbo.NhanVien.ten,
	dbo.NhanVien.cmt,
	dbo.NhanVien.ngaysinh,
	dbo.NhanVien.phone,
	dbo.NhanVien.maphongban,
	dbo.NhanVien.machucvu,
	dbo.PhongBan.ten AS tenphongban,
	dbo.ChucVu.ten AS tenchucvu
FROM     
	dbo.ChamCong INNER JOIN
    dbo.NhanVien ON dbo.ChamCong.idnhanvien = dbo.NhanVien.id INNER JOIN
    dbo.PhongBan ON dbo.NhanVien.maphongban = dbo.PhongBan.id INNER JOIN
    dbo.ChucVu ON dbo.NhanVien.machucvu = dbo.ChucVu.id
ORDER BY dbo.ChamCong.id DESC
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[chamcong_timkiem]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chamcong_timkiem]
	@ma NVARCHAR(500)
AS
SELECT 
	dbo.ChamCong.id,
	dbo.ChamCong.idnhanvien,
	dbo.ChamCong.gio,
	dbo.ChamCong.ngay,
	dbo.ChamCong.thang,
	dbo.ChamCong.nam,
	dbo.ChamCong.trangthai,
	dbo.ChamCong.noidung,
	dbo.ChamCong.ghichu,
	dbo.ChamCong.dieukien, 
	dbo.NhanVien.ten,
	dbo.NhanVien.cmt,
	dbo.NhanVien.ngaysinh,
	dbo.NhanVien.phone,
	dbo.NhanVien.maphongban,
	dbo.NhanVien.machucvu,
	dbo.PhongBan.ten AS tenphongban,
	dbo.ChucVu.ten AS tenchucvu
FROM     
	dbo.ChamCong INNER JOIN
    dbo.NhanVien ON dbo.ChamCong.idnhanvien = dbo.NhanVien.id INNER JOIN
    dbo.PhongBan ON dbo.NhanVien.maphongban = dbo.PhongBan.id INNER JOIN
    dbo.ChucVu ON dbo.NhanVien.machucvu = dbo.ChucVu.id
WHERE 
	dbo.ChamCong.id LIKE '%' + @ma + '%' OR 
	dbo.ChamCong.idnhanvien LIKE '%' + @ma + '%' OR
	dbo.ChamCong.gio LIKE '%' + @ma + '%' OR
	dbo.ChamCong.ngay LIKE '%' + @ma + '%' OR
	dbo.ChamCong.thang LIKE '%' + @ma + '%' OR
	dbo.ChamCong.nam LIKE '%' + @ma + '%' OR
	dbo.ChamCong.trangthai LIKE '%' + @ma + '%' OR
	dbo.ChamCong.noidung LIKE '%' + @ma + '%' OR
	dbo.ChamCong.ghichu LIKE '%' + @ma + '%' OR
	dbo.ChamCong.dieukien LIKE '%' + @ma + '%' OR
	dbo.NhanVien.ten LIKE '%' + @ma + '%' OR
	dbo.NhanVien.cmt LIKE '%' + @ma + '%' OR
	dbo.NhanVien.ngaysinh LIKE '%' + @ma + '%' OR
	dbo.NhanVien.phone LIKE '%' + @ma + '%' OR
	dbo.PhongBan.ten LIKE '%' + @ma + '%' OR
	dbo.ChucVu.ten LIKE '%' + @ma + '%'
ORDER BY dbo.ChamCong.id DESC
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[chucvu_hien]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chucvu_hien]
AS
	SELECT * FROM ChucVu
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[chucvu_timkiem]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[chucvu_timkiem]
	@ma NVARCHAR(500)
AS
	SELECT * FROM ChucVu 
	WHERE id LIKE '%' + @ma + '%' OR 
	ten LIKE '%' + @ma + '%' OR 
	kiheu LIKE '%' + @ma + '%'
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[hesoluong_hien]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hesoluong_hien]
AS
	SELECT * FROM dbo.HeSoLuong
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[hesoluong_timkiem]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hesoluong_timkiem]
	@ma NVARCHAR(500)
AS
	SELECT * FROM dbo.HeSoLuong 
	WHERE id LIKE '%' + @ma + '%' OR 
	ten LIKE '%' + @ma + '%' OR 
	giatri LIKE '%' + @ma + '%'
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[hosonhanvien_hien]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hosonhanvien_hien]
AS
	SELECT * FROM dbo.HoSoNhanVien ORDER BY dbo.HoSoNhanVien.id DESC
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[hosonhanvien_timkiem]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[hosonhanvien_timkiem]
	@ma NVARCHAR(500)
AS
	SELECT * FROM dbo.HoSoNhanVien WHERE id LIKE '%' + @ma + '%' OR kihieu LIKE '%' + @ma + '%' OR
	noidung LIKE '%' + @ma + '%' OR ngaytao LIKE '%' + @ma + '%' OR ngaycapnhat LIKE '%' + @ma + '%'
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[nhanvien_hien]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[nhanvien_hien]
AS
SELECT 
	dbo.NhanVien.id, 
	dbo.NhanVien.ten, 
	dbo.NhanVien.cmt, 
	dbo.NhanVien.ngaysinh,
	dbo.NhanVien.phone,
	dbo.NhanVien.hosonhanvien,
	dbo.NhanVien.trangthai, 
	dbo.NhanVien.hinhanh, 
	dbo.NhanVien.maphongban,
	dbo.NhanVien.machucvu, 
    dbo.NhanVien.mahesoluong,
	dbo.NhanVien.matrocap, 
	dbo.HoSoNhanVien.kihieu,
	dbo.HoSoNhanVien.ngaycapnhat,
	dbo.ChucVu.ten AS tenchucvu, 
	dbo.PhongBan.ten AS tenphongban,
	dbo.HeSoLuong.ten AS tenhesoluong
FROM     
	dbo.ChucVu INNER JOIN
    dbo.NhanVien ON dbo.ChucVu.id = dbo.NhanVien.machucvu INNER JOIN
    dbo.HoSoNhanVien ON dbo.NhanVien.hosonhanvien = dbo.HoSoNhanVien.id INNER JOIN
    dbo.PhongBan ON dbo.NhanVien.maphongban = dbo.PhongBan.id INNER JOIN
    dbo.HeSoLuong ON dbo.NhanVien.mahesoluong = dbo.HeSoLuong.id
ORDER BY dbo.NhanVien.id DESC
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[nhanvien_timkiem]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[nhanvien_timkiem]
	@ma NVARCHAR(500)
AS
SELECT 
	dbo.NhanVien.id, 
	dbo.NhanVien.ten, 
	dbo.NhanVien.cmt, 
	dbo.NhanVien.ngaysinh,
	dbo.NhanVien.phone,
	dbo.NhanVien.hosonhanvien,
	dbo.NhanVien.trangthai, 
	dbo.NhanVien.hinhanh, 
	dbo.NhanVien.maphongban,
	dbo.NhanVien.machucvu, 
    dbo.NhanVien.mahesoluong,
	dbo.NhanVien.matrocap, 
	dbo.HoSoNhanVien.kihieu,
	dbo.HoSoNhanVien.ngaycapnhat,
	dbo.ChucVu.ten AS tenchucvu, 
	dbo.PhongBan.ten AS tenphongban,
	dbo.HeSoLuong.ten AS tenhesoluong
FROM     
	dbo.ChucVu INNER JOIN
    dbo.NhanVien ON dbo.ChucVu.id = dbo.NhanVien.machucvu INNER JOIN
    dbo.HoSoNhanVien ON dbo.NhanVien.hosonhanvien = dbo.HoSoNhanVien.id INNER JOIN
    dbo.PhongBan ON dbo.NhanVien.maphongban = dbo.PhongBan.id INNER JOIN
    dbo.HeSoLuong ON dbo.NhanVien.mahesoluong = dbo.HeSoLuong.id
WHERE 
	dbo.NhanVien.id LIKE '%' + @ma + '%' OR 
	dbo.NhanVien.ten LIKE '%' + @ma + '%' OR
	dbo.NhanVien.cmt LIKE '%' + @ma + '%' OR
	dbo.NhanVien.ngaysinh LIKE '%' + @ma + '%' OR
	dbo.NhanVien.phone LIKE '%' + @ma + '%' OR
	dbo.NhanVien.hosonhanvien LIKE '%' + @ma + '%' OR
	dbo.NhanVien.trangthai LIKE '%' + @ma + '%' OR
	dbo.NhanVien.hinhanh LIKE '%' + @ma + '%' OR
	dbo.NhanVien.maphongban LIKE '%' + @ma + '%' OR
	dbo.NhanVien.machucvu LIKE '%' + @ma + '%' OR
	dbo.NhanVien.mahesoluong LIKE '%' + @ma + '%' OR
	dbo.NhanVien.matrocap LIKE '%' + @ma + '%' OR
	dbo.HoSoNhanVien.kihieu LIKE '%' + @ma + '%' OR
	dbo.HoSoNhanVien.ngaycapnhat LIKE '%' + @ma + '%' OR
	dbo.ChucVu.ten LIKE '%' + @ma + '%' OR
	dbo.PhongBan.ten LIKE '%' + @ma + '%' OR
	dbo.HeSoLuong.ten LIKE '%' + @ma + '%'
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[phongban_hien]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[phongban_hien]
AS
	SELECT * FROM dbo.PhongBan
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[phongban_timkiem]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[phongban_timkiem]
	@ma NVARCHAR(500)
AS
	SELECT * FROM PhongBan
	WHERE id LIKE '%' + @ma + '%' OR 
	ten LIKE '%' + @ma + '%' OR 
	kihieu LIKE '%' + @ma + '%'
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[Quyen_hien]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Quyen_hien]

AS
	SELECT *
	from
	Quyen

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[Quyen_timkiem]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Quyen_timkiem]
	@ma nvarchar(500)
AS
	SELECT *
	from
	Quyen
	where
	id LIKE '%'+@ma+ '%' or
	ten LIKE '%'+@ma+ '%' or
	giatri LIKE '%'+@ma+ '%'

RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[taikhoan_hien]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[taikhoan_hien]
AS
SELECT 
	dbo.TaiKhoan.id, 
	dbo.TaiKhoan.ten, 
	dbo.TaiKhoan.matkau, 
	dbo.TaiKhoan.maquyen, 
	dbo.TaiKhoan.trangthai, 
	dbo.Quyen.ten AS tenquyen, 
	dbo.Quyen.giatri
FROM     
	dbo.TaiKhoan INNER JOIN
    dbo.Quyen ON dbo.TaiKhoan.maquyen = dbo.Quyen.id
ORDER BY dbo.TaiKhoan.id DESC
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[taikhoan_timkiem]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[taikhoan_timkiem]
	@ma NVARCHAR(500)
AS
SELECT 
	dbo.TaiKhoan.id, 
	dbo.TaiKhoan.ten, 
	dbo.TaiKhoan.matkau, 
	dbo.TaiKhoan.maquyen, 
	dbo.TaiKhoan.trangthai, 
	dbo.Quyen.ten AS tenquyen, 
	dbo.Quyen.giatri
FROM     
	dbo.TaiKhoan INNER JOIN
    dbo.Quyen ON dbo.TaiKhoan.maquyen = dbo.Quyen.id
WHERE 
	dbo.TaiKhoan.id LIKE '%' + @ma + '%' OR 
	dbo.TaiKhoan.ten LIKE '%' + @ma + '%' OR
	dbo.TaiKhoan.matkau LIKE '%' + @ma + '%' OR
	dbo.TaiKhoan.maquyen LIKE '%' + @ma + '%' OR
	dbo.TaiKhoan.trangthai LIKE '%' + @ma + '%' OR
	dbo.Quyen.ten LIKE '%' + @ma + '%' OR
	dbo.Quyen.giatri LIKE '%' + @ma + '%'
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[trocap_hien]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[trocap_hien]
AS
	SELECT * FROM TroCap
RETURN 0

GO
/****** Object:  StoredProcedure [dbo].[trocap_timkiem]    Script Date: 17/09/2021 10:44:52 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[trocap_timkiem]
	@ma NVARCHAR(500)
AS
	SELECT * FROM dbo.TroCap 
	WHERE 
	id LIKE '%' + @ma + '%' OR 
	ten LIKE '%' + @ma + '%' OR 
	giatri LIKE '%' + @ma + '%'
RETURN 0

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BangLuong"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 250
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChucVu"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "NhanVien"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 285
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PhongBan"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 119
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "HeSoLuong"
            Begin Extent = 
               Top = 141
               Left = 712
               Bottom = 254
               Right = 882
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [QLNhanSuVaTieLuong] SET  READ_WRITE 
GO
