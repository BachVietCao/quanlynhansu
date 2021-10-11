CREATE PROCEDURE hesoluong_timkiem
	@ma NVARCHAR(500)
AS
	SELECT * FROM dbo.HeSoLuong 
	WHERE id LIKE '%' + @ma + '%' OR 
	ten LIKE '%' + @ma + '%' OR 
	giatri LIKE '%' + @ma + '%'
RETURN 0
GO