CREATE PROCEDURE trocap_timkiem
	@ma NVARCHAR(500)
AS
	SELECT * FROM dbo.TroCap 
	WHERE 
	id LIKE '%' + @ma + '%' OR 
	ten LIKE '%' + @ma + '%' OR 
	giatri LIKE '%' + @ma + '%'
RETURN 0
GO
