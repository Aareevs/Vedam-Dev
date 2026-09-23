show databases;
 create database semB1;
 use semB1;
 create table cllg(id INT,name VARCHAR(50),age INT);
 show tables;
 INSERT into cllg(id,name,age)
 Values(1,"omg",25);
SELECT * FROM cllg;

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

-- NATURAL JOIN

-- 1. Use NATURAL JOIN to display the food name and restaurant name for all food items.
SELECT food_name, restaurant_name FROM foods NATURAL JOIN restaurants;

-- 2. Use NATURAL JOIN to display the food name, price, and restaurant name for all food items.
SELECT food_name, price, restaurant_name FROM foods NATURAL JOIN restaurants;

-- 3. Use NATURAL JOIN to display the restaurant name, city, and food name for every available food item.
SELECT restaurant_name, city, food_name FROM foods NATURAL JOIN restaurants;

-- 4. Use NATURAL JOIN to display the food ID, food name, price, and restaurant name for all food items.
SELECT food_id, food_name, price, restaurant_name FROM foods NATURAL JOIN restaurants;

-- 5. Use NATURAL JOIN to display the restaurant ID, restaurant name, food name, and price for every matching record.
SELECT restaurant_id, restaurant_name, food_name, price FROM foods NATURAL JOIN restaurants;


-- LEFT JOIN

-- 1. Use LEFT JOIN to display all restaurants and their food items. Restaurants without any food should also appear.
SELECT r.restaurant_name, f.food_name
FROM restaurants AS r
LEFT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id;

-- 2. Use LEFT JOIN to display the restaurant name, city, and food name for all restaurants.
SELECT r.restaurant_name, r.city, f.food_name
FROM restaurants AS r
LEFT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id;

-- 3. Use LEFT JOIN to display all restaurants and their food prices. If a restaurant has no food, it should still appear.
SELECT r.restaurant_name, f.price
FROM restaurants AS r
LEFT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id;

-- 4. Use LEFT JOIN to display all restaurants from Pune along with their available food items.
SELECT r.restaurant_name, f.food_name
FROM restaurants AS r
LEFT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id
WHERE r.city = 'Pune';

-- 5. Use LEFT JOIN to find the restaurants that do not have any food item listed.
SELECT r.restaurant_name
FROM restaurants AS r
LEFT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id
WHERE f.food_id IS NULL;


-- RIGHT JOIN

-- 1. Use RIGHT JOIN to display all food items and their corresponding restaurant names.
SELECT f.food_name, r.restaurant_name
FROM foods AS f
RIGHT JOIN restaurants AS r
ON f.restaurant_id = r.restaurant_id;

-- 2. Use RIGHT JOIN to display the food name, price, and restaurant name for all food records.
SELECT f.food_name, f.price, r.restaurant_name
FROM foods AS f
RIGHT JOIN restaurants AS r
ON f.restaurant_id = r.restaurant_id;

-- 3. Use RIGHT JOIN to display all food items along with the city of their restaurant.
SELECT f.food_name, r.city
FROM foods AS f
RIGHT JOIN restaurants AS r
ON f.restaurant_id = r.restaurant_id;

-- 4. Use RIGHT JOIN to display all food items and their restaurant details, including the restaurant ID.
SELECT f.food_name, r.restaurant_id, r.restaurant_name, r.city
FROM foods AS f
RIGHT JOIN restaurants AS r
ON f.restaurant_id = r.restaurant_id;

-- 5. Use RIGHT JOIN to make sure every food item is included in the result, even if its restaurant information is missing.
SELECT f.food_name, f.price, r.restaurant_name
FROM restaurants AS r
RIGHT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id;


-- INNER JOIN vs NATURAL JOIN

-- 1. Write an INNER JOIN query to display the food name and restaurant name. Then write the same query using NATURAL JOIN.
SELECT f.food_name, r.restaurant_name
FROM foods AS f
INNER JOIN restaurants AS r
ON f.restaurant_id = r.restaurant_id;

SELECT food_name, restaurant_name
FROM foods
NATURAL JOIN restaurants;

-- 2. Using INNER JOIN, display the food name, price, and restaurant name. Write the equivalent query using NATURAL JOIN.
SELECT f.food_name, f.price, r.restaurant_name
FROM foods AS f
INNER JOIN restaurants AS r
ON f.restaurant_id = r.restaurant_id;

SELECT food_name, price, restaurant_name
FROM foods
NATURAL JOIN restaurants;

-- 3. Write both INNER JOIN and NATURAL JOIN queries to display the restaurant name, city, and food name. Compare their results.
SELECT r.restaurant_name, r.city, f.food_name
FROM restaurants AS r
INNER JOIN foods AS f
ON r.restaurant_id = f.restaurant_id;

SELECT restaurant_name, city, food_name
FROM restaurants
NATURAL JOIN foods;

-- 4. Write an INNER JOIN query using an explicit ON condition to connect foods.restaurant_id with restaurants.restaurant_id. Then write the equivalent NATURAL JOIN query.
SELECT f.food_name, r.restaurant_name
FROM foods AS f
INNER JOIN restaurants AS r
ON f.restaurant_id = r.restaurant_id;

SELECT food_name, restaurant_name
FROM foods
NATURAL JOIN restaurants;

-- 5. Explain with SQL queries: What is the difference between INNER JOIN and NATURAL JOIN when both tables have restaurant_id as the common column?
SELECT f.food_name, r.restaurant_name
FROM foods AS f
INNER JOIN restaurants AS r
ON f.restaurant_id = r.restaurant_id;

SELECT food_name, restaurant_name
FROM foods
NATURAL JOIN restaurants;


-- FULL OUTER JOIN

-- 1. Using the FULL OUTER JOIN concept, display all restaurants and all food items, whether they have a match or not.
SELECT r.restaurant_name, f.food_name
FROM restaurants AS r
LEFT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id

UNION

SELECT r.restaurant_name, f.food_name
FROM restaurants AS r
RIGHT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id;

-- 2. Display the restaurant name and food name so that no restaurant or food record is missed.
SELECT r.restaurant_name, f.food_name
FROM restaurants AS r
LEFT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id

UNION

SELECT r.restaurant_name, f.food_name
FROM restaurants AS r
RIGHT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id;

-- 3. Find restaurants that do not have any matching food item, and food records that do not have any matching restaurant.
SELECT r.restaurant_name, f.food_name
FROM restaurants AS r
LEFT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id
WHERE f.food_id IS NULL

UNION

SELECT r.restaurant_name, f.food_name
FROM restaurants AS r
RIGHT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id
WHERE r.restaurant_id IS NULL;

-- 4. Display restaurant name, city, food name, and price, including unmatched records from both tables.
SELECT r.restaurant_name, r.city, f.food_name, f.price
FROM restaurants AS r
LEFT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id

UNION

SELECT r.restaurant_name, r.city, f.food_name, f.price
FROM restaurants AS r
RIGHT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id;

-- 5. Challenge: Simulate a FULL OUTER JOIN between restaurants and foods using LEFT JOIN, RIGHT JOIN, and UNION so that every record from both tables appears.
SELECT r.restaurant_id, r.restaurant_name, r.city, f.food_id, f.food_name, f.price
FROM restaurants AS r
LEFT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id

UNION

SELECT r.restaurant_id, r.restaurant_name, r.city, f.food_id, f.food_name, f.price
FROM restaurants AS r
RIGHT JOIN foods AS f
ON r.restaurant_id = f.restaurant_id;

