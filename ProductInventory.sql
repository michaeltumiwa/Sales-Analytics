-- Product Inventory Data

SELECT 
    pi.ProductKey,
    p.EnglishProductName AS ProductName,
    pi.MovementDate,
    pi.UnitCost,
    pi.UnitsIn,
    pi.UnitsOut,
    pi.UnitsBalance,
    d.CalendarYear,
    d.MonthNumberOfYear AS Month
FROM FactProductInventory pi
LEFT JOIN DimProduct p ON pi.ProductKey = p.ProductKey
LEFT JOIN DimDate d ON pi.DateKey = d.DateKey
ORDER BY pi.MovementDate DESC;
