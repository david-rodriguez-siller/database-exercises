-- 1:
USE employees;
-- 2: The first row's name is Irena Reutenauer and the last row's name is Vidya Simmen
SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;
-- 3: The first row's name is Irena Acton and the last row's name is Vidya Zweizig
SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name;
-- 4: The first row's name is Irena Acton and the last row's name is Maya Zyda
SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY last_name, first_name;
-- 5: There are 899 employees with last names that end and start with the letter E. The first row is employee number 10021 - Ramzi Erde and the last row is employee number 499648 - Tadahiro Erde
SELECT emp_no, first_name, last_name FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E' ORDER BY emp_no;
SELECT COUNT(last_name) FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E';
-- 6: There are 899 employees with last names that end and start with the letter E. The newest hire in this query is Teiji Eldridge and the oldest is Sergi Erde
SELECT emp_no, first_name, last_name, hire_date FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E' ORDER BY hire_date DESC;
SELECT COUNT(last_name) FROM employees WHERE last_name LIKE 'E%' AND last_name LIKE '%E';
-- 7: There are 362 employees hired in the 1990s and born on 12/25. The oldest hire in this query is Alselm Cappello and the newest hire is Khun Bernini
SELECT emp_no, first_name, last_name, birth_date, hire_date FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25' ORDER BY hire_date ASC;
SELECT COUNT(first_name) FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

