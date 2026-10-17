CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary INT,
    experience INT
);

INSERT INTO employees (id, name, department, city, salary, experience)
VALUES
(1, 'Aman', 'IT', 'Pune', 60000, 2),
(2, 'Riya', 'IT', 'Bhopal', 80000, 4),
(3, 'Karan', 'IT', 'Pune', 100000, 6),
(4, 'Neha', 'HR', 'Pune', 50000, 3),
(5, 'Vikas', 'HR', 'Delhi', 70000, 7),
(6, 'Pooja', 'Sales', 'Pune', 40000, 2),
(7, 'Arjun', 'Sales', 'Delhi', 60000, 5),
(8, 'Meera', 'Sales', 'Pune', 90000, 8),
(9, 'Rahul', 'Finance', 'Delhi', 55000, 3),
(10, 'Sneha', 'Finance', 'Pune', 75000, 6),
(11, 'Dev', 'Finance', 'Delhi', 95000, 9),
(12, 'Isha', 'IT', 'Delhi', 90000, 5);

SELECT * FROM employees;

-- LEVEL 1: BASIC DERIVED TABLE

-- Q1. Create a derived table that shows each department and its average salary. Display the complete derived result.
SELECT * FROM (SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department) AS dept_avg;

-- Q2. Create a derived table that shows each department and its employee count. Display the result using an outer SELECT.
SELECT department, emp_count FROM (SELECT department, COUNT(*) AS emp_count FROM employees GROUP BY department) AS dept_count;

-- Q3. Create a derived table containing department-wise maximum salary and display only the department and maximum salary.
SELECT department, max_salary FROM (SELECT department, MAX(salary) AS max_salary FROM employees GROUP BY department) AS dept_max;

-- Q4. Create a derived table containing department-wise minimum salary and display only departments where the minimum salary is below 60000.
SELECT department, min_salary FROM (SELECT department, MIN(salary) AS min_salary FROM employees GROUP BY department) AS dept_min WHERE min_salary < 60000;

-- Q5. Create a derived table containing department-wise total salary and display departments whose total salary is greater than 200000.
SELECT department, total_salary FROM (SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department) AS dept_total WHERE total_salary > 200000;

-- Q6. Create a derived table containing department-wise average experience and display departments whose average experience is greater than 5 years.
SELECT department, avg_experience FROM (SELECT department, AVG(experience) AS avg_experience FROM employees GROUP BY department) AS dept_exp WHERE avg_experience > 5;

-- Q7. Create a derived table containing department-wise salary range (MAX(salary) - MIN(salary)) and display departments whose salary range is greater than 40000.
SELECT department, salary_range FROM (SELECT department, MAX(salary) - MIN(salary) AS salary_range FROM employees GROUP BY department) AS dept_range WHERE salary_range > 40000;

-- Q8. Create a derived table containing department, average salary and employee count. Display departments having more than 2 employees.
SELECT department, avg_salary, emp_count FROM (SELECT department, AVG(salary) AS avg_salary, COUNT(*) AS emp_count FROM employees GROUP BY department) AS dept_stats WHERE emp_count > 2;


-- LEVEL 2: DERIVED TABLE + FILTERING / SORTING

-- Q9. Using a derived table, find the department with the highest average salary.
SELECT department, avg_salary FROM (SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department) AS dept_avg ORDER BY avg_salary DESC LIMIT 1;

-- Q10. Using a derived table, find the department with the lowest average salary.
SELECT department, avg_salary FROM (SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department) AS dept_avg ORDER BY avg_salary ASC LIMIT 1;

-- Q11. Using a derived table, find the top 2 departments based on average salary.
SELECT department, avg_salary FROM (SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department) AS dept_avg ORDER BY avg_salary DESC LIMIT 2;

-- Q12. Using a derived table, find the top 2 departments based on employee count.
SELECT department, emp_count FROM (SELECT department, COUNT(*) AS emp_count FROM employees GROUP BY department) AS dept_count ORDER BY emp_count DESC LIMIT 2;

-- Q13. Using a derived table, find the department with the highest total salary.
SELECT department, total_salary FROM (SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department) AS dept_total ORDER BY total_salary DESC LIMIT 1;

-- Q14. Using a derived table, find the department with the widest salary range.
SELECT department, salary_range FROM (SELECT department, MAX(salary) - MIN(salary) AS salary_range FROM employees GROUP BY department) AS dept_range ORDER BY salary_range DESC LIMIT 1;

