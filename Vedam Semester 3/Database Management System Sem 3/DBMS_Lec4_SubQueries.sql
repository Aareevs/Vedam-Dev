CREATE DATABASE subquery_practice;

USE subquery_practice;

CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO departments (id, department_name, city)
VALUES
(1, 'IT', 'Pune'),
(2, 'HR', 'Mumbai'),
(3, 'Sales', 'Pune'),
(4, 'Finance', 'Delhi'),
(5, 'Marketing', 'Mumbai'),
(6, 'Operations', 'Pune');

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    department_id INT,
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO employees
(id, name, salary, department_id, manager_id)
VALUES

(1, 'Rahul', 80000, 1, NULL),
(2, 'Amit', 120000, 1, 1),
(3, 'Priya', 95000, 1, 1),
(4, 'Sneha', 140000, 1, 1),

(5, 'Neha', 70000, 2, NULL),
(6, 'Rohan', 85000, 2, 5),
(7, 'Karan', 90000, 2, 5),

(8, 'Vikas', 60000, 3, NULL),
(9, 'Anjali', 75000, 3, 8),
(10, 'Arjun', 110000, 3, 8),

(11, 'Pooja', 150000, 4, NULL),
(12, 'Manish', 65000, 4, 11),
(13, 'Kavya', 80000, 4, 11),

(14, 'Sahil', 55000, 5, NULL),
(15, 'Isha', 72000, 5, 14),

(16, 'Dev', 50000, 6, NULL),
(17, 'Meera', 68000, 6, 16),
(18, 'Nikhil', 80000, 6, 16);

USE subquery_practice;

-- Q1. Find the employee(s) who have the highest salary.
SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);


-- Q2. Find the employee(s) who have the lowest salary.
SELECT * FROM employees WHERE salary = (SELECT MIN(salary) FROM employees);


-- Q3. Find employees whose salary is greater than the company’s average salary.
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

-- Q4. Find employees whose salary is less than the company’s average salary.
SELECT * FROM employees WHERE salary < (SELECT AVG(salary) FROM employees);

-- Q5. Find employees whose salary is greater than Rahul’s salary.
SELECT * FROM employees WHERE salary > (SELECT salary FROM employees WHERE name = 'Rahul');

-- Q6. Find employees whose salary is equal to Rahul’s salary.
SELECT * FROM employees WHERE salary = (SELECT salary FROM employees WHERE name = 'Rahul');

-- Q7. Find employees whose salary is greater than the average salary of the IT department.
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'IT'));

-- Q8. Find the employee(s) with the highest salary in the HR department.
SELECT * FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'HR') AND salary = (SELECT MAX(salary) FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'HR'));

-- Q9. Find employees whose salary is exactly equal to the company’s average salary.
SELECT * FROM employees WHERE salary = (SELECT AVG(salary) FROM employees);

-- Q10. Find the employee(s) with the second-highest salary. Do not use LIMIT.
SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees));

-- Q11. Find employees who work in departments located in Pune.
SELECT * FROM employees WHERE department_id IN (SELECT id FROM departments WHERE city = 'Pune');

-- Q12. Find employees who do not work in departments located in Pune.
SELECT * FROM employees WHERE department_id NOT IN (SELECT id FROM departments WHERE city = 'Pune');

-- Q13. Find departments that have at least one employee earning more than ₹1,00,000.
SELECT * FROM departments WHERE id IN (SELECT department_id FROM employees WHERE salary > 100000);

-- Q14. Find employees who belong to departments named IT, HR, or Sales. Use a subquery.
SELECT * FROM employees WHERE department_id IN (SELECT id FROM departments WHERE department_name IN ('IT', 'HR', 'Sales'));

-- Q15. Find employees who work in the same departments as Rahul.
SELECT * FROM employees WHERE department_id IN (SELECT department_id FROM employees WHERE name = 'Rahul');

-- Q16. Find employees who work in the same city as the IT department.
SELECT * FROM employees WHERE department_id IN (SELECT id FROM departments WHERE city IN (SELECT city FROM departments WHERE department_name = 'IT'));

-- Q17. Find employees whose salary is greater than ANY salary in the HR department.
SELECT * FROM employees WHERE salary > ANY (SELECT salary FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'HR'));

-- Q18. Find employees whose salary is greater than ALL salaries in the HR department.
SELECT * FROM employees WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'HR'));

