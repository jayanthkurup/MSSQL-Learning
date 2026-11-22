/* 04-covering-index-include.sql
   Shows:    INCLUDE makes it covering: Index Seek only, no lookups, no sort.
   Requires: SQL Server 2005+ (series: SQL Server 2008+ or Azure SQL)
   Video:    3:02

   Run 01-setup-orders.sql first, in the same query window. */

CREATE NONCLUSTERED INDEX IX_Orders_Customer
    ON #Orders (CustomerID, OrderDate)
    INCLUDE (Amount)
    WITH (DROP_EXISTING = ON);

-- Same query: Index Seek only. No Key Lookup, and no sort: the index
-- is already in CustomerID, OrderDate, OrderID order (a nonunique
-- nonclustered index carries the clustered key, OrderID, in its key).
SELECT OrderID, OrderDate, Amount
FROM #Orders
WHERE CustomerID = 42
ORDER BY OrderDate, OrderID;

SET STATISTICS IO OFF;
