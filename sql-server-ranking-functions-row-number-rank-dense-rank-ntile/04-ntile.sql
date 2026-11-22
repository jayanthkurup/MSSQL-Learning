/* 04-ntile.sql
   Shows:    NTILE(4): split the field into 4 equal heats.
   Requires: SQL Server 2005+ (series: SQL Server 2008+ or Azure SQL)
   Video:    2:28

   Run 01-setup-race-results.sql first, in the same query window. */

-- Expected Heat: 1, 1, 2, 2, 3, 3, 4, 4
SELECT Runner, FinishTime,
       NTILE(4) OVER (ORDER BY FinishTime, RunnerID) AS Heat
FROM #Results
ORDER BY FinishTime, RunnerID;
