-- Daily Sales Trends and Alerts

WITH DailySales AS (
    SELECT 
        d.FullDateAlternateKey AS SalesDate,
        SUM(fs.SalesAmount) AS TotalSales
    FROM FactInternetSales fs
    LEFT JOIN DimDate d ON fs.OrderDateKey = d.DateKey
    GROUP BY d.FullDateAlternateKey
)
SELECT *,
    LAG(TotalSales, 1) OVER (ORDER BY SalesDate) AS PreviousDaySales,
    CASE 
        WHEN TotalSales < (LAG(TotalSales, 1) OVER (ORDER BY SalesDate) * 0.9) THEN 'Alert: Sales Drop'
        ELSE 'Normal'
    END AS SalesAlert
FROM DailySales
ORDER BY SalesDate DESC;
