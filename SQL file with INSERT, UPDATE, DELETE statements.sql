-- =======================================
-- TASK 2 : DATA INSERTION & HANDLING NULLS (with COALESCE)
-- Continuation from Task 1
-- =======================================

USE ecommerce_db;

-- =======================================
-- 1️.INSERT ADDITIONAL DATA (INSERT INTO)
-- =======================================

-- Add more customers
INSERT INTO Customer (Name, Email, Phone, Address) VALUES
('Meena Sharma', 'meena@example.com', '9876501234', 'Hyderabad'),
('Vijay Nair', 'vijay@example.com', '9900112233', 'Chennai');

-- Add more products 
INSERT INTO Product (Name, Price, Stock) VALUES
('Monitor', 10000.00, 25),
('Mouse', 5000.00, 60);  

-- Add new orders
INSERT INTO Orders (Customer_ID, Order_Date, Total_Amount) VALUES
(4, '2025-10-21', 10600.00),
(5, '2025-10-22', NULL);  -- Amount pending (NULL handled later)

-- Add new order items
INSERT INTO Order_Item (Order_ID, Product_ID, Quantity, Price) VALUES
(3, 6, 1, 10000.00),
(3, 7, 1, 600.00),
(4, 7, 1, 600.00);

-- Add new payments (including NULL fields)
INSERT INTO Payment (Order_ID, Payment_Method, Payment_Date, Amount) VALUES
(3, 'Credit Card', '2025-10-21', 10600.00),
(4, NULL, NULL, NULL);  -- Pending payment (NULL handled later)

-- =======================================
-- 2️.HANDLE NULL VALUES
-- =======================================

-- Update product with NULL price once known
UPDATE Product
SET Price = 600.00
WHERE Name = 'Mouse' AND Price IS NULL;

-- Update order total where it was NULL
UPDATE Orders
SET Total_Amount = 600.00
WHERE Customer_ID = 5 AND Total_Amount IS NULL;

-- Show prices replacing NULL with default using COALESCE
SELECT 
    Product_ID,
    Name,
    COALESCE(Price, 0.00) AS DisplayPrice,  -- 0 shown if NULL
    Stock
FROM Product;

-- Show orders where Total_Amount is NULL → display “Pending”
SELECT 
    Order_ID,
    Customer_ID,
    COALESCE(CAST(Total_Amount AS CHAR), 'Pending') AS Total_Status
FROM Orders;

-- =======================================
-- 3️.UPDATE EXAMPLES (WITH WHERE)
-- =======================================

-- Update a customer phone number
UPDATE Customer
SET Phone = '9123456780'
WHERE customer_id=1;

-- Reduce stock after a sale
SET SQL_SAFE_UPDATES = 0;  -- Safe update mode prevents updates that might affect multiple rows unintentionally.

UPDATE Product
SET Stock = Stock - 1
WHERE Name = 'Monitor';

SET SQL_SAFE_UPDATES = 1;

-- =======================================
-- 4️.DELETE EXAMPLES (WITH WHERE)
-- =======================================

-- Delete an order item entered by mistake
DELETE FROM Order_Item
WHERE OrderItem_ID = 6;

-- Delete a payment record with NULL amount

DELETE FROM Payment
WHERE Amount IS NULL and payment_id =4;

-- =======================================
-- 5️.VERIFY FINAL DATA
-- =======================================
SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Orders;
SELECT * FROM Order_Item;
SELECT * FROM Payment;

