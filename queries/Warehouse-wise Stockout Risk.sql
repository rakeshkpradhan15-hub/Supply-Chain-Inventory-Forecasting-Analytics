-- Warehouse-wise Stockout Risk

SELECT
`Warehouse Location`,
COUNT(*) AS Stockout_Count
FROM inventory_data
WHERE Stock_Status = 'Stockout Risk'
GROUP BY `Warehouse Location`
ORDER BY Stockout_Count DESC;