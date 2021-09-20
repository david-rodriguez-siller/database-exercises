-- 1:
USE employees;
-- 2:
SELECT DISTINCT last_name FROM employees ORDER BY last_name DESC LIMIT 10;
-- 3: The five employees are Alsel Cappello, Utz Mandell, Bouchung Schreiter, Boacai Kushner, and Petter Stroustrup
SELECT first_name, last_name, hire_date, birth_date FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25' ORDER BY hire_date LIMIT 5;
-- 4: The five employees on page 10 are Pranay Narwekar, Marjo Farrow, Ennio Karcich, Dines Lubachevsky, and Ipke fontan. The relationship between OFFSET and LIMIT is that LIMIT limits your query results by the specified number and OFFSET skips the numer or records specified after the command. The page number is determined by the sum of the offset and limit divided by the limit
SELECT first_name, last_name, hire_date, birth_date FROM employees WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25' ORDER BY hire_date LIMIT 5 OFFSET 45;
