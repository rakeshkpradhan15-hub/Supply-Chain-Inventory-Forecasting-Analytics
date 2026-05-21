-- REVENUE BY CATEGORY 

SELECT
Category,
ROUND(SUM(Revenue),2) AS Revenue
FROM inventory_data
GROUP BY Category
ORDER BY Revenue DESC;