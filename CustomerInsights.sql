-- Customer Insights Query

SELECT 
    fs.CustomerKey,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    c.Gender,
    c.YearlyIncome,
    c.TotalChildren,
    c.NumberChildrenAtHome,
    g.City,
    g.StateProvinceName,
    g.EnglishCountryRegionName,
    COUNT(fs.SalesOrderNumber) AS TotalPurchases,
    SUM(fs.SalesAmount) AS TotalSpent
FROM FactInternetSales fs
LEFT JOIN DimCustomer c ON fs.CustomerKey = c.CustomerKey
LEFT JOIN DimGeography g ON c.GeographyKey = g.GeographyKey
GROUP BY 
    fs.CustomerKey, c.FirstName, c.LastName, c.Gender, c.YearlyIncome, 
    c.TotalChildren, c.NumberChildrenAtHome, g.City, g.StateProvinceName, g.EnglishCountryRegionName
ORDER BY TotalSpent DESC;
