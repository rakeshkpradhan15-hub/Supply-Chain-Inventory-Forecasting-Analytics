-- Monthly Demand Trend 

SELECT
Month,
SUM(Forecast_Demand) AS Forecast_Demand,
SUM(Actual_Demand) AS Actual_Demand
FROM inventory_data
GROUP BY Month;