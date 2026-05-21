-- Warehouse Performance

SELECT `Warehouse Location`,
SUM(Revenue)AS Revenue,
ROUND(AVG(`Forecast_Accuracy_%`),2)AS Forecast_Accuracy
FROM inventory_data
GROUP BY `Warehouse Location`;