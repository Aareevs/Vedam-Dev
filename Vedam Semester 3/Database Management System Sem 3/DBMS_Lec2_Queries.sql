
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

-- Level 1 — Basic HAVING

-- 1. Department-wise employee count nikalo. Sirf woh departments dikhao jahan 2 se zyada
-- employees hain.
select department,count(*) from employee group by department having employee count(*)>11;

--  City-wise employee count nikalo. Sirf woh cities dikhao jahan 3 ya zyada employees hain.
select city,count(*) from employee group by city having count(*)>3;

-- 3. Department-wise average salary nikalo. Sirf woh departments dikhao jinki average salary 60,000 se zyada hai.
Select department,avg(salary) from employee group by department having avg(salary)>20000;

-- 4. Department-wise maximum salary nikalo. Sirf woh departments dikhao jahan maximum salary  75,000 se zyada hai.
SELECT department, MAX(salary) FROM employee GROUP BY department HAVING MAX(salary) > 75000;

-- 5. City-wise total salary nikalo. Sirf woh cities dikhao jahan total salary 1,50,000 se zyada hai.
Select city,count(*) from employee group by city having sum(salary)>150000;

-- Level 2 — WHERE + GROUP BY + HAVING

-- 6. Sirf Pune ke employees ko consider karke department-wise count nikalo. Sirf woh departments dikhao jahan 2 ya zyada employees hain.
Select department,city,count(*) from employee where city='pune' group by department having count(*)>2;

-- 7. Sirf Pune ke employees ko consider karke department-wise average salary nikalo. Sirf woh departments dikhao jinki average salary 60,000 se zyada hai.
Select city,department,avg(salary) from employee where city='pune' group by department having avg(salary)>20000;

-- 8. Sirf Mumbai ke employees ko consider karke department-wise total salary nikalo. Sirf woh departments dikhao jinki total salary 1,00,000 se zyada hai.
Select city,department,sum(salary) from employee where city='mumbai' group by department having sum(salary)>100000;

-- 9. Sirf un employees ko consider karo jinki salary 50,000 se zyada hai. Department-wise count nikalo aur sirf woh departments dikhao jahan 2 se zyada employees hain.
Select department,count(*) from employee where salary>50000 group by department having count(*)>2;

-- 10. Pune ke employees jinki salary 60,000 se zyada hai, unka department-wise average salary nikalo. Sirf woh departments dikhao jinki average salary 70,000 se zyada hai.
Select city,department,avg(salary) from employee where city='pune' and salary>60000 group by department having avg(salary) >70000;


-- Level 3 — Challenge

-- 11. Har department mein total employees aur average salary nikalo. Sirf woh departments dikhao
-- jahan employee count 2 se zyada aur average salary 60,000 se zyada hai.
Select department,count(*),avg(salary) from employee group by department having count(*)>2 and avg(salary)>60000;

-- 12. Sirf Pune aur Mumbai ke employees ko consider karo. Department-wise employee count nikalo
-- aur sirf woh departments dikhao jahan 3 ya zyada employees hain.
Select city,department,count(*) from employee where city='mumbai' and city='pune' group by department having count(*)>3;



CREATE TABLE restaurants (
		restaurant_id INT PRIMARY KEY,
        restaurant_name VARCHAR(100),
        city VARCHAR(50)
);

INSERT INTO restaurants (restaurant_id, restaurant_name, city)
VALUES
(1, 'Spice Villa', 'Mumbai'),
(2, 'Tandoori Tales', 'Delhi'),
(3, 'Burger House', 'Bangalore'),
(4, 'Pizza Palace', 'Pune'),
(5, 'The Curry Bowl', 'Mumbai'),
(6, 'Royal Biryani', 'Hyderabad'),
(7, 'Food Junction', 'Delhi'),
(8, 'Green Leaf', 'Bangalore'),
(9, 'Cafe Aroma', 'Pune'),
(10, 'Urban Tadka', 'Chandigarh'),
(11, 'Maharaja Restaurant', 'Jaipur'),
(12, 'Dosa Corner', 'Chennai'),
(13, 'Kolkata Kitchen', 'Kolkata'),
(14, 'Coastal Flavours', 'Mumbai'),
(15, 'Punjab Grill', 'Delhi'),
(16, 'South Spice', 'Chennai'),
(17, 'The Food Factory', 'Pune'),
(18, 'Nawab Kitchen', 'Lucknow'),
(19, 'Desi Dhaba', 'Jaipur'),
(20, 'Cafe Delight', 'Bangalore');

SELECT * FROM restaurants;

CREATE TABLE foods (
		food_id INT PRIMARY KEY,
        food_name VARCHAR(100),
        price INT,
        restaurant_id INT,
        FOREIGN KEY (restaurant_id)
        REFERENCES restaurants(restaurant_id)
        
);


INSERT INTO foods (food_id, food_name, price, restaurant_id)
VALUES
(1, 'Paneer Tikka', 250, 1),
(2, 'Butter Chicken', 350, 2),
(3, 'Veg Burger', 180, 3),
(4, 'Margherita Pizza', 299, 4),
(5, 'Paneer Butter Masala', 280, 5),
(6, 'Chicken Biryani', 320, 6),
(7, 'Veg Thali', 220, 7),
(8, 'Masala Dosa', 150, 8),
(9, 'Cold Coffee', 120, 9),
(10, 'Chole Bhature', 180, 10),
(11, 'Dal Baati Churma', 250, 11),
(12, 'Masala Dosa', 140, 12),
(13, 'Macher Jhol', 300, 13),
(14, 'Fish Curry', 380, 14),
(15, 'Chicken Tikka', 330, 15),
(16, 'Idli Sambar', 120, 16),
(17, 'Cheese Sandwich', 160, 17),
(18, 'Lucknowi Biryani', 350, 18),
(19, 'Aloo Paratha', 130, 19),
(20, 'Cappuccino', 150, 20);

SELECT * FROM foods;