/* 02-select-where.sql
   Shows:    SELECT + WHERE with a half-open date range (2025 only).
   Requires: SQL Server 2008+ (series: SQL Server 2008+ or Azure SQL)
   Video:    1:15

   Run 01-setup-sample-data.sql first, in the same query window. */

-- Expected: 6 rows (SaleID 4-9).
SELECT SaleID, Region, Product, SaleDate, Amount
FROM #Sales
WHERE SaleDate >= '2025-01-01'
  AND SaleDate <  '2026-01-01';
