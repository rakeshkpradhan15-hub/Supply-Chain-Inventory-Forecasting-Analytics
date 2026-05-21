-- Companies Forecast Accuracy

SELECT
`Company Name`,
ROUND(AVG(`Forecast_Accuracy_%`),2)
AS Forecast_Accuracy
FROM inventory_data
GROUP BY `Company Name`
ORDER BY Forecast_Accuracy DESC;