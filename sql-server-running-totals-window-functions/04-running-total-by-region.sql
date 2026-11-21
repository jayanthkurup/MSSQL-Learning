/* 04-running-total-by-region.sql
   Shows:    a running total that restarts for each group, using PARTITION BY.
   Requires: SQL Server 2012+ or Azure SQL (PARTITION BY + ORDER BY in OVER).
   Video:    2:35 Running total per group: PARTITION BY

   Run 01-setup-sample-data.sql first, in this same query window. */

-- Expected: East 100, 250, 300; West 200, 320, 400
SELECT Region, SaleID, SaleDate, Amount,
       SUM(Amount) OVER (PARTITION BY Region
                         ORDER BY SaleDate, SaleID
                         ROWS UNBOUNDED PRECEDING) AS RegionTotal
FROM #Sales
ORDER BY Region, SaleDate, SaleID;
