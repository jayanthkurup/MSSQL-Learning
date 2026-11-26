/* 10-sargable-date-filters.sql
   Shows:    YEAR()/MONTH() in WHERE vs a half-open range (index scan vs seek), and why not BETWEEN.
   Requires: SQL Server 2008+, or Azure SQL Database / Managed Instance
   Video:    4:55

   Uses a session temp table (#Orders): run the whole file in one
   query window.
   Expected results are in the comments (default us_english language). */

IF OBJECT_ID('tempdb..#Orders') IS NOT NULL DROP TABLE #Orders;

CREATE TABLE #Orders
(
    OrderID   int IDENTITY(1,1) PRIMARY KEY,
    OrderDate datetime2(0)  NOT NULL,
    Amount    decimal(10,2) NOT NULL
);

-- 100,000 orders, one every 15 minutes from 1 January 2023 00:15
WITH n AS
(
    SELECT TOP (100000) CAST(ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS int) AS i
    FROM sys.all_objects AS a CROSS JOIN sys.all_objects AS b
)
INSERT INTO #Orders (OrderDate, Amount)
SELECT DATEADD(minute, 15 * i, CAST('20230101' AS datetime2(0))), i % 500 + 10.00
FROM n;

CREATE INDEX IX_Orders_OrderDate ON #Orders (OrderDate);

-- Turn on the actual execution plan (Ctrl+M) to compare scan and seek.

-- A function on the column: SQL Server must compute YEAR() for every row.
SELECT COUNT(*) AS Orders2024        -- 35,136 rows
FROM #Orders
WHERE YEAR(OrderDate) = 2024;        -- not sargable: Index Scan

-- The same rows as a half-open range on the bare column.
SELECT COUNT(*) AS Orders2024        -- 35,136 rows
FROM #Orders
WHERE OrderDate >= '20240101'
  AND OrderDate <  '20250101';       -- sargable: Index Seek

-- Month: the same idea.
SELECT COUNT(*) AS March2024         -- 2,976 rows
FROM #Orders
WHERE YEAR(OrderDate) = 2024 AND MONTH(OrderDate) = 3;   -- Index Scan

SELECT COUNT(*) AS March2024         -- 2,976 rows: Index Seek
FROM #Orders
WHERE OrderDate >= '20240301'
  AND OrderDate <  '20240401';

-- Why not BETWEEN? '20240331' means midnight at the START of 31 March.
SELECT COUNT(*) AS March2024         -- 2,881 rows: misses most of 31 March
FROM #Orders
WHERE OrderDate BETWEEN '20240301' AND '20240331';
-- Patching the end to '20240331 23:59:59' misses fractions of the last
-- second in datetime2(1..7). For a datetime column, '23:59:59.999'
-- rounds UP to 2024-04-01 00:00:00.000 and adds the next midnight.
-- The half-open range (>= start AND < next start) is right for every type.
GO

-- With parameters (DATEFROMPARTS needs 2012+):
DECLARE @Year int = 2024, @Month int = 3;
DECLARE @From datetime2(0) = DATEFROMPARTS(@Year, @Month, 1);

SELECT COUNT(*) AS OrdersInMonth     -- 2,976 rows
FROM #Orders
WHERE OrderDate >= @From
  AND OrderDate <  DATEADD(month, 1, @From);

-- One exception worth knowing: CAST(OrderDate AS date) = '20240315'
-- can still use an index seek (SQL Server 2008+ rewrites it as a range),
-- but the explicit range is clearer and works the same everywhere.
GO
