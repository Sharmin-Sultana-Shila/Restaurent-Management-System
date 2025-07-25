CREATE DATABASE Restaurent_Management_System;
USE Restaurent_Management_System;

CREATE TABLE Customer(
	Customer_ID INTEGER PRIMARY KEY,
	Customer_Name VARCHAR(50) NOT NULL,
    City VARCHAR(15) ,
    Contact_No VARCHAR(50)
);
CREATE TABLE Table_Number(
	Table_ID INTEGER PRIMARY KEY,
    Capacity INTEGER
);
CREATE TABLE Reserve_Table(
	Reserve_ID INTEGER PRIMARY KEY,
	Table_ID INTEGER,
    Customer_ID INTEGER,
    Is_Available VARCHAR(10) ,
    FOREIGN KEY(Table_ID) REFERENCES Table_Number(Table_ID),
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID) 
);
CREATE TABLE Item_List(
	Item_ID INTEGER  PRIMARY KEY,
    Item_Type  VARCHAR(30)
);
CREATE TABLE Food(
	Item_ID INTEGER,
	Food_ID INTEGER ,
    Food_Name VARCHAR(50) ,
    Food_Size  VARCHAR(15),
	Food_Quantity INTEGER,
    Price DOUBLE(6,2),
    PRIMARY KEY(Food_ID,Food_Name),
    FOREIGN KEY(Item_ID) REFERENCES Item_List(Item_ID)
);
CREATE TABLE Item_price(
	Exchangable_Item  VARCHAR(20) PRIMARY KEY,
	Price DOUBLE(6,2)
);
-- kono particular food ki item dara replacable 
CREATE TABLE IsExchangble(
	Food_ID INTEGER,
    Exchangable_Item  VARCHAR(20),
    Quantity_Of_Item INTEGER ,
    FOREIGN KEY(Food_ID) REFERENCES Food(Food_ID) ,
    FOREIGN KEY(Exchangable_Item) REFERENCES Item_price(Exchangable_Item) 
);


CREATE TABLE Customer_Order(
	Order_ID INTEGER PRIMARY KEY,
    Customer_ID INTEGER,
    Item_ID INTEGER,
    Food_ID INTEGER,
    Quantity INTEGER ,
    FOREIGN KEY(Item_ID) REFERENCES Item_List(Item_ID) ,
    FOREIGN KEY(Food_ID) REFERENCES Food(Food_ID) ,
    FOREIGN KEY(Customer_ID) REFERENCES Customer(Customer_ID) 
);
CREATE TABLE Bill(
	Payment_ID INTEGER 	PRIMARY KEY,
	Order_ID INTEGER,
	Method VARCHAR(50),
    FOREIGN KEY(Order_ID) REFERENCES Customer_Order(Order_ID) 
);
 CREATE TABLE Waiters(
	Waiter_ID INTEGER PRIMARY KEY,
    Waiter_Name VARCHAR(30) NOT NULL,
    Age INTEGER,
    Salary INTEGER,
    FOREIGN KEY(Waiter_ID) REFERENCES Table_Number(Table_ID)
 );
 
INSERT INTO Customer VALUES
(523, "Uday","Dhaka", "017xxx41"),
(524, "Don","Dhaka", "017xxx88"),
(526, "Eve","Bogura", "013xxx76"),
(527, "Jesus","Dhaka", "017xxx38"),
(525, "Lia","Dhaka", "016xxx09"),
(529, "Diya","Jassore", "017xxx45"),
(531, "Raj","Jassore", "017xxx87"),
(532, "Shawon","Dhaka", "0177xx44"),
(533, "Pavel","Jassore", "017xxx47"),
(534, "Sumaya","Noakhali", "016xxx40"),
(535, "Saifa","Rajshahi", "017xxx64"),
(536, "Mohua","Dhaka", "013xxx55"),
(537, "Junaid","Dhaka", "013xxx55"),
(538, "Uday","Dhaka", "013xxx55"),
(539, "Hafsa","Sylhet", "013xxx55"),
(540, "Arpa","Dhaka", "013xxx55"),
(541, "Shad","Dhaka", "013xxx55"),
(542, "Joti","Dhaka", "013xxx75"),
(543, "Arshan","Natore", "016xxx55"),
(544, "Shad","Dhaka", "019xxx55"),
(545, "Joti","Dhaka", "019xxx15");

INSERT INTO Table_Number VALUES
(01,4),(02,8),(03,2),(04,1),(05,2),(06,8),(07,4),(08,4),(09,16),(10,16),
(11,2),(12,8),(13,2),(14,16),(15,3),(16,5),(17,10),(18,1),(19,2),(20,3);

INSERT INTO Reserve_Table VALUES
(9826, 08, 537,"False"),
(9827, 05, 539,"False"), 
(9828, 18, 523,"False"), 
(9829, 01, 525,"False"), 
(9830, 20, 537,"False"),
(9837, 06, 543,"False"),
(9838, 19, 542,"False"),
(9839, 02, 541,"False"),
(9831, 04, 532,"False"),
(9832, 14, 531,"False"),
(9833, 17, 538,"False"),
(9834, 11, 544,"False"),
(9835, 07, 545,"False"),
(9836, 13, 540,"False");

