CREATE DATABASE IF NOT EXISTS ecommerce_sales;
USE ecommerce_sales;

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE NOT NULL,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Aarav Sharma', 'Indore', 'Madhya Pradesh'),
(2, 'Ananya Verma', 'Bhopal', 'Madhya Pradesh'),
(3, 'Rohan Patel', 'Ahmedabad', 'Gujarat'),
(4, 'Isha Singh', 'Delhi', 'Delhi'),
(5, 'Kabir Mehta', 'Mumbai', 'Maharashtra'),
(6, 'Meera Joshi', 'Pune', 'Maharashtra'),
(7, 'Aditya Rao', 'Bengaluru', 'Karnataka'),
(8, 'Sanya Kapoor', 'Jaipur', 'Rajasthan');

INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 65000.00),
(102, 'Smartphone', 'Electronics', 30000.00),
(103, 'Headphones', 'Accessories', 2500.00),
(104, 'Keyboard', 'Accessories', 1800.00),
(105, 'Office Chair', 'Furniture', 8500.00),
(106, 'Desk Lamp', 'Furniture', 2200.00),
(107, 'Monitor', 'Electronics', 15000.00),
(108, 'Mouse', 'Accessories', 900.00);

INSERT INTO sales VALUES
(1001, '2026-01-05', 1, 101, 1),
(1002, '2026-01-07', 2, 103, 2),
(1003, '2026-01-12', 3, 102, 1),
(1004, '2026-01-18', 4, 105, 1),
(1005, '2026-02-03', 5, 107, 2),
(1006, '2026-02-10', 6, 104, 3),
(1007, '2026-02-14', 7, 108, 4),
(1008, '2026-02-20', 8, 106, 2),
(1009, '2026-03-02', 1, 102, 1),
(1010, '2026-03-08', 2, 107, 1),
(1011, '2026-03-15', 3, 103, 3),
(1012, '2026-03-22', 5, 101, 1),
(1013, '2026-04-04', 4, 108, 5),
(1014, '2026-04-11', 6, 105, 2),
(1015, '2026-04-19', 7, 104, 2);
