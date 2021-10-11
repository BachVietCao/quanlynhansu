CREATE PROCEDURE hosonhanvien_timkiem
	@ma NVARCHAR(500)
AS
	SELECT * FROM dbo.HoSoNhanVien WHERE id LIKE '%' + @ma + '%' OR kihieu LIKE '%' + @ma + '%' OR
	noidung LIKE '%' + @ma + '%' OR ngaytao LIKE '%' + @ma + '%' OR ngaycapnhat LIKE '%' + @ma + '%'
RETURN 0
GO