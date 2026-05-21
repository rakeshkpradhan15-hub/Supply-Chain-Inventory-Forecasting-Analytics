-- Products with Lowest Forecast Accuracy

WITH accuracy_analysis AS (

SELECT
`Product Name`,
ROUND(AVG(`Forecast_Accuracy_%`),2)
AS avg_accuracy,
DENSE_RANK() OVER(ORDER BY AVG(`Forecast_Accuracy_%`)) AS low_accuracy_rank
FROM inventory_data
GROUP BY `Product Name`)

SELECT *
FROM accuracy_analysis
WHERE low_accuracy_rank <= 10;