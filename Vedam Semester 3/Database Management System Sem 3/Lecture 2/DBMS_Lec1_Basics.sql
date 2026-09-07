
-- CREATE DATABASE college_db;
USE college_db;

CREATE TABLE employee (
   id INT,
   name VARCHAR(50),
   age INT,
   city VARCHAR(50),
   department VARCHAR(50),
   salary DECIMAL(10,2),
   experience INT,
   email VARCHAR(100)
);
use collage_db;

INSERT INTO employee (id, name, age, city, department, salary, experience, email)
VALUES
(1, 'Aman', 22, 'Pune', 'IT', 25000.00, 1, 'aman@gmail.com'),
(2, 'Riya', 24, 'Mumbai', 'HR', 32000.00, 2, 'riya@gmail.com'),
(3, 'Rohit', 27, 'Delhi', 'IT', 45000.00, 5, 'rohit@gmail.com'),
(4, 'Priya', 23, 'Pune', 'Finance', 28000.00, 2, NULL),
(5, 'Rahul', 29, 'Mumbai', 'Sales', 50000.00, 6, 'rahul@gmail.com'),
(6, 'Neha', 26, 'Delhi', 'HR', 38000.00, 4, 'neha@gmail.com'),
(7, 'Karan', 25, 'Pune', 'IT', 35000.00, 3, 'karan@gmail.com'),
(8, 'Sneha', 28, 'Indore', 'Finance', 42000.00, 5, 'sneha@gmail.com'),
(9, 'Vikas', 21, 'Mumbai', 'Sales', 24000.00, 1, NULL),
(10, 'Pooja', 30, 'Delhi', 'IT', 55000.00, 7, 'pooja@gmail.com'),
(11, 'Ankit', 24, 'Pune', 'HR', 30000.00, 2, 'ankit@gmail.com'),
(12, 'Kajal', 27, 'Mumbai', 'Finance', 47000.00, 5, 'kajal@gmail.com'),
(13, 'Deepak', 31, 'Indore', 'Sales', 60000.00, 8, 'deepak@gmail.com'),
(14, 'Aarti', 23, 'Delhi', 'IT', 29000.00, 2, 'aarti@gmail.com'),
(15, 'Sahil', 26, 'Pune', 'Finance', 40000.00, 4, NULL),
(16, 'Nisha', 28, 'Mumbai', 'HR', 46000.00, 6, 'nisha@gmail.com'),
(17, 'Mohit', 25, 'Delhi', 'Sales', 36000.00, 3, 'mohit@gmail.com'),
(18, 'Simran', 29, 'Indore', 'IT', 52000.00, 7, 'simran@gmail.com'),
(19, 'Arjun', 22, 'Pune', 'HR', 26000.00, 1, 'arjun@gmail.com'),
(20, 'Riya', 27, 'Mumbai', 'IT', 48000.00, 5, 'riya2@gmail.com'),
(21, 'Akash', 32, 'Delhi', 'Finance', 65000.00, 10, NULL),
(22, 'Divya', 24, 'Indore', 'Sales', 33000.00, 3, 'divya@gmail.com'),
(23, 'Manish', 30, 'Pune', 'IT', 58000.00, 8, 'manish@gmail.com'),
(24, 'Shreya', 26, 'Mumbai', 'Finance', 41000.00, 4, 'shreya@gmail.com'),
(25, 'Ravi', 23, 'Delhi', 'HR', 31000.00, 2, 'ravi@gmail.com'),
(26, 'Tanya', 28, 'Indore', 'IT', 49000.00, 6, NULL),
(27, 'Suresh', 33, 'Pune', 'Sales', 70000.00, 11, 'suresh@gmail.com'),
(28, 'Meena', 25, 'Mumbai', 'HR', 37000.00, 3, 'meena@gmail.com'),
(29, 'Abhishek', 29, 'Delhi', 'Finance', 54000.00, 7, 'abhishek@gmail.com'),
(30, 'Isha', 22, 'Indore', 'IT', 27000.00, 1, 'isha@gmail.com'),
(31, 'Vivek', 34, 'Pune', 'Finance', 75000.00, 12, 'vivek@gmail.com'),
(32, 'Anjali', 27, 'Mumbai', 'Sales', 44000.00, 5, NULL),
(33, 'Rakesh', 26, 'Delhi', 'IT', 43000.00, 4, 'rakesh@gmail.com'),
(34, 'Sonia', 24, 'Indore', 'HR', 34000.00, 3, 'sonia@gmail.com'),
(35, 'Nitin', 30, 'Pune', 'Sales', 56000.00, 8, 'nitin@gmail.com'),
(36, 'Komal', 25, 'Mumbai', 'IT', 39000.00, 3, 'komal@gmail.com'),
(37, 'Aditya', 28, 'Delhi', 'Finance', 51000.00, 6, 'aditya@gmail.com'),
(38, 'Bhavna', 23, 'Indore', 'Sales', 30000.00, 2, NULL),
(39, 'Harsh', 31, 'Pune', 'HR', 62000.00, 9, 'harsh@gmail.com'),
(40, 'Payal', 26, 'Mumbai', 'Finance', 45000.00, 4, 'payal@gmail.com'),
(41, 'Gaurav', 29, 'Delhi', 'IT', 53000.00, 7, 'gaurav@gmail.com'),
(42, 'Muskan', 22, 'Indore', 'HR', 26000.00, 1, 'muskan@gmail.com'),
(43, 'Yash', 27, 'Pune', 'Sales', 47000.00, 5, NULL),
(44, 'Nidhi', 28, 'Mumbai', 'IT', 50000.00, 6, 'nidhi@gmail.com'),
(45, 'Tarun', 32, 'Delhi', 'Sales', 68000.00, 10, 'tarun@gmail.com'),
(46, 'Radhika', 24, 'Indore', 'Finance', 35000.00, 3, 'radhika@gmail.com'),
(47, 'Ashish', 30, 'Pune', 'IT', 59000.00, 8, 'ashish@gmail.com'),
(48, 'Preeti', 25, 'Mumbai', 'HR', 38000.00, 3, NULL),
(49, 'Sanjay', 33, 'Delhi', 'Finance', 72000.00, 11, 'sanjay@gmail.com'),
(50, 'Kriti', 23, 'Indore', 'IT', 31000.00, 2, 'kriti@gmail.com');

