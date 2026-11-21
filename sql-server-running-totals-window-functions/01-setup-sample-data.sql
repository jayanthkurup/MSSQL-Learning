/* 01-setup-sample-data.sql
   Shows:    the demo table #Sales: 6 sales across 2 regions (East, West).
   Requires: SQL Server 2008+ for this file (date type, multi-row VALUES).
             The series as a whole needs SQL Server 2012+ or Azure SQL.
   Video:    1:32 Demo table (#Sales)

   Run this first. #Sales is a session temp table: run 02-06 in the SAME
   query window. It disappears when you close the session. */

-- Re-run safety. Works on all versions (DROP TABLE IF EXISTS would need 2016+).
IF OBJECT_ID('tempdb..#Sales') IS NOT NULL DROP TABLE #Sales;
CREATE TABLE #Sales
(
    SaleID   int IDENTITY(1,1) PRIMARY KEY,
    Region   varchar(10)   NOT NULL,
    SaleDate date          NOT NULL,
    Amount   decimal(10,2) NOT NULL
);

INSERT INTO #Sales (Region, SaleDate, Amount)
VALUES ('East', '2024-01-01', 100.00),
       ('East', '2024-01-02', 150.00),
       ('West', '2024-01-02', 200.00),
       ('East', '2024-01-03',  50.00),
       ('West', '2024-01-03', 120.00),
       ('West', '2024-01-04',  80.00);