INSERT INTO Item_List VALUES
(01, 'Starter'),(02, 'Appetizer'),(03,'Main Course'),(04,'Beverage'),(05, 'Salad'), (06, 'Soup'),(07,'Dessert'),(08, 'Pizza'),
(09, 'Pasta'),(10,'Chicken'), (11, 'Grill'),(12, 'Burger'),(13,'Platter'),(14, 'Seafood'),(15, 'Vegan'), (16, 'Juices'),(17,'Fries');

INSERT INTO Food VALUES
 -- Starter
(01, 101, 'Spring Rolls', 'Small', 50, 120.00),
(01, 102, 'Chicken Wings', 'Medium', 40, 150.00),
(01, 103, 'Welcome Drink', 'Small', 1, 70.00),
-- Appetizer
(02, 104, 'Mozzarella Sticks', 'Small', 50, 220.00),
(02, 105, 'Stuffed Mushrooms', 'Medium', 35, 240.00),
-- Main Course
(03, 106, 'Beef Curry', 'Large', 30, 350.00),
(03, 107, 'Veg Biryani', 'Medium', 20, 280.00),
-- Beverage
(04, 108, 'Iced Tea', 'Large', 40, 100.00),
(04, 109, 'Latte', 'Medium', 30, 150.00),
-- Salad
(05, 110, 'Greek Salad', 'Large', 15, 220.00),
(05, 111, 'Fruit Salad', 'Small', 20, 180.00),
-- Soup
(06, 112, 'Chicken Soup', 'Medium', 25, 160.00),
(06, 113, 'Minestrone Soup', 'Large', 18, 190.00),
-- Dessert
(07, 114, 'Cheesecake', 'Medium', 25, 250.00),
(07, 115, 'Chocolate Brownie', 'Small', 35, 200.00),
-- Pizza
(08, 116,'Margherita Pizza', 'Large', 20, 400.00),
(08, 117, 'BBQ Chicken Pizza', 'Medium', 25, 450.00),
-- Pasta
(09, 118, 'Spaghetti Bolognese', 'Medium', 30, 300.00),
(09, 119, 'Fettuccine Alfredo', 'Large', 20, 350.00),
-- Chicken 
(10, 120, 'Chicken Pop', 'Medium', 30, 300.00),
(10, 121, 'Chicken Fry', 'Large', 20, 350.00),
-- Grill
(11, 122, 'Grilled Lamb Chops', 'Large', 15, 600.00),
(11, 123, 'Grilled Salmon', 'Medium', 18, 550.00);

INSERT INTO Item_price VALUES
('Chicken',120.00),('Mushroom',70.00),('Vegetable',60.00),('Shrimp',150.00),('Mutton',350.00);

INSERT INTO IsExchangble VALUES
(107,'Chicken',10),(107,'Mutton',15),(112, 'Mushroom', 20),(117, 'Mushroom', 20),(117,'Chicken',10),(101,'Shrimp',40), (107,"Vegetable",20);
 
INSERT INTO Customer_Order VALUES
 (400, 523, 03,107,2),
 (401, 523, 11, 122,3 ),
 (402, 534, 06, 112, 2),
 (403, 534,08, 117, 1),
 (404,531, 01, 102, 8 ),
 (405,531, 01, 102, 8 ),
 (406, 523,01, 103,3),
 (407, 524,11, 123,8),
 (408, 529,08, 116,4),
 (409, 533,05, 110,2),
 (410, 539,07, 114,2), 
 (411, 537,05, 110,2),
 (412, 537,06, 112,2),
 (413, 537,01, 102,2),
 (414, 532,09, 119,1),
 (415, 532,07, 114,2), 
 (416, 538,01, 103,2),
 (417, 534,11, 123,2),
 (418,534, 11, 123, 2),
 (419, 536,09, 119,1);
 
 INSERT INTO Bill VALUES
(01, 402, 'Cash'),
(02, 403,'Card'),
(03, 404, 'Online'),
(04, 405, 'Cash'),
(05, 406 , 'Card'),
(06, 407, 'Cash'),
(07, 408, 'Online'),
(08, 409, 'Card'),
(09, 410, 'Cash'),
(10, 411, 'Card'),
(11, 412, 'Cash'),
(12, 413, 'Card'),
(13, 414 , 'Online'),
(14, 415, 'Cash'),
(15, 416, 'Card');
 
 INSERT INTO Waiters VALUES
(01,"John", 23, 12000),
(02,"Eve", 21, 12500),
(03,"Don", 25, 12000),
(04,"Donald", 18, 15000),
(05,"Mave", 19, 14000),
(06,"Jesus", 23, 12000),
(07,"Shila", 19, 12000),
(08,"Sharmin", 24, 12500),
(09,"Sultana", 17, 13000),
(10,"Priya", 20, 12000),
(11,"Ahmed", 22, 17000),
(12,"Mubarok", 25, 15000),
(13,"John", 19, 13000),
(14,"Don", 18, 13500) ;
 
