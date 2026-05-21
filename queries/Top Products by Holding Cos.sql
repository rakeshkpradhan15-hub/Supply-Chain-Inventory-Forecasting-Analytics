-- Top Products by Holding Cost

SELECT
`Product Name`,
ROUND(SUM(Holding_Cost),2)
AS Holding_Cost
FROM inventory_data
GROUP BY `Product Name`
ORDER BY Holding_Cost DESC
LIMIT 10;