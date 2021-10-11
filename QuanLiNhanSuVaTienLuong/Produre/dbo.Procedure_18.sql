CREATE PROCEDURE taikhoan_timkiem
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