/* 07-grouping-sets.sql
   Shows:    GROUP BY GROUPING SETS: only the totals you list.
   Requires: SQL Server 2008+ (series: SQL Server 2008+ or Azure SQL)
   Video:    3:38

   Run 01-setup-sample-data.sql first, in the same query window. */

-- Expected (5 rows): no Region+Product detail rows.
--   East  NULL    3400.00
--   West  NULL    2300.00
--   NULL  Laptop  3900.00
--   NULL  Phone   1800.00
--   NULL  NULL    5700.00
SELECT Region, Product,
       SUM(Amount) AS Total
FROM #Sales
WHERE SaleDate >= '2025-01-01'
  AND SaleDate <  '2026-01-01'
GROUP BY GROUPING SETS ((Region), (Product), ())
ORDER BY GROUPING(Region), Region,
         GROUPING(Product), Product;
