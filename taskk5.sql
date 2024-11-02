CREATE DATABASE CompanyDB;
USE CompanyDB;
-- section 1
CREATE SCHEMA Sales;
CREATE SEQUENCE Sales.employees_seq
    AS INT
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE Sales.employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    salary DECIMAL(10, 2),
    hire_date DATE
);

INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (1, 'Robinett', 'Jannasch', 2210.49, '2020-08-13');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (2, 'Lyon', 'Awton', 4636.18, '2020-12-24');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (3, 'Bennie', 'Pellamonuten', 2660.56, '2024-10-23');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (4, 'Ursala', 'Feechan', 8612.81, '2024-08-22');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (5, 'Urson', 'Howie', 2869.48, '2024-01-01');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (6, 'Caren', 'Maslen', 5005.0, '2020-01-02');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (7, 'Clarabelle', 'McSparran', 3176.04, '2024-01-27');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (8, 'Reinhold', 'Casali', 2822.57, '2024-09-07');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (9, 'Umeko', 'Rollings', 2189.72, '2024-10-21');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (10, 'Paxton', 'Duffie', 3276.15, '2024-08-28');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (11, 'Edgardo', 'Tringham', 2449.66, '2023-11-06');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (12, 'Vale', 'McGennis', 9333.43, '2024-06-18');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (13, 'Lyn', 'Laying', 5387.36, '2024-01-16');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (14, 'George', 'Allchin', 2083.6, '2024-08-11');
INSERT INTO Sales.employees (employee_id, first_name, last_name, salary, hire_date) VALUES (15, 'Loreen', 'Jiggens', 6525.21, '2024-09-13');

-- section 2

-- Select all columns from the "employees" table.
SELECT * FROM Sales.employees;

-- Retrieve only the "first_name" and "last_name" columns from the "employees" table.
SELECT first_name, last_name 
FROM Sales.employees;

-- Retrieve “full name” as a one column from "first_name" and "last_name" columns from the "employees" table.
SELECT first_name + ' ' + last_name 
AS fullName 
FROM Sales.employees;

-- Show the average salary of all employees.
SELECT SUM(salary) / COUNT(salary) 
AS averageSalary 
FROM Sales.employees;

-- Select employees whose salary is greater than 50000.
SELECT * FROM Sales.employees 
WHERE salary > 50000;

-- Retrieve employees hired in the year 2020.
SELECT * FROM Sales.employees 
WHERE YEAR(hire_date) = 2020;

-- List employees whose last names start with 'S.'
SELECT * FROM Sales.employees 
WHERE last_name LIKE 'S%';

-- Display the top 10 highest-paid employees.
SELECT * FROM Sales.employees
WHERE salary IN (
    SELECT TOP 10 salary 
    FROM Sales.employees 
    ORDER BY salary DESC
) ORDER BY salary DESC;

-- Find employees with salaries between 40000 and 60000.
SELECT * FROM Sales.employees 
WHERE salary >= 40000 AND salary <= 60000;

-- Show employees with names containing the substring 'man.'
SELECT * FROM Sales.employees 
WHERE first_name LIKE '%man%' 
   OR last_name LIKE '%man%';

-- Display employees with a NULL value in the "hire_date" column.
SELECT * FROM Sales.employees 
WHERE hire_date IS NULL;

-- Select employees with a salary in the set (40000, 45000, 50000).
SELECT * FROM Sales.employees 
WHERE salary = 40000 OR salary = 45000 OR salary = 50000;

-- Retrieve employees hired between '2020-01-01' and '2021-01-01.'
SELECT * FROM Sales.employees 
WHERE hire_date >= '2020-01-01' AND hire_date <= '2021-01-01';

-- List employees with salaries in descending order.
SELECT * FROM Sales.employees 
ORDER BY salary DESC;

-- Show the first 5 employees ordered by "last_name" in ascending order.
SELECT TOP 5 * FROM Sales.employees 
ORDER BY last_name ASC;

-- Display employees with a salary greater than 55000 and hired in 2020.
SELECT * FROM Sales.employees 
WHERE salary > 55000 
AND hire_date >= '2020-01-01' AND hire_date <= '2020-12-31';

-- Select employees whose first name is 'John' or 'Jane.'
SELECT * FROM Sales.employees
WHERE first_name = 'John' OR first_name = 'Jane';

-- List employees with a salary less than or equal to 55000 and a hire date after '2022-01-01.'
SELECT * FROM Sales.employees 
WHERE salary <= 55000 AND hire_date > '2022-01-01';

-- Retrieve employees with a salary greater than the average salary.
SELECT * FROM Sales.employees
WHERE salary > (SELECT AVG(salary) FROM Sales.employees);

-- Display the 3rd to 7th highest-paid employees.


-- List employees hired after '2021-01-01' in alphabetical order.
SELECT * FROM Sales.employees 
WHERE hire_date > '2021-01-01'
ORDER BY first_name, last_name;

-- Retrieve employees with a salary greater than 50000 and last name not starting with 'A.'
SELECT * FROM Sales.employees 
WHERE salary > 50000 AND last_name NOT LIKE 'A%';

-- Display employees with a salary that is not NULL.
SELECT * FROM Sales.employees 
WHERE salary IS NOT NULL;

-- Show employees with names containing 'e' or 'i' and a salary greater than 45000.
SELECT * FROM Sales.employees 
WHERE (first_name LIKE '%e%' OR first_name LIKE '%i%' OR last_name LIKE '%e%' OR last_name LIKE '%i%') AND salary > 45000;