-- SELECT * FROM employee;
SELECT name,salary FROM employee;

-- 3. DISTINCT QUES - This command is used to display unique values from a column.

-- Q1. Display unique cities from the employee table.
SELECT DISTINCT city FROM employee;

-- Q2. Display unique departments.
SELECT DISTINCT department FROM employee;

-- Q3. Display unique ages.
SELECT DISTINCT age FROM employee;

-- Q4. Display unique experience values.
SELECT DISTINCT experience FROM employee;

-- Q5. Display unique city and department combinations.
SELECT DISTINCT city, department FROM employee;

-- 4. WHERE QUES - This command is used to filter records based on a specified condition.

-- Q1. Display employees from Pune.
SELECT * FROM employee WHERE city = 'Pune';

-- Q2. Display employees from the IT department.
SELECT * FROM employee WHERE department = 'IT';

-- Q3. Display employees from Mumbai.
SELECT * FROM employee WHERE city = 'Mumbai';

-- Q4. Display employees from the Finance department.
SELECT * FROM employee WHERE department = 'Finance';

-- Q5. Display employees from Delhi.
SELECT * FROM employee WHERE city = 'Delhi';

-- 5. COMPARISON OPERATORS QUES - This command is used to compare values in a column with a specified value.

-- Q1. [=] Display employees from Pune.
SELECT * FROM employee WHERE city = 'Pune';

-- Q2. [>] Display employees whose salary is greater than 50000.
SELECT * FROM employee WHERE salary > 50000;

-- Q3. [<] Display employees whose age is less than 25.
SELECT * FROM employee WHERE age < 25;

-- Q4. [>=] Display employees whose experience is 5 or more years.
SELECT * FROM employee WHERE experience >= 5;

-- Q5. [!=] Display all employees except those in the IT department.
SELECT * FROM employee WHERE department != 'IT';

-- 9. LIKE % QUES - This command is used to search for a specified pattern in a column.

-- Q1. Display names starting with A.
SELECT * FROM employee WHERE name LIKE 'A%';

-- Q2. Display names ending with a.
SELECT * FROM employee WHERE name LIKE '%a';

-- Q3. Display names containing an.
SELECT * FROM employee WHERE name LIKE '%an%';

