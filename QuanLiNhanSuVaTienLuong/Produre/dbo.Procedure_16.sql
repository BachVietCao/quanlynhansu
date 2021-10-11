CREATE PROCEDURE nhanvien_timkiem
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