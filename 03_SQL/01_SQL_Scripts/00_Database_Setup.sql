CREATE DATABASE manufacturing_inventory_db;
USE manufacturing_inventory_db;
SELECT * FROM products;
RENAME TABLE `raw raw_materials`
TO raw_materials;
SELECT * FROM raw_materials;
SELECT * FROM suppliers;
SELECT * FROM bill_of_materials;
SELECT * FROM purchase_transactions;
SELECT * FROM production_transactions;
SELECT * FROM inventory_transactions;
SELECT * FROM products;
SHOW COLUMNS FROM products;
ALTER TABLE products
CHANGE COLUMN `ï»¿Product_ID` Product_ID TEXT;
SHOW COLUMNS FROM products;
SELECT Product_ID,
       Product_Name,
       Unit_Price
FROM products;
SHOW COLUMNS FROM raw_materials;
ALTER TABLE raw_materials
CHANGE COLUMN `ï»¿Material_ID` Material_ID TEXT;
SHOW COLUMNS FROM raw_materials;
ALTER TABLE suppliers
CHANGE COLUMN `ï»¿Supplier_ID` Supplier_ID TEXT;
SHOW COLUMNS FROM bill_of_materials;
ALTER TABLE bill_of_materials
CHANGE COLUMN `ï»¿BOM_ID` BOM_ID TEXT;
SHOW COLUMNS FROM bill_of_materials;
SHOW COLUMNS FROM purchase_transactions;
ALTER TABLE purchase_transactions
CHANGE COLUMN `ï»¿Purchase_ID` Purchase_ID TEXT;
SHOW COLUMNS FROM purchase_transactions;
SHOW COLUMNS FROM production_transactions;
ALTER TABLE production_transactions
CHANGE COLUMN `ï»¿Production_ID` Production_ID TEXT;
SHOW COLUMNS FROM production_transactions;
SHOW COLUMNS FROM inventory_transactions;
ALTER TABLE inventory_transactions
CHANGE COLUMN `ï»¿Inventory_Transaction_ID` Inventory_Transaction_ID TEXT;
SHOW COLUMNS FROM inventory_transactions;
SELECT * FROM products;
SELECT Product_ID, Product_Name, Unit_Price FROM products;
SELECT Product_Name FROM products;
SELECT Product_Name, Unit_Price FROM products;
SELECT product_name, product_category, unit_price FROM products;
SELECT * FROM products;
SELECT product_name, unit_price FROM products WHERE Unit_Price > 3000;
SELECT product_name, product_category FROM products WHERE Product_Category = 'Wall Fan';
SELECT product_name, product_status FROM products WHERE Product_Status = 'active';
SELECT product_name, unit_price FROM products WHERE Unit_Price >= 3000;
SELECT product_name, unit_price FROM products WHERE Unit_Price < 2500;
SELECT product_name, product_status FROM products WHERE Product_Status != 'active';
SELECT product_name, reorder_level FROM products WHERE Reorder_Level <= 50;
SELECT product_name, product_status FROM products;
SELECT product_name, unit_price FROM products ORDER BY Unit_Price ASC;
SELECT DISTINCT product_status FROM products;
SELECT product_name, unit_price FROM products LIMIT 5;
SELECT * FROM products LIMIT 10;
SELECT product_name, unit_price FROM products ORDER BY unit_price DESC LIMIT 3;
SELECT COUNT(*) FROM products;
SELECT COUNT(product_category) FROM products;
SELECT AVG(unit_price) FROM products;
SELECT MIN(unit_price) FROM products;
SELECT MAX(unit_price) FROM products;
SELECT product_category, COUNT(*) FROM products GROUP BY Product_Category;
SELECT product_category, SUM(Unit_Price) AS total_price FROM products GROUP BY product_category;
SELECT product_category, AVG(unit_price) AS average_price FROM products GROUP BY product_category;
SELECT product_category, MIN(unit_price) AS lowest_price FROM products GROUP BY product_category;
SELECT product_category, MAX(unit_price) AS highest_price FROM products GROUP BY product_category;
SELECT product_category, COUNT(*) AS total_products FROM products GROUP BY product_category HAVING COUNT(*) > 1;
SELECT product_category, COUNT(*) AS total_products FROM products WHERE Unit_Price > 1000 GROUP BY Product_Category;
SELECT product_category, COUNT(*) AS total_products FROM products GROUP BY Product_Category ORDER BY total_products DESC;
SELECT Product_Name, product_category, unit_price FROM products WHERE product_category = 'geyser' AND Unit_Price > 2000;
SELECT DISTINCT product_category FROM products;
SELECT product_name, product_category, unit_price FROM products WHERE product_category = 'geyser' OR Unit_Price > 7000;
SELECT product_name, product_category, unit_price FROM products WHERE (product_category = 'geyser' OR Product_Category = 'heater') AND Unit_Price > 3000;
SELECT product_name, product_category, unit_price FROM products WHERE Product_Category IN ( 'geyser' , 'heater');
SELECT product_name, product_category, unit_price FROM products WHERE product_category NOT IN ('geyser' , 'heater');
SELECT product_name, product_category, unit_price FROM products WHERE Unit_Price BETWEEN 2000 AND 5000;
SELECT product_name, product_category FROM products WHERE product_name LIKE '%fan%';
SELECT product_name, product_category FROM products WHERE product_name LIKE '%fan';
SELECT product_name FROM products;
SELECT * FROM products WHERE product_name IS NULL;
SELECT * FROM products WHERE product_name IS NOT NULL;
SELECT product_name AS product, product_category AS category, unit_price AS price FROM products;
SELECT product_name, unit_price, unit_price * 1.18 AS price_with_gst FROM products;
SELECT product_name, unit_price, unit_price + 500 AS discount_price FROM products;
SELECT product_name, unit_price, unit_price % 1000 AS remainder FROM products;
SELECT product_name, unit_price FROM products WHERE Unit_Price >= 2500 ORDER BY unit_price DESC;
SELECT Product_Name,
       Product_Category,
       Unit_Price
