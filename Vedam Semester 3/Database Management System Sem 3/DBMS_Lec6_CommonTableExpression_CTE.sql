CREATE DATABASE cte_practice_db;

USE cte_practice_db;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    department_id INT,
    city VARCHAR(50)
);

INSERT INTO employees (id, name, salary, department_id, city)
VALUES
(1, 'Aman', 50000, 1, 'Pune'),
(2, 'Riya', 75000, 1, 'Pune'),
(3, 'Karan', 90000, 1, 'Bhopal'),
(4, 'Neha', 60000, 2, 'Pune'),
(5, 'Rahul', 85000, 2, 'Indore'),
(6, 'Priya', 95000, 2, 'Pune'),
(7, 'Arjun', 45000, 3, 'Bhopal'),
(8, 'Sneha', 70000, 3, 'Jabalpur'),
(9, 'Vikas', 80000, 3, 'Pune'),
(10, 'Ankit', 110000, 4, 'Pune'),
(11, 'Pooja', 65000, 4, 'Indore'),
(12, 'Mohit', 120000, 4, 'Bhopal');

CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (id, department_name)
VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Sales'),
(4, 'Product');

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers (id, name, city)
VALUES
(1, 'Aarav', 'Pune'),
(2, 'Meera', 'Bhopal'),
(3, 'Kabir', 'Indore'),
(4, 'Isha', 'Pune'),
(5, 'Rohan', 'Jabalpur');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    amount INT,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO orders (order_id, customer_id, amount, status)
VALUES
(101, 1, 40000, 'Delivered'),
(102, 1, 70000, 'Delivered'),
(103, 2, 25000, 'Delivered'),
(104, 2, 90000, 'Delivered'),
(105, 3, 55000, 'Delivered'),
(106, 3, 20000, 'Cancelled'),
(107, 4, 120000, 'Delivered'),
(108, 5, 30000, 'Delivered');

SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM customers;
SELECT * FROM orders;


-- Q1 — High Salary Employees
-- Create a CTE named high_salary containing employees whose salary is greater than 70,000. Then display all rows from the CTE.
WITH high_salary AS ( SELECT * FROM employees WHERE salary > 70000)
SELECT * FROM high_salary;

-- Q2 — Department Average
-- Create a CTE that calculates average salary for every department. Display department_id and avg_salary
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT department_id, avg_salary
FROM dept_avg;

-- Q3 — High Average Departments
-- Using the department-average CTE, display only departments whose average salary is greater than 70,000.
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT * FROM dept_avg WHERE avg_salary > 70000;

-- Q4 — Employee Count
-- Create a CTE that calculates employee count for each department. Display department_id and employee_count.
WITH employee_count AS (
    SELECT department_id, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department_id
)
SELECT department_id, employee_count FROM employee_count;

-- Q5 — Department Name + Average
-- Create a department-average CTE and JOIN it with departments. Display department_name and avg_salary.
WITH department_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT d.department_name, da.avg_salary
FROM department_avg da
JOIN departments d
ON da.department_id = d.id;

-- Q6 — Departments With 3+ Employees
-- Create an employee-count CTE. JOIN with departments and display department names having at least 3 employees.
WITH employee_count AS (
    SELECT department_id, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department_id
)
SELECT d.department_name, ec.employee_count
FROM employee_count ec
JOIN departments d
ON ec.department_id = d.id
WHERE ec.employee_count >= 3;

-- Q7 — Highest Average Salary
-- Using a CTE containing department-wise average salary, find the department with the highest average salary.
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT department_id, avg_salary
FROM dept_avg
ORDER BY avg_salary DESC
LIMIT 1;

-- Q8 — Lowest Average Salary
-- Using a CTE containing department-wise average salary, find the department with the lowest average salary.
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT department_id, avg_salary
FROM dept_avg
ORDER BY avg_salary ASC
LIMIT 1;

-- Q9 — Employees Above Company Average
-- Create a CTE containing the company-wide average salary. Find employees whose salary is greater than that average.
WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT *
FROM employees
WHERE salary > (SELECT avg_salary FROM company_avg);

-- Q10 — Above Department Average
-- Create a department-average CTE. JOIN it with employees and find employees whose salary is greater than their department average.
WITH department_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT e.*, da.avg_salary
FROM employees e
JOIN department_avg da
ON e.department_id = da.department_id
WHERE e.salary > da.avg_salary;

