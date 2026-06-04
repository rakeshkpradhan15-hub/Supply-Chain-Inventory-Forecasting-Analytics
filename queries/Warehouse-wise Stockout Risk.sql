-- Warehouse-wise Stockout Risk
with cte as(
SELECT
`Warehouse Location`, `Product Name`,
COUNT(*) AS Stockout_Count
FROM inventory_data
WHERE Stock_Status = 'Stockout Risk'
GROUP BY `Warehouse Location`,`Product Name`
ORDER BY `Warehouse Location`,Stockout_Count DESC)

select *, SUM(Stockout_Count) 
OVER(PARTITION BY `Warehouse Location`) AS Total_Warehouse_Stockouts 
from cte
 
