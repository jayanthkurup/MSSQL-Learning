/* 01-setup-orders.sql
   Shows:    the demo table #Orders: 100,000 orders, 1,000 customers; turns on STATISTICS IO.
   Requires: SQL Server 2008+ (series: SQL Server 2008+ or Azure SQL)
   Video:    0:52

   Run this first. #Orders is a session temp table: run 02-04 in the
   SAME query window. It disappears when you close the session. */

IF OBJECT_ID('tempdb..#Orders') IS NOT NULL DROP TABLE #Orders;

CREATE TABLE #Orders
(
    OrderID    int IDENTITY(1,1) PRIMARY KEY CLUSTERED,
    CustomerID int           NOT NULL,
    OrderDate  date          NOT NULL,
    Amount     decimal(10,2) NOT NULL,
    Notes      char(200)     NOT NULL DEFAULT ''  -- makes rows wide, like real tables
);

WITH n AS
(
    SELECT TOP (100000) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS i
    FROM sys.all_objects AS a CROSS JOIN sys.all_objects AS b
)
INSERT INTO #Orders (CustomerID, OrderDate, Amount)
SELECT i % 1000 + 1,
       DATEADD(DAY, i % 730, '20240101'),
       i % 500 + 10.00
FROM n;

SET STATISTICS IO ON;   -- shows logical reads for each query in Messages
