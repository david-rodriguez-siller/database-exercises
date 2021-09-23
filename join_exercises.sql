-- Join Example Databse
-- 1:
USE join_example_db;
SELECT * 
FROM users;
SELECT * 
FROM roles;
-- 2:
-- JOIN:
SELECT * 
FROM users 
JOIN roles ON users.role_id = roles.id;
-- LEFT JOIN:
SELECT * 
FROM users 
LEFT JOIN roles ON users.role_id = roles.id;
-- RIGHT JOIN:
SELECT * 
FROM users 
RIGHT JOIN roles ON users.role_id = roles.id;
-- 3:
SELECT roles.name AS role_name, COUNT(users.name) AS role_count 
FROM users 
RIGHT JOIN roles ON users.role_id = roles.id 
GROUP BY roles.name;

-- Employees database
-- 1: 
USE employees;
-- 2:
SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Manager Name', employees.emp_no AS 'Employee ID' 
FROM departments 
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date LIKE '9%';
-- 3: 
SELECT departments.dept_name AS 'Department Name', CONCAT (employees.first_name, ' ', employees.last_name) AS 'Manager Name', employees.emp_no AS 'Employee ID' 
FROM departments 
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
JOIN employees ON employees.emp_no = dept_manager.emp_no 
WHERE employees.gender = 'F' AND dept_manager.to_date LIKE '9%';
-- 4:
SELECT titles.title AS 'Title Name', COUNT(employees.first_name) AS 'Employee Count' 
FROM employees 
JOIN titles ON employees.emp_no = titles.emp_no 
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no 
WHERE dept_emp.to_date LIKE '9%' AND dept_emp.dept_no = 'd009' AND titles.to_date LIKE '9%' 
GROUP BY titles.title;
-- 5: 
SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Manager Name', employees.emp_no AS 'Employee ID', salaries.salary AS 'Salary'
FROM departments 
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
JOIN employees ON employees.emp_no = dept_manager.emp_no
JOIN employees.salaries ON salaries.emp_no = employees.emp_no
WHERE dept_manager.to_date LIKE '9%' AND salaries.to_date LIKE '9%';
-- 6:
SELECT dept_emp.dept_no AS 'Department Number', departments.dept_name AS 'Department Name', COUNT(dept_emp.dept_no) AS 'Employee Count'
FROM dept_emp
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date LIKE '9%'
GROUP BY dept_emp.dept_no;
-- 7:
SELECT departments.dept_name AS 'Department Name', AVG(salaries.salary) AS 'Average Salary'
FROM departments
JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
JOIN employees.salaries ON dept_emp.emp_no = salaries.emp_no
WHERE salaries.to_date LIKE '9%'
GROUP BY departments.dept_name
ORDER BY AVG(salaries.salary) DESC
LIMIT 1;
-- 8:
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Employee Name', salaries.salary AS 'Salary', employees.emp_no AS 'Employee ID'
FROM employees
JOIN employees.salaries ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
WHERE dept_emp.dept_no = 'd001' AND salaries.to_date LIKE '9%'
ORDER BY salaries.salary DESC
LIMIT 1;
-- 9:
SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Manager Name', employees.emp_no AS 'Employee ID', salaries.salary AS 'Salary'
FROM departments 
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
JOIN employees ON employees.emp_no = dept_manager.emp_no
JOIN employees.salaries ON employees.emp_no = salaries.emp_no
WHERE dept_manager.to_date LIKE '9%' AND salaries.to_date LIKE '9%'
ORDER BY salaries.salary DESC
LIMIT 1;
-- 10:
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Employee Name', departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Manager Name'
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no 
WHERE dept_emp.to_date LIKE '9%' AND dept_manager.to_date LIKE '9%';
-- 11: 
-- d001 - Marketing
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Employee Name', salaries.salary AS 'Salary', employees.emp_no AS 'Employee ID',  departments.dept_name AS 'Department Name'
FROM employees
JOIN employees.salaries ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd001' AND salaries.to_date LIKE '9%'
ORDER BY salaries.salary DESC
LIMIT 1;
-- d002 - Finance
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Employee Name', salaries.salary AS 'Salary', employees.emp_no AS 'Employee ID',  departments.dept_name AS 'Department Name'
FROM employees
JOIN employees.salaries ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd002' AND salaries.to_date LIKE '9%'
ORDER BY salaries.salary DESC
LIMIT 1;
-- d003 - Human Resources
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Employee Name', salaries.salary AS 'Salary', employees.emp_no AS 'Employee ID',  departments.dept_name AS 'Department Name'
FROM employees
JOIN employees.salaries ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd003' AND salaries.to_date LIKE '9%'
ORDER BY salaries.salary DESC
LIMIT 1;
-- d004 - Production
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Employee Name', salaries.salary AS 'Salary', employees.emp_no AS 'Employee ID',  departments.dept_name AS 'Department Name'
FROM employees
JOIN employees.salaries ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd004' AND salaries.to_date LIKE '9%'
ORDER BY salaries.salary DESC
LIMIT 1;
-- d005 - Development
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Employee Name', salaries.salary AS 'Salary', employees.emp_no AS 'Employee ID',  departments.dept_name AS 'Department Name'
FROM employees
JOIN employees.salaries ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd005' AND salaries.to_date LIKE '9%'
ORDER BY salaries.salary DESC
LIMIT 1;
-- d006 - Quality Management
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Employee Name', salaries.salary AS 'Salary', employees.emp_no AS 'Employee ID',  departments.dept_name AS 'Department Name'
FROM employees
JOIN employees.salaries ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd006' AND salaries.to_date LIKE '9%'
ORDER BY salaries.salary DESC
LIMIT 1;
-- d007 - Sales
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Employee Name', salaries.salary AS 'Salary', employees.emp_no AS 'Employee ID',  departments.dept_name AS 'Department Name'
FROM employees
JOIN employees.salaries ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd007' AND salaries.to_date LIKE '9%'
ORDER BY salaries.salary DESC
LIMIT 1;
-- d008 - Research
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Employee Name', salaries.salary AS 'Salary', employees.emp_no AS 'Employee ID',  departments.dept_name AS 'Department Name'
FROM employees
JOIN employees.salaries ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd008' AND salaries.to_date LIKE '9%'
ORDER BY salaries.salary DESC
LIMIT 1;
-- d009 - Customer Service
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS 'Employee Name', salaries.salary AS 'Salary', employees.emp_no AS 'Employee ID',  departments.dept_name AS 'Department Name'
FROM employees
JOIN employees.salaries ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd009' AND salaries.to_date LIKE '9%'
ORDER BY salaries.salary DESC
LIMIT 1;



