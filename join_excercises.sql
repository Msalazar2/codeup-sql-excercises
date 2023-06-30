-- Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;
SELECT *
FROM users, roles;
-- Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.
SELECT *
FROM users
INNER JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;
-- Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
SELECT COUNT(*), roles.name
FROM roles
LEFT JOIN users ON users.role_id = roles.id
GROUP BY roles.name;

-- Use the employees database.
USE employees;

-- Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.
SELECT dept_name, CONCAT(first_name, ' ', last_name) AS current_manager
FROM departments
INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no 
WHERE to_date LIKE '9999%'
ORDER BY dept_name ASC;

-- Find the name of all departments currently managed by women.
SELECT dept_name, CONCAT(first_name,' ', last_name) AS current_manager
FROM departments
INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no 
WHERE to_date LIKE '9999%'
AND gender = 'F'
ORDER BY dept_name ASC;

-- Find the current titles of employees currently working in the Customer Service department.

SELECT title, COUNT(*)
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
INNER JOIN titles ON employees.emp_no = titles.emp_no
WHERE titles.to_date LIKE '9999%'
AND dept_emp.to_date > CURDATE()
AND departments.dept_name = 'Customer Service'
GROUP BY title
ORDER BY title;

-- Find the current salary of all current managers.
SELECT departments.dept_name, CONCAT(employees.last_name, ' ', employees.first_name) AS current_managers, salaries.salary
FROM departments
INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no
INNER JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE salaries.to_date LIKE '9999%'
AND dept_manager.to_date LIKE '9999%'
ORDER BY dept_name ASC;

-- Find the number of current employees in each department.
SELECT departments.dept_no, departments.dept_name, COUNT(*) AS num_employees
FROM departments
INNER JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date LIKE '9999%'
GROUP BY dept_no
ORDER BY dept_no ASC;

-- Which department has the highest average salary? Hint: Use current not historic information.
SELECT department.dept_name, AVG(salaries.salary) AS average_salary
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
INNER JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE salaries.to_date LIKE '9999%'
AND department.to_date LIKE '9999%'
GROUP BY department.dept_name
ORDER BY average_salary DESC;





