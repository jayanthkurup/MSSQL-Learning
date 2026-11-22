/* 05-rollup.sql
   Shows:    GROUP BY ROLLUP: per-region subtotals + grand total.
   Requires: SQL Server 2008+ (series: SQL Server 2008+ or Azure SQL)
   Video:    2:36

   Run 01-setup-sample-data.sql first, in the same query window. */

-- Expected (7 rows):
--   East  Laptop  2800.00
--   East  Phone    600.00
--   East  NULL    3400.00   <- East subtotal
--   West  Laptop  1100.00
--   West  Phone   1200.00
--   West  NULL    2300.00   <- West subtotal
--   NULL  NULL    5700.00   <- grand total
SELECT Region, Product,
       SUM(Amount) AS Total
FROM #Sales
WHERE SaleDate >= '2025-01-01'
  AND SaleDate <  '2026-01-01'
GROUP BY ROLLUP (Region, Product)
ORDER BY GROUPING(Region), Region,
         GROUPING(Product), Product;
