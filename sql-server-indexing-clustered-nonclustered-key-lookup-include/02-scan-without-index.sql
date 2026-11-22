/* 02-scan-without-index.sql
   Shows:    one customer's orders with only the clustered index: a Clustered Index Scan.
   Requires: SQL Server 2005+ (series: SQL Server 2008+ or Azure SQL)
   Video:    1:28

   Run 01-setup-orders.sql first, in the same query window. */

-- Customer 42 has exactly 100 orders. With only the clustered index,
-- SQL Server must read every page: a Clustered Index Scan.
SELECT OrderID, OrderDate, Amount
FROM #Orders
WHERE CustomerID = 42
ORDER BY OrderDate, OrderID;
