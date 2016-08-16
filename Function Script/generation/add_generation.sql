CREATE OR REPLACE FUNCTION add_generation(VARCHAR,DATE,DATE,Text)
RETURNS VOID AS
$$
INSERT INTO tbl_generation(generation,orientation_date,finish_date,discription)
VALUES($1,$2,$3,$4)
$$
LANGUAGE 'sql' VOLATILE;