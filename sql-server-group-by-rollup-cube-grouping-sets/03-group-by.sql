/* 03-group-by.sql
   Shows:    GROUP BY Region, Product with COUNT(*) and SUM().
   Requires: any version (series: SQL Server 2008+ or Azure SQL)
   Video:    1:45

   Run 01-setup-sample-data.sql first, in the same query window. */

-- Expected:
--   East  Laptop  2  2800.00
--   East  Phone   1   600.00
--   West  Laptop  1  1100.00
--   West  Phone   2  1200.00
SELECT Region, Product,
       COUNT(*)    AS Sales,
       SUM(Amount) AS Total
FROM #Sales
WHERE SaleDate >= '2025-01-01'
  AND SaleDate <  '2026-01-01'
GROUP BY Region, Product
ORDER BY Region, Product;
