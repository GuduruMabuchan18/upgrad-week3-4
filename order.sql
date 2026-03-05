USE store_db;
SELECT * FROM orders;
INSERT INTO archived_orders
SELECT *
FROM orders
WHERE order_status = 3
AND order_date < DATEADD(YEAR,-1,GETDATE());
SELECT * FROM archived_orders;
DELETE FROM archived_orders;
DELETE FROM archived_orders;
DELETE FROM orders
WHERE order_status = 3
AND order_date < DATEADD(YEAR,-1,GETDATE());
SELECT * FROM orders;