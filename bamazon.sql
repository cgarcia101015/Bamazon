-- Drops the bamazon if it exists currently --
DROP DATABASE IF EXISTS bamazon;

CREATE DATABASE bamazon;


-- Makes is so all of the following code will affect bamazon --

USE bamazon;

CREATE TABLE products (
-- Makes a numeric column  named "id" which cannot contain null and auto increments with each new row --
item_id INTEGER NOT NULL auto_INCREMENT,
-- Makes a string column called "product_name" which cannot contain null --
product_name VARCHAR(50) NOT NULL,
-- Makes a string column called "department_name" which cannot contain null --
department_name VARCHAR(50) NOT NULL,
-- Makes a numeric column named "price" --
price INTEGER(6),
-- Makes a numeric column named "stock_quantity" --
stock_quantity INTEGER(6),
-- Sets the values in "id" as unique for each row
PRIMARY KEY (item_id)
);


-- Creates new rows containing data in all the names columns --
INSERT INTO products (item_id, product_name, department_name, price, stock_quantity)
VALUES (1, "Cannon EOS Rebel T6", "Electronics", 429, 176);


INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Bose QuietComfort 35 Wireless Headphones", "Electronics", 299, 1206);

SELECT *FROM products;