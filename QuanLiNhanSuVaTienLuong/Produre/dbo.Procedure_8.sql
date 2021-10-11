CREATE PROCEDURE cauhinh_timkiem
	@ma NVARCHAR(500)
AS
	SELECT * FROM dbo.CauHinh WHERE id LIKE '%' + @ma + '%' OR ten LIKE '%' + @ma + '%' OR
	tacgia LIKE '%' + @ma + '%' OR gioithieu LIKE '%' + @ma + '%' OR huongdan LIKE '%' + @ma + '%'
RETURN 0
GO
