CREATE PROCEDURE hosonhanvien_by_id
@ma integer
AS
	SELECT 
	*
	from HoSoNhanVien
	where
	id=@ma
RETURN 0
