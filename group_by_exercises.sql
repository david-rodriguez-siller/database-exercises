
-- 2: There have been seven titiles used
USE employees;
SELECT COUNT(DISTINCT title) FROM employees.titles;
-- 3: All unique last names of all employees that have a last name that starts and ends with e is: Erde, Eldridge, Etalle, Erie, Erbe
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE 'E%E'; 
SELECT last_name, COUNT(last_name) FROM employees WHERE last_name LIKE 'E%E' GROUP BY last_name; 
-- 4: There are 899 unique name combinations
SELECT first_name, last_name FROM employees WHERE last_name LIKE 'E%E';
-- 5: The unique last names with a 'q' but not 'qu' are: Chleq, Lindqvist, Qiwen
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
-- 6: There are 189 employees with the last name Chleq, 190 with the last name Lindqvist, and 168 with the last name Qiwen
SELECT last_name, COUNT(last_name) FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%' GROUP BY last_name;
-- 7: There are 441 male employees with those names and 268 female employees with those names
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
SELECT gender, first_name, COUNT(*) FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') GROUP BY first_name, gender;
-- 8: There are 285872 unique usernames. There are duplicates, the number of duplicates is 14152
SELECT COUNT(DISTINCT LOWER(CONCAT(SUBSTR(first_name, 1,1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3,2)))) AS user_name FROM employees;
SELECT COUNT(LOWER(CONCAT(SUBSTR(first_name, 1,1), SUBSTR(last_name, 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3,2)))) AS user_name FROM employees;
-- 9:
SELECT * FROM employees.salaries LIMIT 10;
-- 9a: The historic average salary for all employees is 63810.7448. The current average salary is 72012.2359
SELECT AVG(salary) FROM employees.salaries;
SELECT AVG(salary) FROM employees.salaries WHERE to_date LIKE '9999%';
-- 9b: 
SELECT emp_no, AVG(salary) FROM employees.salaries GROUP BY emp_no;
SELECT employees.first_name AS first_name, employees.last_name AS last_name, salaries.emp_no AS employee_number, AVG(salaries.salary) AS average_salary FROM employees JOIN employees.salaries ON salaries.emp_no = employees.emp_no GROUP BY salaries.emp_no; 
-- 9c:
SELECT emp_no, AVG(salary) FROM employees.salaries WHERE to_date LIKE '9999%' GROUP BY emp_no;
SELECT employees.first_name AS first_name, employees.last_name AS last_name, salaries.emp_no AS employee_number, AVG(salaries.salary) AS average_salary FROM employees JOIN employees.salaries ON salaries.emp_no = employees.emp_no WHERE to_date LIKE '999%' GROUP BY salaries.emp_no; 
-- 9d:
SELECT emp_no, MAX(salary) FROM employees.salaries WHERE to_date LIKE '9999%' GROUP BY emp_no;
SELECT employees.first_name AS first_name, employees.last_name AS last_name, salaries.emp_no AS employee_number, MAX(salaries.salary) AS average_salary FROM employees JOIN employees.salaries ON salaries.emp_no = employees.emp_no WHERE to_date LIKE '999%' GROUP BY salaries.emp_no; 
-- 9e:
SELECT emp_no, MAX(salary) FROM employees.salaries WHERE to_date LIKE '9999%' AND salary > 150000 GROUP BY emp_no;
SELECT employees.first_name AS first_name, employees.last_name AS last_name, salaries.emp_no AS employee_number, MAX(salaries.salary) AS average_salary FROM employees JOIN employees.salaries ON salaries.emp_no = employees.emp_no WHERE to_date LIKE '999%' AND salary > 150000 GROUP BY salaries.emp_no;
-- 9f: 
SELECT emp_no, AVG(salary) FROM employees.salaries WHERE to_date LIKE '9999%' AND salary BETWEEN 80000 AND 90000 GROUP BY emp_no;
SELECT employees.first_name AS first_name, employees.last_name AS last_name, salaries.emp_no AS employee_number, MAX(salaries.salary) AS average_salary FROM employees JOIN employees.salaries ON salaries.emp_no = employees.emp_no WHERE to_date LIKE '999%' AND salary BETWEEN 80000 AND 90000 GROUP BY salaries.emp_no;

