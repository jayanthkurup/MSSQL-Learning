/* 06-cube.sql
   Shows:    GROUP BY CUBE: every combination, adds per-product totals.
   Requires: SQL Server 2008+ (series: SQL Server 2008+ or Azure SQL)
   Video:    3:08

   Run 01-setup-sample-data.sql first, in the same query window. */

-- Expected (9 rows): the 7 ROLLUP rows plus
--   NULL  Laptop  3900.00
--   NULL  Phone   1800.00
SELECT Region, Product,
       SUM(Amount) AS Total
FROM #Sales
WHERE SaleDate >= '2025-01-01'
  AND SaleDate <  '2026-01-01'
GROUP BY CUBE (Region, Product)
ORDER BY GROUPING(Region), Region,
         GROUPING(Product), Product;
