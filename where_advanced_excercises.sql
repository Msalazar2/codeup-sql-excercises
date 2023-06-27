USE employees;
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. What is the employee number of the top three results?
SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
# 10200, 10397, 10610
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. What is the employee number of the top three results? Does it match the previous question?
SELECT * FROM employees 
WHERE first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya';
# Same as previous
-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. What is the employee number of the top three results.
SELECT * FROM employees 
WHERE (first_name = 'Irena' or first_name = 'Vidya' or first_name = 'Maya')
AND gender = 'M';
-- Find all unique last names that start with 'E'.
SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE 'E%';
-- Find all unique last names that start or end with 'E'.
SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE('E%')
OR last_name LIKE ('%E');
-- Find all unique last names that end with E, but does not start with E?
SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE('%E')
AND last_name NOT LIKE ('E%');
-- Find all unique last names that start and end with 'E'.
SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE('E%')
AND last_name LIKE ('%E');
-- Find all current or previous employees hired in the 90s. Enter a comment with top three employee numbers.
SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-30';
# 10008, 10011, 10012 (other way '199%')
-- Find all current or previous employees born on Christmas. Enter a comment with top three employee numbers.
SELECT * FROM employees
WHERE birth_date LIKE '%12-25';
# 10078, 10115, 10261
-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with top three employee numbers.
SELECT * FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';
# 10261, 10438, 10681
-- Find all unique last names that have a 'q' in their last name.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%Q%';
-- Find all unique last names that have a 'q' in their last name but not 'qu'.
SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%Q%' 
AND last_name NOT LIKE '%qu%';