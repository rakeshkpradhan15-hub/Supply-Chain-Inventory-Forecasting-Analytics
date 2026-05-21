-- Company-wise Holding Cost

SELECT
`Company Name`,
ROUND(SUM(Holding_Cost),2) AS Holding_Cost
FROM inventory_data
GROUP BY `Company Name`
ORDER BY Holding_Cost DESC;