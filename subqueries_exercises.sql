USE employees;
-- 1:
-- Find employee 101010 hire date:
SELECT hire_date 
FROM employees 
WHERE emp_no = 101010; -- hire date is 1990-10-22
-- Assemble subquery:
SELECT * 
FROM employees 
WHERE hire_date = (SELECT hire_date 
FROM employees 
WHERE emp_no = 101010); -- 69 employees have the 1990-10-22 hire date
-- 2: 
-- Find employees with the first name Aamod:
SELECT emp_no, first_name, last_name 
FROM employees 
WHERE first_name = 'Aamod';
-- Assemble subquery:
SELECT emp_no, title 
FROM titles 
WHERE emp_no IN (SELECT emp_no 
FROM employees 
WHERE first_name = 'Aamod') AND to_date > CURDATE();
-- 3:
-- Find employee number of employees currently with a salary at the company:
SELECT emp_no 
FROM employees.salaries 
WHERE to_date LIKE '9%';
 -- Assemble subquery:
SELECT COUNT(emp_no) AS 'Former Employee Count'
FROM employees 
WHERE emp_no NOT IN (SELECT emp_no 
FROM employees.salaries 
WHERE to_date LIKE '9%'); -- There are 59900 former employees
-- 4: 
-- Find current department manager employee number:
SELECT emp_no 
FROM dept_manager 
WHERE to_date > CURDATE();
-- Assemble subquery:
SELECT emp_no, first_name, last_name, gender
FROM employees
WHERE gender = 'F' AND emp_no IN (SELECT emp_no 
FROM dept_manager 
WHERE to_date > CURDATE());
-- 5: 
-- Find historical average salary:
SELECT AVG(salaries.salary) 
FROM employees.salaries;
-- Assemble subquery:
SELECT emp_no, salary 
FROM employees.salaries 
WHERE to_date > CURDATE() AND salary > (SELECT AVG(salary)
FROM employees.salaries); --  There are 154543 employees with a current salary higher than 63810.7448
 -- 6:
 -- Find the current highest salary:
SELECT MAX(salary) 
FROM salaries
WHERE to_date > CURDATE(); -- The maximum current salary is 158220
 -- Find St Dev
SELECT STD(salary) 
FROM salaries 
WHERE to_date > CURDATE(); -- The standard deviation is 17309.9593
 -- Assemble subquery:   
SELECT COUNT(salary) 
FROM salaries
WHERE to_date > CURDATE() AND salary >= 140910.0407; -- There are 83 salaries within one standard deviation of the max salary
 -- Need to figure out how to implement the subtraction of the max salary and the standard deviation into sql statement 
SELECT COUNT(salary) 
FROM salaries
WHERE to_date > CURDATE() AND salary > ((SELECT MAX(salary) 
FROM salaries 
WHERE to_date > CURDATE()) - (SELECT STD(salary) 
FROM salaries 
WHERE to_date > CURDATE())); 
-- Find the percentage of all salaries:
SELECT ((SELECT COUNT(salary) 
FROM salaries
WHERE to_date > CURDATE() AND salary > ((SELECT MAX(salary) 
FROM salaries 
WHERE to_date > CURDATE()) - (SELECT STD(salary) 
FROM salaries 
WHERE to_date > CURDATE())))
/COUNT(salary))*100 AS 'Percentage of All Salaries'
FROM salaries
WHERE to_date > CURDATE();
-- BONUS 1
-- Find current female employes:
SELECT emp_no 
FROM employees
WHERE gender = 'F';
-- Find department number that have female employees 
SELECT dept_no
FROM dept_manager
WHERE to_date > CURDATE() AND emp_no IN (SELECT emp_no
FROM employees
WHERE gender = 'F');
-- Assemble subquery:
SELECT dept_name
FROM departments
WHERE dept_no IN (SELECT dept_no
FROM dept_manager
WHERE to_date > CURDATE() AND emp_no IN (SELECT emp_no
FROM employees
WHERE gender = 'F'));
-- Bonus 2
-- Find employee number of employee with highest salary
SELECT emp_no
FROM salaries
WHERE to_date > CURDATE() AND salary = (SELECT MAX(salary) 
FROM salaries
WHERE to_date > CURDATE()
);
-- Find first and last name of employee number 43624
SELECT first_name, last_name, emp_no
FROM employees
WHERE emp_no = (SELECT emp_no
FROM salaries
WHERE to_date > CURDATE() AND salary = (SELECT MAX(salary) 
FROM salaries
WHERE to_date > CURDATE()
));
-- BONUS 3
-- Find the department number of employee with highest salary
SELECT dept_no
FROM dept_emp
WHERE to_date > CURDATE() AND emp_no = (SELECT emp_no
FROM salaries
WHERE to_date > CURDATE() AND salary = (SELECT MAX(salary) 
FROM salaries
WHERE to_date > CURDATE()
));
-- Find the department name of the department number d007:
SELECT dept_name
FROM departments
WHERE dept_no = (SELECT dept_no
FROM dept_emp
WHERE to_date > CURDATE() AND emp_no = (SELECT emp_no
FROM salaries
WHERE to_date > CURDATE() AND salary = (SELECT MAX(salary) 
FROM salaries
WHERE to_date > CURDATE()
)));