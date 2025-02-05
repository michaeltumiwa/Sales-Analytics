-- Sales Performance Data Queries

SELECT 
    fs.SalesOrderNumber,
    fs.OrderDate,
    fs.DueDate,
    fs.ShipDate,
    fs.CustomerKey,
    fs.ProductKey,
    fs.SalesTerritoryKey,
    fs.TotalProductCost,
    fs.SalesAmount,
    fs.OrderQuantity,
    fs.TaxAmt,
    fs.Freight,
    p.EnglishProductName AS ProductName,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    t.SalesTerritoryRegion AS Region,
    d.CalendarYear,
    d.MonthNumberOfYear AS Month
FROM FactInternetSales fs
LEFT JOIN DimProduct p ON fs.ProductKey = p.ProductKey
LEFT JOIN DimCustomer c ON fs.CustomerKey = c.CustomerKey
LEFT JOIN DimSalesTerritory t ON fs.SalesTerritoryKey = t.SalesTerritoryKey
LEFT JOIN DimDate d ON fs.OrderDateKey = d.DateKey
ORDER BY fs.OrderDate DESC;
