-- Employees Database:
-- 1:
USE employees;
-- How much do the current managers of each department get paid, relative to the average salary for the department?
SELECT dept_manager.emp_no, CONCAT(employees.first_name, ' ', employees.last_name) AS full_name, departments.dept_name, departments.dept_no, salaries.salary 
FROM dept_manager
JOIN salaries USING(emp_no)
JOIN employees USING(emp_no) 
JOIN departments USING(dept_no)
WHERE dept_manager.to_date LIKE '9%' AND salaries.to_date LIKE '9%';

SELECT dept_emp.dept_no, departments.dept_name, ROUND(AVG(salaries.salary),2) AS avg_salary
FROM salaries
JOIN employees USING(emp_no)
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE salaries.to_date LIKE '9%'
GROUP BY dept_no
ORDER BY dept_no;
-- Is there any department where the department manager gets paid less than the average salary? Yes, production and customer service managers get paid less than the average salary for the departments

-- World Database:
USE world;
-- What languages are spoken in Santa Monica?
SELECT city.name, countrylanguage.language, countrylanguage.percentage
FROM city
JOIN countrylanguage USING(countrycode)
WHERE name LIKE 'Santa Monica'
ORDER BY percentage DESC;
-- How many different countries are in each region?
SELECT region, COUNT(name) AS num_countries
FROM country
GROUP BY region
ORDER BY num_countries;