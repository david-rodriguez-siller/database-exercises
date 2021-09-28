-- 1: 
USE hopper_1562;
CREATE TEMPORARY TABLE hopper_1562.employees_with_departments(
first_name VARCHAR(50), last_name VARCHAR(50), dept_name VARCHAR(50)); 
DESCRIBE hopper_1562.employees_with_departments;
SELECT * FROM hopper_1562.employees_with_departments;
-- solution:
use employees;
CREATE TEMPORARY TABLE hopper_1562.employees_with_departments_solved AS (
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE to_date > CURDATE()
);

USE hopper_1562;
SELECT *
FROM employees_with_departments_solved;
DESCRIBE employees_with_departments_solved;

ALTER TABLE employees_with_departments_solved ADD full_name VARCHAR(31);

UPDATE employees_with_departments_solved
SET full_name = CONCAT(first_name, ' ', last_name);
 
 ALTER TABLE employees_with_departments_solved DROP COLUMN first_name;
 ALTER TABLE employees_with_departments_solved DROP COLUMN last_name;
----------------------------------------------------------------------------------
-- 1a/1b: 
ALTER TABLE employees_with_departments ADD full_name VARCHAR(100);
DESCRIBE employees_with_departments;
-- 1c: 
ALTER TABLE employees_with_departments DROP COLUMN first_name;
DESCRIBE employees_with_departments;
ALTER TABLE employees_with_departments DROP COLUMN last_name;
DESCRIBE employees_with_departments;
-- 1d: Another way we could have ended up with this table would have been by creating the table with only the department name and full name columns.
-- 2: 
CREATE TEMPORARY TABLE hopper_1562.payment(
payment_id SMALLINT, customer_id SMALLINT, staff_id TINYINT, rental_id INT, amount INT, payment_date DATETIME, last_update TIMESTAMP);
-- Solution:
USE sakila;

CREATE TEMPORARY TABLE hopper_1562.payments AS (
SELECT *
FROM payment);
 
 SELECT *
 FROM hopper_1562.payments;
 DESCRIBE hopper_1562.payments; 
 ALTER TABLE hopper_1562.payments ADD COLUMN cents INT UNSIGNED;
 
UPDATE hopper_1562.payments
SET cents = hopper_1562.payments.amount * 100;
 
 SELECT *
 FROM hopper_1562.payments;  
--------------------------------------------------------------------------------------------------------

-- 3:
USE employees;
-- Find current average pay in each department:
-- current average
SELECT dept_emp.dept_no AS 'Department Number', departments.dept_name AS 'Department Name', AVG(salaries.salary) AS 'Average Salary'
FROM salaries
JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no 
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE salaries.to_date > CURDATE()
GROUP BY dept_emp.dept_no;
-- historical average
SELECT dept_emp.dept_no AS 'Department Number', departments.dept_name AS 'Department Name', AVG(salaries.salary) AS 'Average Salary'
FROM salaries
JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no 
JOIN departments ON dept_emp.dept_no = departments.dept_no
GROUP BY dept_emp.dept_no;

-- SOLUTION:
-- step 1: find historic average pay
-- average historic salary is 63811
USE employees;
SELECT ROUND(AVG(salary))
FROM salaries;
-- step 2: find historic standard deviation of salaries
-- historic standard deviation of salaries is 16905
SELECT ROUND(STDDEV(salary)) 
FROM salaries;
-- step 3: find current average pay in each department
SELECT dept_name, ROUND(AVG(salary)) AS current_dept_avg_salary
FROM departments
JOIN dept_emp USING(dept_no)
JOIN salaries USING(emp_no)
WHERE salaries.to_date > CURDATE()
GROUP BY dept_name;

CREATE TEMPORARY TABLE hopper_1562.salaries_by_dept AS (
SELECT dept_name, ROUND(AVG(salary)) AS current_dept_avg_salary
FROM departments
JOIN dept_emp USING(dept_no)
JOIN salaries USING(emp_no)
WHERE salaries.to_date > CURDATE()
GROUP BY dept_name);

SELECT *
FROM hopper_1562.salaries_by_dept;

USE hopper_1562;

-- add historic avg(salary) column
-- add historic std(salary) column
-- add zscore column

ALTER TABLE salaries_by_dept ADD COLUMN company_avg_salary FLOAT(10, 2);
ALTER TABLE salaries_by_dept ADD COLUMN company_std_salary FLOAT(10, 2);
ALTER TABLE salaries_by_dept ADD COLUMN zscore FLOAT(10, 2);

SELECT *
FROM hopper_1562.salaries_by_dept;

UPDATE salaries_by_dept
SET company_avg_salary = (SELECT AVG(salary) FROM employees.salaries);

UPDATE salaries_by_dept
SET company_std_salary = (SELECT STDDEV(salary) FROM employees.salaries);

SELECT *
FROM hopper_1562.salaries_by_dept;

UPDATE salaries_by_dept
SET zscore = (current_dept_avg_salary - company_avg_salary) / company_std_salary;

SELECT *
FROM hopper_1562.salaries_by_dept
ORDER BY zscore DESC;