-- Q15. Using a derived table, find the department with the highest average experience.
SELECT department, avg_experience FROM (SELECT department, AVG(experience) AS avg_experience FROM employees GROUP BY department) AS dept_exp ORDER BY avg_experience DESC LIMIT 1;

-- Q16. Create a derived table containing department, average salary, employee count and maximum salary. Display departments where average salary is above 70000 and employee count is at least 3.
SELECT department, avg_salary, emp_count, max_salary FROM (SELECT department, AVG(salary) AS avg_salary, COUNT(*) AS emp_count, MAX(salary) AS max_salary FROM employees GROUP BY department) AS dept_stats WHERE avg_salary > 70000 AND emp_count >= 3;


-- LEVEL 3: AGGREGATION ON DERIVED TABLE

-- Q17. Find the average of all department average salaries.
SELECT AVG(avg_salary) AS avg_department_salary FROM (SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department) AS dept_avg;

-- Q18. Find the average department size (average of department-wise employee counts).
SELECT AVG(emp_count) AS avg_department_size FROM (SELECT department, COUNT(*) AS emp_count FROM employees GROUP BY department) AS dept_count;

-- Q19. Find the maximum among all department average salaries.
SELECT MAX(avg_salary) AS max_department_avg_salary FROM (SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department) AS dept_avg;

-- Q20. Find the minimum among all department average salaries.
SELECT MIN(avg_salary) AS min_department_avg_salary FROM (SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department) AS dept_avg;

-- Q21. Find the average of department-wise maximum salaries.
SELECT AVG(max_salary) AS avg_department_max_salary FROM (SELECT department, MAX(salary) AS max_salary FROM employees GROUP BY department) AS dept_max;

-- Q22. Find the average salary range across all departments.
SELECT AVG(salary_range) AS avg_salary_range FROM (SELECT department, MAX(salary) - MIN(salary) AS salary_range FROM employees GROUP BY department) AS dept_range;

-- Q23. Find the total number of employees belonging only to departments whose average salary is greater than 70000.
SELECT SUM(emp_count) AS total_employees FROM (SELECT department, AVG(salary) AS avg_salary, COUNT(*) AS emp_count FROM employees GROUP BY department) AS dept_stats WHERE avg_salary > 70000;

-- Q24. Find the average employee count of only those departments whose total salary is greater than 200000.
SELECT AVG(emp_count) AS avg_employee_count FROM (SELECT department, SUM(salary) AS total_salary, COUNT(*) AS emp_count FROM employees GROUP BY department) AS dept_stats WHERE total_salary > 200000;


-- LEVEL 4: ADVANCED / REAL-WORLD DERIVED TABLE PROBLEMS

-- Q25. Find departments whose average salary is greater than the overall company average salary.
SELECT department, avg_salary FROM (SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department) AS dept_avg WHERE avg_salary > (SELECT AVG(salary) FROM employees);

-- Q26. Find departments whose employee count is greater than the average department size.
SELECT department, emp_count FROM (SELECT department, COUNT(*) AS emp_count FROM employees GROUP BY department) AS dept_count WHERE emp_count > (SELECT AVG(emp_count) FROM (SELECT COUNT(*) AS emp_count FROM employees GROUP BY department) AS dept_sizes);

-- Q27. Find the department whose average salary is closest to the overall company average salary.
SELECT department, avg_salary FROM (SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department) AS dept_avg ORDER BY ABS(avg_salary - (SELECT AVG(salary) FROM employees)) ASC LIMIT 1;

-- Q28. Find the department whose average salary is farthest from the overall company average salary.
SELECT department, avg_salary FROM (SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department) AS dept_avg ORDER BY ABS(avg_salary - (SELECT AVG(salary) FROM employees)) DESC LIMIT 1;

-- Q29. Find the employee(s) whose salary is greater than their own department's average salary. Use a derived table and JOIN.
SELECT e.id, e.name, e.department, e.salary FROM employees AS e JOIN (SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department) AS dept_avg ON e.department = dept_avg.department WHERE e.salary > dept_avg.avg_salary;

-- Q30. Find the highest-paid employee from each department. Use a derived table and JOIN. If two employees have the same maximum salary, display both.
SELECT e.id, e.name, e.department, e.salary FROM employees AS e JOIN (SELECT department, MAX(salary) AS max_salary FROM employees GROUP BY department) AS dept_max ON e.department = dept_max.department AND e.salary = dept_max.max_salary;

