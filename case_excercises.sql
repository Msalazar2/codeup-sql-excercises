 -- Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.
USE employees;

SELECT *, (SELECT CONCAT(first_name, ' ', last_name) FROM employees WHERE employees.emp_no = dept_emp.emp_no) AS emp_name, 
IF (to_date > CURDATE(), TRUE, FALSE) AS currently_emp
FROM dept_emp;


-- Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT *,
CASE
WHEN left(last_name, 1) <= 'H' THEN 'A-H'
WHEN left(last_name, 1) <= 'Q' THEN 'I-Q'
ELSE 'R-Z'
END AS alpha_group
FROM employees;


-- How many employees (current or previous) were born in each decade?
SELECT COUNT(*),
	CASE 
		WHEN birth_date LIKE '195%' THEN '50s'
		ELSE '60s'
	END AS decade
FROM employees
GROUP BY decade;

-- What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
USE employees;

SELECT AVG(salary),
   CASE 
       WHEN dept_name IN ('research', 'development') THEN 'R&D'
       WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
       WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
       ELSE dept_name
   END AS dept_group
FROM departments
INNER JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
INNER JOIN salaries ON salaries.emp_no = dept_emp.emp_no 
AND salaries.to_date > CURDATE()
GROUP BY dept_group;


