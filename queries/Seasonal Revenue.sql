-- Seasonal Revenue

SELECT
Season,
ROUND(SUM(Revenue),2) AS Revenue
FROM inventory_data
GROUP BY Season
order by Revenue desc