-- Q4. Display names containing ri.
SELECT * FROM employee WHERE name LIKE '%ri%';

-- Q5. Display employees whose email ends with @gmail.com.
SELECT * FROM employee WHERE email LIKE '%@gmail.com';

-- 10. LIKE — _ (underscore) -> This command is used to search for a specified pattern in a column where the underscore (_) represents a single character.

-- Q1. Display names with exactly 4 characters.
SELECT * FROM employee WHERE name LIKE '____';

-- Q2. Display names starting with R and having exactly 4 characters.
SELECT * FROM employee WHERE name LIKE 'R___';

-- Q3. Display names whose second character is a.
SELECT * FROM employee WHERE name LIKE '_a%';

-- Q4. Display names whose first character is A and second character is n.
SELECT * FROM employee WHERE name LIKE 'An%';

-- Q5. Display names with exactly 5 characters.
SELECT * FROM employee WHERE name LIKE '_____';

-- 11. IN - This command is used to filter records based on a specified list of values.

-- Q1. Display employees from Pune, Mumbai, and Delhi.
SELECT * FROM employee WHERE city IN ('Pune', 'Mumbai', 'Delhi');

-- Q2. Display employees from the IT and HR departments.
SELECT * FROM employee WHERE department IN ('IT', 'HR');

-- Q3. Display employees from the Finance and Sales departments.
SELECT * FROM employee WHERE department IN ('Finance', 'Sales');

-- Q4. Display employees with IDs 1, 5, 10, 15, and 20.
SELECT * FROM employee WHERE id IN (1, 5, 10, 15, 20);

-- Q5. Display employees from Pune, Delhi, and Indore.
SELECT * FROM employee WHERE city IN ('Pune', 'Delhi', 'Indore');

-- 12. NOT IN - This command is used to filter records that do not match a specified list of values.

-- Q1. Display employees except those from Pune and Mumbai.
SELECT * FROM employee WHERE city NOT IN ('Pune', 'Mumbai');

-- Q2. Display employees except those in the IT and HR departments.
SELECT * FROM employee WHERE department NOT IN ('IT', 'HR');

-- Q3. Display employees except those from Pune, Delhi, and Indore.
SELECT * FROM employee WHERE city NOT IN ('Pune', 'Delhi', 'Indore');

-- Q4. Display employees except those with IDs 1, 2, 3, 4, and 5.
SELECT * FROM employee WHERE id NOT IN (1, 2, 3, 4, 5);

-- Q5. Display employees except those in the Finance and Sales departments.
SELECT * FROM employee WHERE department NOT IN ('Finance', 'Sales');

-- 13. BETWEEN - This command is used to filter records within a specified range of values.

-- Q1. Display employees whose salary is between 30000 and 50000.
SELECT * FROM employee WHERE salary BETWEEN 30000 AND 50000;

-- Q2. Display employees whose age is between 25 and 30.
SELECT * FROM employee WHERE age BETWEEN 25 AND 30;

-- Q3. Display employees whose experience is between 3 and 7 years.
SELECT * FROM employee WHERE experience BETWEEN 3 AND 7;

-- Q4. Display employees whose salary is between 40000 and 60000.
SELECT * FROM employee WHERE salary BETWEEN 40000 AND 60000;

-- Q5. Display employees whose age is between 22 and 27.
SELECT * FROM employee WHERE age BETWEEN 22 AND 27;

-- 14. NOT BETWEEN - This command is used to filter records outside a specified range of values.

-- Q1. Display employees whose salary is outside 30000–50000.
SELECT * FROM employee WHERE salary NOT BETWEEN 30000 AND 50000;

-- Q2. Display employees whose age is outside 25–30.
SELECT * FROM employee WHERE age NOT BETWEEN 25 AND 30;

-- Q3. Display employees whose experience is outside 3–7 years.
SELECT * FROM employee WHERE experience NOT BETWEEN 3 AND 7;

-- Q4. Display employees whose salary is outside 40000–60000.
SELECT * FROM employee WHERE salary NOT BETWEEN 40000 AND 60000;

-- Q5. Display employees whose age is outside 22–27.
SELECT * FROM employee WHERE age NOT BETWEEN 22 AND 27;

-- 15. IS NULL - This command is used to filter records with NULL values in a specified column.

