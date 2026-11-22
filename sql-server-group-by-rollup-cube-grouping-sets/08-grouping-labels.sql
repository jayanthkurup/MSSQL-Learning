/* 08-grouping-labels.sql
   Shows:    GROUPING() / GROUPING_ID() to label total rows.
   Requires: SQL Server 2008+ (series: SQL Server 2008+ or Azure SQL)
   Video:    4:04

   Run 01-setup-sample-data.sql first, in the same query window. */

-- GROUPING(col) = 1 when the NULL means "all values of col".
-- GROUPING_ID(Region, Product) packs those bits: 0 detail,
-- 1 region subtotal, 3 grand total.
-- Expected (7 rows):
--   East         Laptop        2800.00  0
--   East         Phone          600.00  0
--   East         All products  3400.00  1
--   West         Laptop        1100.00  0
--   West         Phone         1200.00  0
--   West         All products  2300.00  1
--   All regions  All products  5700.00  3
SELECT
  CASE WHEN GROUPING(Region) = 1
       THEN 'All regions' ELSE Region END AS Region,
  CASE WHEN GROUPING(Product) = 1
       THEN 'All products' ELSE Product END AS Product,
  SUM(Amount) AS Total,
  GROUPING_ID(Region, Product) AS Lvl
FROM #Sales
WHERE SaleDate >= '2025-01-01'
  AND SaleDate <  '2026-01-01'
GROUP BY ROLLUP (Region, Product)
ORDER BY GROUPING(Region), Region,
         GROUPING(Product), Product;
