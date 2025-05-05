-- Question 1: Achieving 1NF (First Normal Form)
-- Achieving 1NF by separating the products into individual rows
SELECT OrderID, CustomerName, 'Laptop' AS Product
FROM ProductDetail
WHERE Products LIKE '%Laptop%'

UNION

SELECT OrderID, CustomerName, 'Mouse' AS Product
FROM ProductDetail
WHERE Products LIKE '%Mouse%'

UNION

SELECT OrderID, CustomerName, 'Tablet' AS Product
FROM ProductDetail
WHERE Products LIKE '%Tablet%'

UNION

SELECT OrderID, CustomerName, 'Keyboard' AS Product
FROM ProductDetail
WHERE Products LIKE '%Keyboard%'

UNION

SELECT OrderID, CustomerName, 'Phone' AS Product
FROM ProductDetail
WHERE Products LIKE '%Phone%';


-- Question 2: Achieving 2NF (Second Normal Form)
-- a. Create table to store orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

-- b. Create table for order details (products and quantities)
CREATE TABLE OrderProducts (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into OrderProducts table
INSERT INTO OrderProducts (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;

