USE BikeStores;
GO
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES;
SELECT TOP 5 * 
FROM production.products;
SELECT * 
FROM production.categories;
SELECT
    p.product_name + ' (' + CAST(p.model_year AS VARCHAR) + ')' AS ProductDetails,
    p.list_price,
    (
        p.list_price -
        (
            SELECT AVG(p2.list_price)
            FROM production.products p2
            WHERE p2.category_id = p.category_id
        )
    ) AS PriceDifference
FROM production.products p
WHERE p.list_price >
(
    SELECT AVG(p2.list_price)
    FROM production.products p2
    WHERE p2.category_id = p.category_id
);