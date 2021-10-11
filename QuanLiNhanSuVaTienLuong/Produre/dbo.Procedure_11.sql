CREATE PROCEDURE bangluong_hien
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
