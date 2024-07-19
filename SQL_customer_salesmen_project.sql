CREATE DATABASE company;
USE company;
-- Creating the salesmen table
CREATE TABLE salesmen (
    salesmen_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);

-- Creating the customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesmen_id INT,
    FOREIGN KEY (salesmen_id) REFERENCES salesmen(salesmen_id)
);

INSERT INTO salesmen (salesmen_id, name, city, commission) VALUES
(1, 'John Doe', 'New York', 0.15),
(2, 'Jane Smith', 'Los Angeles', 0.20),
(3, 'Jim Brown', 'Chicago', 0.18),
(4, 'Jake White', 'Houston', 0.17),
(5, 'Jill Green', 'Phoenix', 0.16),
(6, 'Jeff Black', 'Philadelphia', 0.19),
(7, 'Jen Blue', 'San Antonio', 0.14),
(8, 'Jerry Grey', 'San Diego', 0.21),
(9, 'Jasmine Yellow', 'Dallas', 0.22),
(10, 'Jason Red', 'San Jose', 0.23);


INSERT INTO customer (customer_id, customer_name, city, grade, salesmen_id) VALUES
(1, 'Alice', 'New York', 1, 1),
(2, 'Bob', 'Los Angeles', 2, 2),
(3, 'Charlie', 'Chicago', 3, 3),
(4, 'David', 'Houston', 4, 4),
(5, 'Eve', 'Phoenix', 5, 5),
(6, 'Frank', 'Philadelphia', 2, 6),
(7, 'Grace', 'San Antonio', 3, 7),
(8, 'Hank', 'San Diego', 1, 8),
(9, 'Ivy', 'Dallas', 2, 9),
(10, 'Jack', 'San Jose', 4, 10);



-- 1. Write a  SQL statement that displays all the information about all salespeople.
SELECT * FROM salesmen;

-- 2. From the following table, write a SQL query to find customers whose grade is 5. Return customer_id, cust_name, city, grade, salesman_id.  

SELECT * FROM customer
WHERE grade = 5 ;

-- 3 find customers who are from the city of New York or have a grade of over 1. Return customer_id, cust_name, city, grade, and salesman_id. 
SELECT * FROM customer
WHERE grade=1 AND city='New York';

-- 4 write a  SQL query to identify customers who do not belong to the city of 'New York' or have a grade value  1.
--  Return customer_id, cust_name, city, grade, and salesman_id.  

SELECT * FROM customer
WHERE NOT(city='New York' OR grade =1);

-- 5 write a  SQL query to retrieve the details of the customers whose names begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id..
SELECT * FROM customer
WHERE customer_name LIKE 'B%';

-- 6 write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.

SELECT customer.customer_name AS 'customer name',
		customer.city,
        salesmen.name AS 'salesmen name',
        salesmen.commission
FROM customer 
INNER JOIN salesmen 
ON customer.salesmen_id=salesmen.salesmen_id;

-- 7 write a SQL query to find salespeople who received commissions of more than 0.12 percent from the company.
--  Return Customer Name, customer city, Salesman, commission.
SELECT customer.customer_name,
		customer.city,
        salesmen.name AS 'Salesmen name',
        salesmen.commission
FROM customer
INNER JOIN salesmen
ON customer.salesmen_id=salesmen.salesmen_id
WHERE salesmen.commission >=0.12;

-- 8 Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.

SELECT customer.customer_name,
		customer.city,
		customer.grade, 
       salesmen.name AS "Salesman",
       salesmen.city 
FROM customer  
RIGHT OUTER JOIN salesmen  
ON salesmen.salesmen_id = customer.salesmen_id 
ORDER BY salesmen.salesmen_id; 


-- 9  Write a SQL query to combine each row of the salesman table with each row of the customer table.

SELECT * FROM  customer
JOIN salesmen ON customer.salesmen_id=salesmen.salesmen_id;



		