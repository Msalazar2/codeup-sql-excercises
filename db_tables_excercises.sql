-- List all the databases
SHOW DATABASES;
-- Write the SQL code necessary to use the albums_db database
USE albums_db;
-- Show the currently selected database
SELECT database();
-- List all tables in the database
SHOW TABLES;
-- Write the SQL code to switch the employees database
SHOW DATABASES;
USE employees;
-- Show the currently selected database
SELECT database();
-- List all the tables in the database
SHOW TABLES;
-- Explore the employees table. What different data types are present on this table?
-- 	VARCHAR, DATE, ENUM, INTsalariessalaries

-- Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
-- 	salaries, titles, employees, dpt_manager, dept_emp

-- Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
-- 	departments, dept_emp, dept_manager, employees, titles

-- Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
-- 	all except departments

-- What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
-- 	emp no relationship with dept no

-- Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
SHOW CREATE TABLE dept_manager;