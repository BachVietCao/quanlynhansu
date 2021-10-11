CREATE PROCEDURE hosonhanvien_hien
AS
	SELECT * FROM dbo.HoSoNhanVien ORDER BY dbo.HoSoNhanVien.id DESC
RETURN 0
GO
