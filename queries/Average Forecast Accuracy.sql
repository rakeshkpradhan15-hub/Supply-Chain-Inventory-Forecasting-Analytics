-- Average Forecast Accuracy


SELECT 
ROUND(AVG(`Forecast_Accuracy_%`), 2) AS Avg_Forecast_Accuracy
FROM inventory_data;