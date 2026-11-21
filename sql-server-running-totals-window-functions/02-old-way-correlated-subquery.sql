/* 02-old-way-correlated-subquery.sql
   Shows:    the pre-2012 running total: a correlated subquery that re-scans
             every earlier row for each row (cost grows roughly with n squared).
   Requires: any SQL Server version for this query.
   Video:    0:57 The old way: correlated subquery

   Run 01-setup-sample-data.sql first, in this same query window. */

-- Expected RunningTotal: 100, 250, 450, 500, 620, 700
SELECT s.SaleID, s.SaleDate, s.Amount,
       (SELECT SUM(s2.Amount)
        FROM #Sales AS s2
        WHERE s2.SaleDate < s.SaleDate
           OR (s2.SaleDate = s.SaleDate AND s2.SaleID <= s.SaleID)) AS RunningTotal
FROM #Sales AS s
ORDER BY s.SaleDate, s.SaleID;
