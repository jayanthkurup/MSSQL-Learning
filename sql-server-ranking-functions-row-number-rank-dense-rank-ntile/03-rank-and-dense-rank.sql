/* 03-rank-and-dense-rank.sql
   Shows:    RANK (1, 1, 3) vs DENSE_RANK (1, 1, 2) on the same ties.
   Requires: SQL Server 2005+ (series: SQL Server 2008+ or Azure SQL)
   Video:    1:52

   Run 01-setup-race-results.sql first, in the same query window. */

-- Expected Rnk:      1, 1, 3, 4, 5, 6, 6, 8
-- Expected DenseRnk: 1, 1, 2, 3, 4, 5, 5, 6
SELECT Runner, FinishTime,
       RANK()       OVER (ORDER BY FinishTime) AS Rnk,
       DENSE_RANK() OVER (ORDER BY FinishTime) AS DenseRnk
FROM #Results
ORDER BY FinishTime, Runner;
