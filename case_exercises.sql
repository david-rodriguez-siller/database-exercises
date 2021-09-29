-- 1:
USE employees;
SELECT *, 
IF(to_date LIKE '9%', 1, 0) AS is_current_employee
FROM dept_emp;

-- 2:
USE employees;
SELECT CONCAT(first_name, ' ', last_name) AS full_name, 
IF(REGEXP_LIKE(LEFT(last_name, 1), '[a-h]') = 1, 'A-H', IF(REGEXP_LIKE(LEFT(last_name, 1), '[i-q]') = 1, 'I-Q', 'R-Z')) AS alpha_group
FROM employees;

-- 3:
USE employees;
SELECT COUNT(IF(birth_date LIKE '194%', 1, NULL)) AS '1940s Births', 
COUNT(IF(birth_date LIKE '195%', 1, NULL)) AS '1950s Births', 
COUNT(IF(birth_date LIKE '196%', 1, NULL)) AS '1960s Births', 
COUNT(IF(birth_date LIKE '197%', 1, NULL)) AS '1970s Births'
FROM employees;

-- Bonus
-- Create a combined departments table
CREATE TEMPORARY TABLE hopper_1562.grouped_departments AS 
SELECT dept_no, dept_name,
CASE 
WHEN dept_name IN ('research', 'development') THEN 'R&D'
WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing' 
WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
ELSE dept_name
END AS dept_group
FROM departments;

SELECT * FROM hopper_1562.grouped_departments;

-- Find current average salary
SELECT grouped_departments.dept_group, ROUND(AVG(salaries.salary), 2) AS avg_salary
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN hopper_1562.grouped_departments USING(dept_no)
WHERE salaries.to_date LIKE '9%'
GROUP BY grouped_departments.dept_group
ORDER BY grouped_departments.dept_group;