-- Q1. Display employees whose email is NULL.
SELECT * FROM employee WHERE email IS NULL;

-- Q2. Display employees whose email is NULL and whose city is Pune.
SELECT * FROM employee WHERE email IS NULL AND city = 'Pune';

-- Q3. Display employees whose email is NULL and whose salary is greater than 40000.
SELECT * FROM employee WHERE email IS NULL AND salary > 40000;

-- Q4. Display employees whose email is NULL and who are in the IT department.
SELECT * FROM employee WHERE email IS NULL AND department = 'IT';

-- Q5. Display employees whose email is NULL and whose experience is 5 or more years.
SELECT * FROM employee WHERE email IS NULL AND experience >= 5;

-- 16. IS NOT NULL - This command is used to filter records with non-NULL values in a specified column.

-- Q1. Display employees whose email is available.
SELECT * FROM employee WHERE email IS NOT NULL;

-- Q2. Display employees whose email is available and whose city is Mumbai.
SELECT * FROM employee WHERE email IS NOT NULL AND city = 'Mumbai';

-- Q3. Display employees whose email is available and whose salary is greater than 40000.
SELECT * FROM employee WHERE email IS NOT NULL AND salary > 40000;

-- Q4. Display employees whose email is available and who are in the IT department.
SELECT * FROM employee WHERE email IS NOT NULL AND department = 'IT';

-- Q5. Display employees whose email is available and whose experience is 5 or more years.
SELECT * FROM employee WHERE email IS NOT NULL AND experience >= 5;

-- 17. ORDER BY QUES - This command is used to sort the result set in ascending or descending order based on one or more columns.

-- Q1. Display employees in ascending order of salary.
SELECT * FROM employee ORDER BY salary ASC;

-- Q2. Display employees in descending order of salary.
SELECT * FROM employee ORDER BY salary DESC;

-- Q3. Display employees in ascending order of age.
SELECT * FROM employee ORDER BY age ASC;

-- Q4. Display employees in descending order of experience.
SELECT * FROM employee ORDER BY experience DESC;

-- Q5. Display employees in alphabetical order of name.
SELECT * FROM employee ORDER BY name ASC;

-- 18. LIMIT QUES - This command is used to limit the number of records returned in the result set.

-- Q1. Display the first 5 records from the employee table.
SELECT * FROM employee LIMIT 5;

-- Q2. Display the top 5 highest-paid employees.
SELECT * FROM employee ORDER BY salary DESC LIMIT 5;

-- Q3. Display the top 3 lowest-paid employees.
SELECT * FROM employee ORDER BY salary ASC LIMIT 3;

-- Q4. Display the top 5 most experienced employees.
SELECT * FROM employee ORDER BY experience DESC LIMIT 5;

-- Q5. Display the 5 youngest employees by age.
SELECT * FROM employee ORDER BY age ASC LIMIT 5;

-- 19. COUNT() QUES - This command is used to count the number of records in a specified column or table.

-- Q1. Count the total number of employees.
SELECT COUNT(*) FROM employee;

-- Q2. Count the total employees in the IT department.
SELECT COUNT(*) FROM employee WHERE department = 'IT';

-- Q3. Count the total employees in Pune.
SELECT COUNT(*) FROM employee WHERE city = 'Pune';

-- Q4. Count employees whose salary is greater than 50000.
SELECT COUNT(*) FROM employee WHERE salary > 50000;

-- Q5. Count employees whose experience is 5 or more years.
SELECT COUNT(*) FROM employee WHERE experience >= 5;


-- 20. SUM() QUES - This command is used to calculate the total sum of a numeric column.

-- Q1. Calculate the total salary of all employees.
SELECT SUM(salary) FROM employee;

-- Q2. Calculate the total salary of IT employees.
SELECT SUM(salary) FROM employee WHERE department = 'IT';

-- Q3. Calculate the total salary of employees from Pune.
SELECT SUM(salary) FROM employee WHERE city = 'Pune';

-- Q4. Calculate the total salary of employees whose salary is between 30000 and 50000.
SELECT SUM(salary) FROM employee WHERE salary BETWEEN 30000 AND 50000;

-- Q5. Calculate the total salary of employees whose experience is 5 or more years.
SELECT SUM(salary) FROM employee WHERE experience >= 5;

-- 21. AVG() QUES - This command is used to calculate the average value of a numeric column.

