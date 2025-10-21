# SQL-Internship-Task2

This task focuses on data insertion, handling NULL values, and basic SQL operations in an E-commerce Database (ecommerce_db).
It is a continuation of Task 1, where the tables (Customer, Product, Orders, Order_Item, and Payment) were already created.

🛠️ Key Operations

Inserting new customer, product, order, and payment records.

Handling missing (NULL) values using COALESCE.

Updating existing data (e.g., phone numbers, prices, stock).

Deleting incorrect or NULL records.

Verifying final data using SELECT queries.

🛠️ SQL Concepts Used

1. INSERT INTO

Adding new records to all main tables such as Customer, Product, Orders, Order_Item, and Payment.

2. Handling NULLs with COALESCE

Replace NULL values with default values (e.g., 0.00 or 'Pending').

Example:

SELECT COALESCE(Price, 0.00) AS DisplayPrice FROM Product;

3. UPDATE Statements

Modify existing data like:

Updating phone numbers.

Adjusting stock levels.

Filling in missing prices or totals.

4. DELETE Statements

Remove unwanted or incorrect records using conditions (WHERE).

5. Data Verification

Final SELECT queries to verify all changes across tables.
