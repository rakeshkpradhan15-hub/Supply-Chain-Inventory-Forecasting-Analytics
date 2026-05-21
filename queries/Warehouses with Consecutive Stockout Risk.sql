-- Detect Warehouses with Consecutive Stockout Risk

WITH stockout_analysis AS 
(SELECT `Warehouse Location`,Date,Stock_Status,
LAG(Stock_Status)OVER(PARTITION BY `Warehouse Location` ORDER BY Date) AS previous_status
FROM inventory_data)

SELECT *FROM stockout_analysis
WHERE Stock_Status = 'Stockout Risk'
AND previous_status = 'Stockout Risk';