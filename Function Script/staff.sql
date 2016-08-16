CREATE OR REPLACE FUNCTION add_staff(char(5),VARCHAR,char(2),VARCHAR,VARCHAR,DATE,TEXT,VARCHAR,
VARCHAR,VARCHAR,VARCHAR,VARCHAR,VARCHAR) RETURNS VOID AS
$$
BEGIN
INSERT INTO 
tbl_staffs(staff_id,stf_name,gender,username,pwd,DOB,address,email,phone,usersrc,profilesrc,bgsrc,position)
VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13); 
END;
$$ LANGUAGE 'plpgsql' VOLATILE;


CREATE or REPLACE FUNCTION chage_staff_status(VARCHAR(5),INT)
RETURNS VOID AS
$$
BEGIN
  IF $2=0 THEN
     UPDATE tbl_staffs SET status=1 WHERE staff_id=$1;
  ELSE
     UPDATE tbl_staffs SET status=0 WHERE staff_id=$1;
  END IF;
END; 
$$ LANGUAGE 'plpgsql' VOLATILE;



----------------------------------------------------------------------------------------------------------------------
--View For Staff Info
-----------------------------------------------------------------------------------------------------------------------
CREATE VIEW v_staff_info
AS SELECT staff_id,profilesrc,stf_name,gender,email,phone,position,status from tbl_staffs;
-----------------------------------------------------------------------------------------------------------------
----View Get 1 Staff
-----------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW v_1staff_info AS
SELECT staff_id,stf_name,gender,dob,address,email,phone,profilesrc,position
FROM tbl_staffs;

CREATE OR REPLACE FUNCTION get_1staff_info(char(5))
RETURNS SETOF v_1staff_info AS
$$
 SELECT * FROM v_1staff_info WHERE staff_id=$1
$$ LANGUAGE 'sql' STABLE;

-------------------------------------------------------------------------------------------------------------------------------
----Get Active
-------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW v_active_staff
AS SELECT stf_name FROM tbl_staffs WHERE status=1;

CREATE OR REPLACE FUNCTION get_active_staff()
RETURNS SETOF v_active_staff AS
$$
  SELECT * from v_active_staff
$$ LANGUAGE 'sql' STABLE;


CREATE OR REPLACE FUNCTION get_max_staff_id()
RETURNS CHAR(5) AS
$$
BEGIN
RETURN (SELECT "max"(staff_id) FROM tbl_staffs);
END;
$$ LANGUAGE 'plpgsql' STABLE;

SELECT get_max_staff_id();





------------------------------------------------------------------------------------------------------------------------------
---Get Stafff Info
------------------------------------------------------------------------------------------------------------------------------
CREATE or REPLACE FUNCTION get_staff_info()
RETURNS SETOF v_staff_info AS
$$
 SELECT * FROM v_staff_info
$$ LANGUAGE 'sql' STABLE;



--------------------------------------------------------------------------------------------------------------------------
---Get Number of Row
--------------------------------------------------------------------------------------------------------------------------
CREATE or REPLACE FUNCTION number_of_row_stafftbl()
RETURNS INT AS
$$
BEGIN
RETURN(SELECT "count"(staff_id) FROM tbl_staffs);
END;
$$ LANGUAGE 'plpgsql' STABLE;




CREATE OR REPLACE FUNCTION update_staff(char(5),VARCHAR,char(2),DATE,TEXT,VARCHAR,
VARCHAR,VARCHAR,VARCHAR) RETURNS VOID AS
$$
BEGIN
	UPDATE tbl_staffs
	SET stf_name=$2,
		gender=$3,
		DOB=$4,
		address=$5,
		email=$6,
		phone=$7,
		profilesrc=$8,
		position=$9
	WHERE staff_id=$1;
END;
$$ LANGUAGE 'plpgsql' VOLATILE;

SELECT number_of_row_stafftbl();



