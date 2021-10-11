CREATE PROCEDURE phongban_timkiem
	@ma NVARCHAR(500)
AS
	SELECT * FROM PhongBan
	WHERE id LIKE '%' + @ma + '%' OR 
	ten LIKE '%' + @ma + '%' OR 
	kihieu LIKE '%' + @ma + '%'
RETURN 0
GO

