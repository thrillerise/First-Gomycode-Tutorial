INSERT INTO sales (product_name, category, quantity, price, sale_date) VALUES
('Laptop', 'Electronics', 5, 800.00, '2024-03-01'),
('Smartphone', 'Electronics', 10, 500.00, '2024-03-02'),
('Tablet', 'Electronics', 7, 300.00, '2024-03-05'),
('Headphones', 'Accessories', 20, 50.00, '2024-03-10'),
('Smartwatch', 'Accessories', 15, 150.00, '2024-03-12'),
('Desk Chair', 'Furniture', 8, 120.00, '2024-03-15'),
('Sofa', 'Furniture', 3, 700.00, '2024-03-18'),
('Laptop', 'Electronics', 4, 820.00, '2024-03-20'),
('Smartphone', 'Electronics', 6, 490.00, '2024-03-22'),
('Headphones', 'Accessories', 25, 55.00, '2024-03-25'),
('Smartwatch', 'Accessories', 12, 140.00, '2024-03-27'),
('Desk Chair', 'Furniture', 10, 110.00, '2024-03-29'),
('Sofa', 'Furniture', 5, 680.00, '2024-03-30');

--QUESTION 1
SELECT *
FROM sales;

--QUESTION 2
SELECT product_name, price
FROM sales;

--QUESTION 3
SELECT sale_id, product_name
FROM sales
WHERE price > 500.00;

--QUESTION 4
SELECT sale_id, product_name 
FROM sales
WHERE sale_date BETWEEN '2024-03-01' AND '2024-03-31';

--QUESTION 5
SELECT SUM(quantity)
FROM sales
WHERE category = 'Electronics';

--QUESTION 6
SELECT category, SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY category;

--QUESTION 8
SELECT category, AVG(quantity) AS total_quantity_sold
FROM sales
GROUP BY category;

--QUESTION 9
 b                                                                                                                                                                                                