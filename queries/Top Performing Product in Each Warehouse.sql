-- Top Performing Product in Each Warehouse

WITH product_revenue AS
(SELECT `Warehouse Location`,`Product Name`,
ROUND(SUM(Revenue),2) AS total_revenue,
ROW_NUMBER() OVER(PARTITION BY `Warehouse Location` ORDER BY SUM(Revenue) DESC) AS rnk

FROM inventory_data
GROUP BY `Warehouse Location`, `Product Name`)

SELECT
`Warehouse Location`,
`Product Name`,
total_revenue
FROM product_revenue
WHERE rnk = 1;