-- Q1. Calculate the average salary of all employees.
SELECT AVG(salary) FROM employee;

-- Q2. Calculate the average salary of the HR department.
SELECT AVG(salary) FROM employee WHERE department = 'HR';

-- Q3. Calculate the average salary of the IT department.
SELECT AVG(salary) FROM employee WHERE department = 'IT';

-- Q4. Calculate the average salary of employees from Pune.
SELECT AVG(salary) FROM employee WHERE city = 'Pune';

-- Q5. Calculate the average salary of employees whose experience is 5 or more years.
SELECT AVG(salary) FROM employee WHERE experience >= 5;


-- 22. MAX() QUES - This command is used to find the maximum value in a numeric column.

-- Q1. Find the highest salary in the employee table.
SELECT MAX(salary) FROM employee;

-- Q2. Find the maximum age in the employee table.
SELECT MAX(age) FROM employee;

-- Q3. Find the maximum experience in the employee table.
SELECT MAX(experience) FROM employee;

-- Q4. Find the highest salary in the IT department.
SELECT MAX(salary) FROM employee WHERE department = 'IT';

-- Q5. Find the highest salary in Pune.
SELECT MAX(salary) FROM employee WHERE city = 'Pune';


-- 23. MIN() QUES - This command is used to find the minimum value in a numeric column.

-- Q1. Find the lowest salary in the employee table.
SELECT MIN(salary) FROM employee;

-- Q2. Find the minimum age in the employee table.
SELECT MIN(age) FROM employee;

-- Q3. Find the minimum experience in the employee table.
SELECT MIN(experience) FROM employee;

-- Q4. Find the lowest salary in the HR department.
SELECT MIN(salary) FROM employee WHERE department = 'HR';

-- Q5. Find the lowest salary in Mumbai.
SELECT MIN(salary) FROM employee WHERE city = 'Mumbai';


-- 24. GROUP BY QUES - This command is used to group records based on a specified column and perform aggregate functions on each group.

-- Q1. Find the number of employees in each department.
SELECT department, COUNT(*) FROM employee GROUP BY department;

-- Q2. Find the number of employees in each city.
SELECT city, COUNT(*) FROM employee GROUP BY city;

-- Q3. Calculate the total salary for each department.
SELECT department, SUM(salary) FROM employee GROUP BY department;

-- Q4. Calculate the average salary for each city.
SELECT city, AVG(salary) FROM employee GROUP BY city;

-- Q5. Find the highest salary in each department.
SELECT department, MAX(salary) FROM employee GROUP BY department;


-- FINAL MIXED PRACTICE QUES

-- Q1. Pune IT employees whose salary is greater than 40000.
SELECT * FROM employee WHERE city = 'Pune' AND department = 'IT' AND salary > 40000;

-- Q2. Mumbai or Delhi employees whose age is greater than 25.
SELECT * FROM employee WHERE city IN ('Mumbai', 'Delhi') AND age > 25;

-- Q3. Employees from IT, HR, and Finance whose salary is greater than 35000.
SELECT * FROM employee WHERE department IN ('IT', 'HR', 'Finance') AND salary > 35000;

-- Q4. Employees whose salary is between 40000 and 60000 and whose experience is 5 or more years.
SELECT * FROM employee WHERE salary BETWEEN 40000 AND 60000 AND experience >= 5;

-- Q5. Employees whose name starts with A and whose age is greater than 25.
SELECT * FROM employee WHERE name LIKE 'A%' AND age > 25;

-- Q6. Employees except those from Pune and Mumbai whose salary is between 40000 and 60000.
SELECT * FROM employee WHERE city NOT IN ('Pune', 'Mumbai') AND salary BETWEEN 40000 AND 60000;

-- Q7. Employees whose email is NULL and whose salary is greater than 40000.
SELECT * FROM employee WHERE email IS NULL AND salary > 40000;

-- Q8. Employees whose email is available and whose name starts with S.
SELECT * FROM employee WHERE email IS NOT NULL AND name LIKE 'S%';

-- Q9. For each department, find the employee count and total salary.
SELECT department, COUNT(*), SUM(salary) FROM employee GROUP BY department;

-- Q10. For each city, find the average salary and highest salary.
SELECT city, AVG(salary), MAX(salary) FROM employee GROUP BY city;