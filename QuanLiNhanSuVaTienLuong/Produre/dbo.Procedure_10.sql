CREATE PROCEDURE bangluong_timkiem
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
