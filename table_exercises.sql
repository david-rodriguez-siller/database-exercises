-- use the employees database
USE employees;
-- list all the tables in the database
SHOW TABLES;
-- explore the employees table. What different data types are present on this table?
SHOW CREATE TABLE employees;
-- int, date, varchar(14), varchar(16), and enum
-- which table(s) do you think contain a numeric column?
-- the salaries table
-- which table(s) do you think contain a string type column?
-- titles
-- which table (s) do you thing contains a date type column?
-- detp_emp_latest_date
-- what is the relationship between the employees and the department tables?
DESCRIBE employees;
DESCRIBE departments;
-- there's no relationship
-- show the sql that created teh dept_manager table
SHOW CREATE TABLE dept_manager;
