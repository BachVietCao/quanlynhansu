CREATE PROCEDURE taikhoan_hien
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