FROM products
WHERE Product_Category = 'Wall Fan'
ORDER BY Unit_Price ASC;
SELECT DISTINCT Product_Category
FROM products;
SELECT Product_Name,
       Product_Category,
       Unit_Price
FROM products
WHERE Product_Category = 'Farrata Fan'
ORDER BY Unit_Price ASC;
SELECT product_name, product_category, unit_price FROM products WHERE Product_Category = 'farrata fan' AND Unit_Price >= 2500;
SELECT product_name, product_category, unit_price FROM products WHERE Product_Category = 'farrata fan' OR Unit_Price >= 2500;
SELECT product_name, product_category, unit_price FROM products WHERE Unit_Price BETWEEN 2000 AND 3000;
SELECT product_name, product_category FROM products WHERE Product_Name LIKE '%fan%';
SELECT product_name, unit_price FROM products ORDER BY Unit_Price DESC LIMIT 5;
SELECT p.product_name, pt.Produced_Quantity FROM products p INNER JOIN production_transactions pt ON p.product_ID = pt.product_ID;
DESCRIBE production_transactions;
SELECT COUNT(*) AS total_rows FROM products p INNER JOIN production_transactions pt ON p.Product_ID = pt.Product_ID;
SELECT 
	p.product_name, 
    sum(pt.Produced_Quantity) AS total_production 
    FROM products p 
    INNER JOIN production_transactions pt 
    ON p.product_id = pt.product_id 
    GROUP BY p.Product_Name 
    ORDER BY total_production DESC;
    SELECT
        p.product_name, 
		pt.produced_quantity
	FROM products p
    LEFT JOIN production_transactions pt
    ON p.Product_ID = pt.Product_ID;
    SELECT COUNT(*) AS total_row FROM products p LEFT JOIN production_transactions pt ON p.product_id = pt.product_id;
    SELECT p.product_name, pt.produced_quantity FROM products p RIGHT JOIN production_transactions pt ON p.Product_ID = pt.Product_ID;
    SELECT count(*) AS total_row FROM products p RIGHT JOIN production_transactions pt ON p.Product_ID = pt.Product_ID;
    SELECT 
		p.product_name,
        s.supplier_name,
        pt.purchase_quantity
    FROM purchase_transactions pt
    INNER JOIN products p
	ON pt.product_id = p.product_id
    INNER JOIN suppliers s
    ON pt.Supplier_ID = s.Supplier_ID;
DESC raw_materials;    
SELECT 
    rm.material_name,
    s.supplier_name,
    pt. purchase_quantity
FROM purchase_transactions pt
INNER JOIN raw_materials rm
ON pt.Material_ID = rm.Material_ID
INNER JOIN suppliers s 
ON pt.Supplier_ID = s.Supplier_ID;    
SELECT count(*) AS total_row FROM purchase_transactions pt INNER JOIN raw_materials rm ON pt.Material_ID = rm.Material_ID INNER JOIN suppliers s ON pt.Supplier_ID = s.Supplier_ID;
SELECT 
    CASE 
       WHEN purchase_quantity >= 1000 THEN 'high purchase'
       WHEN purchase_quantity >= 500 THEN 'medium purchase'
       ELSE 'low purchase'
END AS purchase_category, 
COUNT(*) AS total_transactions
FROM purchase_transactions
GROUP BY 
    CASE 
       WHEN Purchase_Quantity >= 1000 THEN 'high purchase'
       WHEN Purchase_Quantity >= 500 THEN 'medium purchase'
       ELSE 'low purchase' 
END;       
SELECT 
	CASE 
       WHEN purchase_quantity >= 1000 THEN 'high purchase'
       WHEN purchase_quantity >= 500 THEN 'medium purchase'
       ELSE 'low purchase'
END AS purchase_category,
COUNT(*) AS total_transactions,
SUM(purchase_quantity * unit_cost) AS total_purchase_cost
FROM purchase_transactions
GROUP BY 
    CASE 
       WHEN purchase_quantity >= 1000 THEN 'high purchase'
       WHEN purchase_quantity >= 500 THEN 'medium purchase'
       ELSE 'low purchase'
END;
      
       
       