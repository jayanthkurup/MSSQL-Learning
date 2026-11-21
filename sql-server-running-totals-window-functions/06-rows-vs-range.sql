/* 06-rows-vs-range.sql
   Shows:    the gotcha. With no frame, the default is RANGE UNBOUNDED PRECEDING,
             which adds rows with tied ORDER BY values together. Always write ROWS
             and give ORDER BY a unique tie-breaker.
   Requires: SQL Server 2012+ or Azure SQL.
   Video:    3:28 Gotcha: the default RANGE frame

   Run 01-setup-sample-data.sql first, in this same query window. */

-- Expected DefaultRange: 100, 450, 450, 620, 620, 700
-- Expected ExplicitRows: 100, 250, 450, 500, 620, 700
SELECT SaleID, SaleDate, Amount,
       SUM(Amount) OVER (ORDER BY SaleDate)                                  AS DefaultRange,
       SUM(Amount) OVER (ORDER BY SaleDate, SaleID ROWS UNBOUNDED PRECEDING) AS ExplicitRows
FROM #Sales
ORDER BY SaleDate, SaleID;
