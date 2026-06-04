-- Detect Warehouses with Consecutive Stockout Risk

WITH stockout_analysis AS (SELECT`Warehouse Location`,Date,Stock_Status,
LAG(Date) OVER(PARTITION BY `Warehouse Location`ORDER BY Date) AS prev_date,
LAG(Stock_Status) OVER(PARTITION BY `Warehouse Location`ORDER BY Date) AS prev_status
FROM inventory_data)

SELECT *
FROM stockout_analysis
WHERE Stock_Status = 'Stockout Risk'
AND prev_status = 'Stockout Risk'
AND DATEDIFF(Date, prev_date) = 1;