SET SQL_SAFE_UPDATES = 0;
 -- Queries =>
 -- Easy
--  1. Find the waiters details whose name starts with 'Don'.
SELECT * FROM Waiters WHERE Waiter_Name LIKE "Don%";

--  2. Find the food list of menu 11.
SELECT * FROM Food WHERE  Item_ID = 11;

--  3. Find the Waiter details whose age is between 20-23.
SELECT * FROM Waiters WHERE Age BETWEEN 20 AND 23 ;

--  4. Find the cities that customer belongs from.
SELECT DISTINCT City AS City_Of_Customers FROM Customer LIMIT 5;

--  5. Select the total number of tables in that restaurent .
SELECT COUNT(Table_ID) AS Number_Of_Tables FROM Table_Number where Capacity >= 08;

--  6. Annual salary of the Waiters.
SELECT Waiter_ID,Waiter_Name,12*Salary AS Annual_Salary FROM Waiters ;

 -- Moderate
--  7. Concatenate the list of food and name corressponding to their price.
SELECT CONCAT(Food_ID, " - ",Food_name, " = ", Price) AS Details_Of_Dish FROM Food;

--  8. Change the name of "Bill" Table.
ALTER TABLE Bill RENAME TO Payment;
SELECT * FROM Payment;

-- 9.Add a new column in existing table "Payment".
ALTER TABLE Payment ADD (Total_Bill DOUBLE(6,2));
SELECT * FROM Payment;

-- 10. Make a reserved seat availabe for other customers.
UPDATE Reserve_Table SET Is_Availabe = "True";

-- 11. Find the waiter details of table no 05..
SELECT * FROM Waiters WHERE Waiter_ID IN (SELECT Table_ID FROM Table_Number WHERE Table_ID = 05  );

-- 12.  Find availabe seats in that Restaurant.
SELECT Table_ID, Capacity FROM Table_Number WHERE Table_ID Not IN( SELECT Table_ID FROM Reserve_Table );

--  13. Show the list of food names in descending order.
SELECT Food_ID,Food_Name,Price FROM Food Order By Food_name DESC;

--  14.  Change the column name of Food Table.
ALTER TABLE Food CHANGE COLUMN Food_Size Size VARCHAR(15) NOT NULL ;
SELECT * FROM Food;

-- Hard
 -- 15. Count the number of customers from each city.
SELECT City, COUNT(Customer_ID) As No_Of_Customers FROM Customer GROUP BY City; 

--  16.  Show the list of foods that are exchangable by other items.
SELECT F.Food_ID,F.Food_Name, E.Exchangable_Item FROM Food as F, IsExchangble as E WHERE F.Food_ID = E.Food_ID ;

--   akta order korlo, abr arekta order korlo, akbar cash e dilo, arekbar card e dilo, total bill corresponding order_ID, not customer ID.
--  17. Fill up the Total_Bill column of Payment table according to the customers order.
UPDATE Payment P
JOIN Customer_Order CO ON P.Order_ID = CO.Order_ID
JOIN Food F ON CO.Food_ID = F.Food_ID
SET P.Total_Bill = CO.Quantity * F.Price;
SELECT * FROM Payment;

--  18. Replace vegetable from "Veg Biryani" by Mutton.
SELECT 
    F.Food_Name,
    F.Price AS Original_Price,
    IP1.Price AS Old_Ingredient_Price,
    IP2.Price AS New_Ingredient_Price,
    (F.Price - IP1.Price + IP2.Price) AS Total_Price
FROM Food AS F
-- ei join ta isexchangble er table er oi row ke find kore jekhane find abong exchangable id mile jay abong item ta vegetable. 
JOIN IsExchangble E1 ON F.Food_ID = E1.Food_ID AND E1.Exchangable_Item = 'Vegetable'
JOIN IsExchangble E2 ON F.Food_ID = E2.Food_ID AND E2.Exchangable_Item = 'Mutton'
JOIN Item_Price IP1 ON E1.Exchangable_Item = IP1.Exchangable_Item
JOIN Item_Price IP2 ON E2.Exchangable_Item = IP2.Exchangable_Item
WHERE F.Food_Name = 'Veg Biryani';

-- protita customer er total khoroch
--  19. count the number of customers who purchased more than 1000BDT in each city in ascending order.
SELECT C.Customer_ID, C.Customer_Name, C.City, SUM(O.Quantity * F.Price) AS Total_Spent
FROM Customer C
JOIN Customer_Order O ON C.Customer_ID = O.Customer_ID
JOIN Food F ON O.Food_ID = F.Food_ID
GROUP BY C.Customer_ID, C.Customer_Name, C.City HAVING SUM(O.Quantity * F.Price) > 1000;

--  20. Show the top 5 most famous selling item in this restaurant.
SELECT F.Item_ID, F.Food_ID, F.Food_Name, SUM(O.Quantity) AS Total_Quantity_Sold
FROM Food F
JOIN Customer_Order O ON F.Food_ID = O.Food_ID
GROUP BY F.Food_ID, F.Food_Name ORDER BY Total_Quantity_Sold DESC LIMIT 5;


 
 
    
    
    
    
