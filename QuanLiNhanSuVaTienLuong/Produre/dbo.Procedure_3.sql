CREATE PROCEDURE chucvu_timkiem
	@ma NVARCHAR(500)
AS
	SELECT * FROM ChucVu 
	WHERE id LIKE '%' + @ma + '%' OR 
	ten LIKE '%' + @ma + '%' OR 
	kiheu LIKE '%' + @ma + '%'
RETURN 0
GO
