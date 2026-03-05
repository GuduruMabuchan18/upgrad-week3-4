USE BikeStores;
GO
SELECT
    o.store_id,
    oi.product_id,
    SUM(oi.quantity) AS total_qty_sold
FROM sales.orders o
JOIN sales.order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.store_id, oi.product_id;
SELECT order_id, store_id
FROM sales.orders
WHERE store_id IS NULL;
SELECT store_id, store_name
FROM sales.stores;
UPDATE sales.orders
SET store_id = 1
WHERE order_id = 1;
SELECT
    o.store_id,
    oi.product_id,
    SUM(oi.quantity) AS total_qty_sold
FROM sales.orders o
JOIN sales.order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.store_id, oi.product_id;