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

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("TRUFF Hot Sauce", "Food", 18, 423);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Philips Smoke-less Indoor BBQ Grill", "Food", 250, 385);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("ThermoPro Wireless Digital Cooking Thermometer", "Cooking", 60, 52);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("OFM Essentials Leather Office Chair", "Furniture", 56, 731);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Louis Carpini G2 Violin Outfit 4/4 (Full) Size", "Musical Instruments", 600, 75);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Collapsible Dog Bowl", "Pet Supplies", 13, 261);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Tonka Toughest Mighty Dump Truck", "Toys & Games", 45, 154);

INSERT INTO products (product_name, department_name, price, stock_quantity)
VALUES ("Walk-A-Long Puppy Wooden Toy", "Toys & Games", 24, 456);

SELECT * FROM products;