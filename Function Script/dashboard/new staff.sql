--newstaff
CREATE OR REPLACE VIEW select_newstaff AS
SELECT st.stf_name,
    st.profilesrc
   FROM tbl_staffs st ORDER BY st.register_date DESC
 LIMIT 6;

CREATE OR REPLACE FUNCTION new_user() 
RETURNS SETOF select_newstaff AS
$$ 
 select * from select_newstaff
$$
LANGUAGE 'sql' STABLE