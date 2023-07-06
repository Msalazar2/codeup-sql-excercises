-- Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.
USE somerville_2276;

CREATE TEMPORARY TABLE employees_with_departments(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    dept_name VARCHAR(50),
    PRIMARY KEY (id)
    );
    
-- Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.
ALTER TABLE employees_with_departments ADD full_name VARCHAR(31);

SELECT *
FROM employees_with_departments;

-- Update the table so that the full_name column contains the correct data.
SET SQL_SAFE_UPDATES=1;

UPDATE employees_with_departments
SET full_name = CONCAT(first_name,' ',last_name);
-- Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;
-- What is another way you could have ended up with this same table?
-- CREATE TEMPORARY TABLE employees_with_departments(
-- 	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
--     full_name VARCHAR(100),
--     dept_name VARCHAR(50),
--     PRIMARY KEY (id)
--     );
-- Create a temporary table based on the payment table from the sakila database.
CREATE TEMPORARY TABLE somerville_2276.temp_table AS
SELECT *
FROM sakila.payment;

SELECT *
FROM somerville_2276.temp_table;

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
ALTER TABLE somerville_2276.temp_table MODIFY COLUMN  amount BIGINT;
UPDATE somerville_2276.temp_table SET amount = ROUND(amount * 100);

-- Go back to the employees database. Find out how the current average pay in each department compares to the overall current pay for everyone at the company. For this comparison, you will calculate the z-score for each salary. In terms of salary, what is the best department right now to work for? The worst?
USE employees;
CREATE TEMPORARY TABLE somerville_2276.excercise3 AS (
SELECT AVG(salary) AS average_salary, STDDEV(salary) AS std_salary 
FROM employees.salaries 
WHERE to_date > CURDATE()
);

SELECT * FROM somerville_2276.excercise3;

CREATE TEMPORARY TABLE somerville_2276.zscore_dept_salaries AS (
SELECT dept_name, AVG(salary) AS avg_dept_salary
FROM employees.salaries
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
WHERE employees.salaries.to_date > CURDATE() AND employees.dept_emp.to_date > CURDATE()
GROUP BY dept_name
);

SELECT * FROM somerville_2276.zscore_dept_salaries;

ALTER TABLE somerville_2276.zscore_dept_salaries ADD overall_avg FLOAT(10, 2);
ALTER TABLE somerville_2276.zscore_dept_salaries ADD overall_stddev FLOAT(10, 2);
ALTER TABLE somerville_2276.zscore_dept_salaries ADD dept_zscore FLOAT(10, 2);

UPDATE somerville_2276.zscore_dept_salaries 