-- Q19. Find employees whose salary is greater than ANY salary of employees working in the Sales department.
SELECT * FROM employees WHERE salary > ANY (SELECT salary FROM employees WHERE department_id IN (SELECT id FROM departments WHERE department_name = 'Sales'));

-- Q20. Find employees whose salary is greater than every employee’s salary in the Sales department.
SELECT * FROM employees WHERE salary > ALL (SELECT salary FROM employees WHERE department_id IN (SELECT id FROM departments WHERE department_name = 'Sales'));

-- A. Subquery with Aggregate Functions

-- Q1. Find all employees whose salary is greater than the average salary of the IT department.
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'IT'));

-- Q2. Find all employees whose salary is greater than the average salary of the HR department.
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'HR'));

-- Q3. Find the employee(s) who have the highest salary in the entire company.
SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);

-- Q4. Find the employee(s) who have the second-highest salary using a subquery.
SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees));

-- B. IN / NOT IN with Subquery

-- Q5. Find all employees who work in departments located in Pune. Use a subquery with IN.
SELECT * FROM employees WHERE department_id IN (SELECT id FROM departments WHERE city = 'Pune');

-- Q6. Find all employees who work in departments located in Mumbai.
SELECT * FROM employees WHERE department_id IN (SELECT id FROM departments WHERE city = 'Mumbai');

-- Q7. Find all employees who do not work in departments located in Pune. Use NOT IN.
SELECT * FROM employees WHERE department_id NOT IN (SELECT id FROM departments WHERE city = 'Pune');

-- Q8. Find the names of employees who work in the IT, HR, or Marketing departments using a subquery.
SELECT name FROM employees WHERE department_id IN (SELECT id FROM departments WHERE department_name IN ('IT', 'HR', 'Marketing'));

-- C. ANY / SOME

-- Q9. Find employees whose salary is greater than ANY employee in the HR department.
SELECT * FROM employees WHERE salary > ANY (SELECT salary FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'HR'));

-- Q10. Find employees whose salary is greater than ANY employee in the IT department.
SELECT * FROM employees WHERE salary > ANY (SELECT salary FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'IT'));

-- Q11. Find employees whose salary is less than ANY employee in the Engineering department.
SELECT * FROM employees WHERE salary < ANY (SELECT salary FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'Engineering'));

-- Q12. Find employees whose salary is greater than SOME employee in the Sales department. Use the SOME keyword explicitly.
SELECT * FROM employees WHERE salary > SOME (SELECT salary FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'Sales'));

-- D. ALL

-- Q13. Find employees whose salary is greater than ALL employees in the HR department.
SELECT * FROM employees WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'HR'));

-- Q14. Find employees whose salary is greater than ALL employees in the IT department.
SELECT * FROM employees WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'IT'));

-- Q15. Find employees whose salary is less than ALL employees in the Engineering department.
SELECT * FROM employees WHERE salary < ALL (SELECT salary FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'Engineering'));

-- Q16. Find employees whose salary is greater than ALL employees in the Sales department. Then explain why the result is different from using ANY.
SELECT * FROM employees WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'Sales'));

-- Challenge Questions

-- Q21. Find the department(s) whose average salary is greater than the average salary of the IT department.
SELECT department_id, AVG(salary) AS average_salary FROM employees GROUP BY department_id HAVING AVG(salary) > (SELECT AVG(salary) FROM employees WHERE department_id = (SELECT id FROM departments WHERE department_name = 'IT'));

-- Q22. Find employees whose salary is greater than the average salary of every department located in Pune. Think carefully about whether ANY or ALL is appropriate.
SELECT * FROM employees WHERE salary > ALL (SELECT AVG(e.salary) FROM employees e WHERE e.department_id IN (SELECT d.id FROM departments d WHERE d.city = 'Pune') GROUP BY e.department_id);

-- Q23. Find the employee(s) who earn the maximum salary among employees working in Pune.
SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees WHERE department_id IN (SELECT id FROM departments WHERE city = 'Pune'));

-- Q24. Find employees whose salary is greater than their department's average and display: name, salary, department_id, department average.
SELECT e.name, e.salary, e.department_id, (SELECT AVG(e2.salary) FROM employees e2 WHERE e2.department_id = e.department_id) AS department_average FROM employees e WHERE e.salary > (SELECT AVG(e2.salary) FROM employees e2 WHERE e2.department_id = e.department_id);

