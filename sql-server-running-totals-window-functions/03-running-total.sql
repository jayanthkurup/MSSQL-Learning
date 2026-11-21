/* 03-running-total.sql
   Shows:    a running total in one pass with SUM() OVER (ORDER BY ... ROWS UNBOUNDED PRECEDING).
   Requires: SQL Server 2012+ or Azure SQL (ORDER BY / ROWS in OVER for aggregates).
   Video:    1:50 The new way: SUM() OVER (ORDER BY … ROWS)

   Run 01-setup-sample-data.sql first, in this same query window. */

-- Expected RunningTotal: 100, 250, 450, 500, 620, 700
SELECT SaleID, SaleDate, Amount,
       SUM(Amount) OVER (ORDER BY SaleDate, SaleID
                         ROWS UNBOUNDED PRECEDING) AS RunningTotal
FROM #Sales
ORDER BY SaleDate, SaleID;
