CREATE PROCEDURE chamcong_hien
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