-- Overstock Products COunt

SELECT
`Product Name`,
COUNT(*) AS Overstock_Count
FROM inventory_data
WHERE Stock_Status = 'Overstock'
GROUP BY `Product Name`
ORDER BY Overstock_Count DESC;