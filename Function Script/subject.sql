--view
CREATE OR REPLACE VIEW v_1subject_info
AS 
SELECT subject_id,subject_name,creat_date,description,score_percent FROM tbl_subjects;
--funciton
CREATE OR REPLACE FUNCTION get_1subject_info(VARCHAR)
RETURNS v_1subject_info as 
$$
  SELECT * FROM v_1subject_info WHERE subject_id=$1
$$ LANGUAGE 'sql' STABLE;




CREATE OR REPLACE FUNCTION get_max_subject_id()
RETURNS CHAR(5) AS
$$
BEGIN
  RETURN(SELECT "max"(subject_id) FROM tbl_subjects);
END;
$$ LANGUAGE 'plpgsql' STABLE;

SELECT get_max_subject_id();





CREATE or REPLACE FUNCTION get_num_of_row_subject_table()
RETURNS Int AS
$$
BEGIN
 RETURN(SELECT "count"(subject_id) FROM tbl_subjects);
END;
$$ LANGUAGE 'plpgsql' STABLE;