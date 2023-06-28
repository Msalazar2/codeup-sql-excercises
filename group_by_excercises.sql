
-- In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
SELECT DISTINCT title
FROM titles;
# 7
-- Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT last_name 
FROM employees
GROUP BY last_name
HAVING last_name LIKE 'e%e';
-- Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT first_name, last_name 
FROM employees
GROUP BY first_name, last_name
HAVING last_name LIKE 'e%e';
-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name 
FROM employees
GROUP BY last_name
HAVING last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'; 
# Qiwen,Lindqvist,Chleq
-- Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
SELECT COUNT(last_name) 
FROM employees
GROUP BY last_name
HAVING last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';
-- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT COUNT(*), first_name, gender 
FROM employees
GROUP BY first_name, gender
HAVING first_name IN ('Irena', 'Vidya', 'Maya');
-- Using your query that generates a username for all of the employees, generate a count employees for each unique username.
SELECT COUNT(*),
CONCAT(SUBSTR(LOWER(first_name), 1, 1),
SUBSTR(LOWER(last_name), 1, 4), "_", SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2))
AS username
FROM employees
GROUP BY username
HAVING COUNT(*) >1
ORDER BY COUNT(*) DESC;

-- From your previous query, are there any duplicate usernames? What is the higest number of times a username shows up? Bonus: How many duplicate usernames are there from your previous query?
# YES, 6, 13251