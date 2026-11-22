/* 04-having.sql
   Shows:    HAVING filters groups; WHERE filters rows.
   Requires: any version (series: SQL Server 2008+ or Azure SQL)
   Video:    2:14

   Run 01-setup-sample-data.sql first, in the same query window. */

-- Expected: East Phone (600.00) is gone; 3 rows remain.
SELECT Region, Product,
       SUM(Amount) AS Total
FROM #Sales
WHERE SaleDate >= '2025-01-01'
  AND SaleDate <  '2026-01-01'
GROUP BY Region, Product
HAVING SUM(Amount) > 1000
ORDER BY Region, Product;
