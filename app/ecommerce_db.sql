use ecommerce_db;

-- Create the e-commerce database
CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

-- Create the Customer table
CREATE TABLE IF NOT EXISTS Customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL
);

-- Create the CustomerAccount table
CREATE TABLE IF NOT EXISTS CustomerAccount (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id) ON DELETE CASCADE
);

-- Create the Product table
CREATE TABLE IF NOT EXISTS Product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0 NOT NULL
);

-- Create the Order table
CREATE TABLE IF NOT EXISTS `Order` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    date DATETIME NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(id) ON DELETE CASCADE
);

-- Create the OrderItem table
CREATE TABLE IF NOT EXISTS OrderItem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(id) ON DELETE CASCADE
);
