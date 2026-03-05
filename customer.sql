USE BikeStores;
GO
SELECT DB_NAME() AS CurrentDatabase;
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'customers';
SELECT TOP 5 * FROM sales.customers;
SELECT COUNT(*) AS TotalOrders FROM sales.orders;
SELECT COUNT(*) AS TotalOrderItems FROM sales.order_items;
SELECT
    c.first_name + ' ' + c.last_name AS FullName,
    ISNULL(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 0) AS TotalOrderValue,
    CASE
        WHEN ISNULL(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 0) > 10000 THEN 'Premium'
        WHEN ISNULL(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 0) BETWEEN 5000 AND 10000 THEN 'Regular'
        ELSE 'Basic'
    END AS CustomerType
FROM sales.customers c
LEFT JOIN sales.orders o
    ON c.customer_id = o.customer_id
LEFT JOIN sales.order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.first_name, c.last_name;