-- 1
USE employees;
-- 2: 709 employees have first names Irena, Vidya or Maya
SELECT COUNT(first_name) FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- 3: 709 employees have first names Irena, Vidya, or Maya
SELECT COUNT(first_name) FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
-- 4: 441 employees have first names Irena, Vidya, or Maya and are male
SELECT COUNT(first_name) FROM employees WHERE gender = 'M' AND (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya');
-- 5: 7330 employees have a last name that starts with the letter E
SELECT COUNT(last_name) FROM employees WHERE last_name LIKE 'E%'; 
-- 6: 30273 employees have a last name that starts or ends with an E. 23393 employess have a last name that ends with an E but does not start with E
SELECT COUNT(last_name) FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';
SELECT COUNT(last_name) FROM employees WHERE last_name NOT LIKE 'E%' AND last_name LIKE '%E';
-- 7: 899 employees have a last name that starts and ends with an E. 24292 employees have last names that end with an E
SELECT COUNT(last_name) FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E';
SELECT COUNT(last_name) FROM employees WHERE last_name LIKE '%E';
-- 8: 135214 employees were hired in the 90s
SELECT COUNT(first_name) FROM employees WHERE hire_date LIKE '199%';
-- 9: 842 employees were born on 12/25
SELECT COUNT(first_name) FROM employees WHERE birth_date LIKE '%12-25';
-- 10: 362 employees were hired in the 90s and born on 12/25
SELECT COUNT(first_name) FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';
-- 11: 1873 employees have the letter Q in their last name
SELECT COUNT(last_name) FROM employees WHERE last_name LIKE '%Q%';
-- 12: 547 employees have the letter Q but not the letters QU next to each other in their last name
SELECT COUNT(last_name) FROM employees WHERE last_name LIKE '%Q%' AND last_name NOT LIKE '%QU%';


