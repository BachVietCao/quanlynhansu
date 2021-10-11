CREATE PROCEDURE nhanvien_hien
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