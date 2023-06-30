-- Find all the current employees with the same hire date as employee 101010 using a subquery.
USE employees;

SELECT *
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
WHERE to_date > CURDATE()
AND employees.emp_no = (
	SELECT emp_no
	FROM employees 
	WHERE emp_no = '101010'
    );

-- Find all the titles ever held by all current employees with the first name Aamod.
SELECT *
FROM employees
WHERE first_name LIKE 'Aamod';

SELECT titles.title, CONCAT(a.first_name, ' ', a.last_name) AS current_emp, titles.to_date
FROM (
	SELECT *
	FROM employees
	WHERE first_name LIKE 'Aamod'
    ) AS a
INNER JOIN titles ON a.emp_no = titles.emp_no
WHERE to_date > CURDATE();

-- How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT COUNT(*)
FROM employees
WHERE emp_no NOT IN (
	SELECT emp_no
	FROM dept_emp
	WHERE to_date > CURDATE()
    );
#59900

-- Find all the current department managers that are female. List their names in a comment in your code.
SELECT first_name, gender
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE to_date > CURDATE()
    )
AND gender = 'F';

-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT AVG(salary) 
FROM salaries
WHERE to_date > CURDATE();

SELECT emp_no, salary
FROM salaries
WHERE salary > (SELECT AVG(salary) FROM salaries);

-- How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
SELECT emp_no, STDDEV(salary)
FROM salaries
WHERE salary > (SELECT AVG(salary) FROM salaries);

-- Hint You will likely use multiple subqueries in a variety of ways
-- Hint It's a good practice to write out all of the small queries that you can. Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it) in other, larger queries