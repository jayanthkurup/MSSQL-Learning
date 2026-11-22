/* 02-row-number.sql
   Shows:    ROW_NUMBER: a unique place per row; RunnerID breaks the tie.
   Requires: SQL Server 2005+ (series: SQL Server 2008+ or Azure SQL)
   Video:    1:23

   Run 01-setup-race-results.sql first, in the same query window. */

-- Expected Place: Ana 1, Ben 2, Cara 3, Dev 4, Eli 5, Fay 6, Gus 7, Hal 8.
SELECT Runner, FinishTime,
       ROW_NUMBER() OVER (ORDER BY FinishTime, RunnerID) AS Place
FROM #Results
ORDER BY Place;
