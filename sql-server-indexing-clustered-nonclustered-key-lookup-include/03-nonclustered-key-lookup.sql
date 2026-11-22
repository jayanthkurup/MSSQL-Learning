/* 03-nonclustered-key-lookup.sql
   Shows:    a nonclustered index: Index Seek plus a Key Lookup per row.
   Requires: SQL Server 2005+ (series: SQL Server 2008+ or Azure SQL)
   Video:    2:00

   Run 01-setup-orders.sql first, in the same query window. */

CREATE NONCLUSTERED INDEX IX_Orders_Customer
    ON #Orders (CustomerID, OrderDate);

-- Same query: an Index Seek finds customer 42's 100 entries, then a
-- Key Lookup per row fetches Amount from the clustered index.
SELECT OrderID, OrderDate, Amount
FROM #Orders
WHERE CustomerID = 42
ORDER BY OrderDate, OrderID;
