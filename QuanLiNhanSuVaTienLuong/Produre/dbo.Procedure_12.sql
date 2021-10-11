CREATE PROCEDURE chamcong_timkiem
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