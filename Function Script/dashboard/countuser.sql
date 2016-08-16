--courseuser
CREATE OR REPLACE VIEW count_user AS
SELECT 
	(SELECT COUNT(*) from tbl_staffs)  + 
	(SELECT COUNT(*) from tbl_students) as total;
	
CREATE OR REPLACE FUNCTION count_userf()
RETURNS count_user AS
$$
	SELECT * FROM count_user;
$$
LANGUAGE 'sql' STABLE;