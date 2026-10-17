CREATE DATABASE windowsfunc_practice_db;

USE windowsfunc_practice_db;

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

-- Level 1 — OVER() Foundation

-- Q1) Show every employee’s name, salary, and the overall average salary using a window function.
SELECT name, salary, AVG(salary) OVER() AS overall_avg_salary FROM employees;

-- Q2) Show every employee’s name, salary, and the overall total salary using a window function.
SELECT name, salary, SUM(salary) OVER() AS overall_total_salary FROM employees;

-- Q3) Show every employee’s name, salary, and the total number of employees using a window function.
SELECT name, salary, COUNT(*) OVER() AS number_of_employees FROM employees;

-- Q4) Show every employee’s name, salary, and the highest salary in the company using a window function.
SELECT name, salary, MAX(salary) OVER() AS highest_salary FROM employees;

-- Q5) Show every employee’s name, salary, and the lowest salary in the company using a window function.
SELECT name, salary, MIN(salary) OVER() AS lowest_salary FROM employees;

-- Level 2 — PARTITION BY

-- Q6) Show every employee along with the average salary of their department.
SELECT name, salary, department_id, AVG(salary) OVER(PARTITION BY department_id) AS dept_avg_salary FROM employees;

-- Q7) Show every employee along with the total salary of their department.
SELECT name, salary, department_id, SUM(salary) OVER(PARTITION BY department_id) AS dept_total_salary FROM employees;

-- Q8) Show every employee along with the number of employees in their department.
SELECT name, salary, department_id, COUNT(*) OVER(PARTITION BY department_id) AS dept_employee_count FROM employees;

-- Q9) Show every employee along with the maximum salary of their department.
SELECT name, salary, department_id, MAX(salary) OVER(PARTITION BY department_id) AS dept_max_salary FROM employees;

-- Q10) Show every employee along with the minimum salary of their department.
SELECT name, salary, department_id, MIN(salary) OVER(PARTITION BY department_id) AS dept_min_salary FROM employees;

-- Level 3 — ORDER BY + Ranking

-- Q11) Rank all employees by salary from highest to lowest using RANK().
SELECT name, salary, RANK() OVER(ORDER BY salary DESC) AS salary_rank FROM employees;

-- Q12) Assign a unique row number to all employees ordered by salary from highest to lowest using ROW_NUMBER().
SELECT name, salary, ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num FROM employees;

-- Q13) Rank employees within each department based on salary from highest to lowest.
SELECT name, salary, department_id, RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS dept_rank FROM employees;

-- Q14) Assign a unique row number within each department, with the highest salary getting row number 1.
SELECT name, salary, department_id, ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) AS dept_row_num FROM employees;

-- Q15) Display ROW_NUMBER(), RANK(), and DENSE_RANK() together and compare their results.
SELECT name,salary,row_number() over(order by salary desc) row_num,rank() over(order by salary desc) salary_rank,dense_rank() over(order by salary desc) denserank from employees;


-- Level 4 — PARTITION BY + ORDER BY

-- Q16) Find the highest-paid employee in each department using a window function.
WITH ranked_employees AS (SELECT name, salary, department_id, RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS salary_rank FROM employees) SELECT name, salary, department_id FROM ranked_employees WHERE salary_rank = 1;

-- Q17) Find the top 2 highest-paid employees from each department.
WITH ranked_employees AS (SELECT name, salary, department_id, ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) AS salary_rank FROM employees) SELECT name, salary, department_id FROM ranked_employees WHERE salary_rank <= 2;

-- Q18) Show each employee’s salary and the difference between their salary and their department’s average salary.
SELECT name, salary, department_id, salary - AVG(salary) OVER(PARTITION BY department_id) AS salary_difference FROM employees;

-- Q19) Show each employee’s salary and the percentage of their department’s total salary contributed by that employee.
SELECT name, salary, department_id, ROUND(salary * 100.0 / SUM(salary) OVER(PARTITION BY department_id), 2) AS dept_salary_percentage FROM employees;

-- Q20) Rank employees within each department and display only employees whose rank is 1 or 2.
WITH ranked_employees AS (SELECT name, salary, department_id, RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) AS salary_rank FROM employees) SELECT name, salary, department_id, salary_rank FROM ranked_employees WHERE salary_rank <= 2;